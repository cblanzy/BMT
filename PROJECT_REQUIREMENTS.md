# BallCare - Bowling Ball Maintenance Tracker
## Complete Project Requirements Document

---

## Project Overview

### Purpose
Create a Flutter web application that helps bowlers track their bowling ball collection, monitor usage, and manage maintenance schedules. The app calculates when each ball needs cleaning, oil extraction, or resurfacing based on the number of games bowled.

### Target Platform
- **Primary**: Web application (Flutter Web)
- **Future**: Mobile apps (iOS/Android)

### Tech Stack Requirements
- **Framework**: Flutter
- **Database**: Drift (SQLite with Stream support for reactive UI)
- **State Management**: Riverpod
- **Routing**: GoRouter
- **Language**: Dart

---

## Core Concepts

### Bowling Ball Maintenance
Bowling balls require regular maintenance based on usage:

1. **Deep Clean** (Surface cleaning)
   - Removes dirt and lane oil from surface
   - Typical interval: Every 18 games (configurable)

2. **Oil Extract** (Deep cleaning)
   - Removes absorbed oil from coverstock
   - Typical interval: Every 70 games (configurable)

3. **Resurface** (Surface restoration)
   - Restores original surface texture using sanding/polishing
   - Interval varies by coverstock type:
     - Urethane: 90 games
     - Reactive Solid: 70 games
     - Reactive Pearl: 80 games
     - Reactive Hybrid: 80 games
   - Includes grit sequence tracking (e.g., "500, 1000, 2000, polish")

### Key Tracking Metrics
- **Game Logs**: Track each bowling session (date, center, number of games)
- **Games Since Maintenance**: Calculate games bowled since last maintenance of each type
- **Maintenance Status**: Visual indicators showing % toward next maintenance
  - Green: 0-79% (good condition)
  - Yellow: 80-100% (due soon)
  - Red: >100% (overdue)

---

## Database Schema

### Table: balls
**Purpose**: Store bowling ball specifications and configuration

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| ball_id | TEXT | Yes | Primary key (UUID) |
| name | TEXT | Yes | Ball name/model |
| brand | TEXT | No | Manufacturer (Storm, Brunswick, etc.) |
| coverstock | TEXT | No | Type: urethane, reactive_solid, reactive_pearl, reactive_hybrid |
| factory_finish | TEXT | No | Original surface finish (e.g., "1500 polished") |
| rg_factory | REAL | No | Radius of Gyration (factory spec) |
| diff_factory | REAL | No | Differential (factory spec) |
| rg_after | REAL | No | RG after drilling |
| diff_after | REAL | No | Differential after drilling |
| pap_over | REAL | No | PAP measurement - Over distance |
| pap_up | REAL | No | PAP measurement - Up distance |
| pap_unit | TEXT | Yes | Unit: 'in' or 'cm' (default: 'in') |
| pap_hand | TEXT | No | Hand used: 'left', 'right', 'unknown' |
| spec_source | TEXT | No | Where specs came from |
| spec_confidence | REAL | No | Confidence in spec accuracy (0-1) |
| weight_lb | REAL | No | Ball weight in pounds (10-16) |
| serial | TEXT | No | Serial number |
| image_local_path | TEXT | No | File path (for mobile) |
| image_url | TEXT | No | Remote image URL |
| image_base64 | TEXT | No | Base64 encoded image (for web) |
| deep_clean_games | INT | No | Override default interval |
| oil_extract_games | INT | No | Override default interval |
| resurface_games | INT | No | Override default interval |
| created_at | INT | Yes | Timestamp (milliseconds) |
| updated_at | INT | Yes | Timestamp (milliseconds) |

**Constraints**:
- Primary key: ball_id

### Table: game_logs
**Purpose**: Track bowling sessions and game counts

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| log_id | TEXT | Yes | Primary key (UUID) |
| ball_id | TEXT | Yes | Foreign key to balls.ball_id |
| date | INT | Yes | Session date (timestamp in milliseconds) |
| center | TEXT | No | Bowling center name |
| games | REAL | Yes | Number of games (supports decimals) |
| notes | TEXT | No | Additional notes |
| created_at | INT | Yes | Timestamp (milliseconds) |

**Constraints**:
- Primary key: log_id
- Foreign key: ball_id REFERENCES balls(ball_id) ON DELETE CASCADE

### Table: maintenance_records
**Purpose**: Track maintenance history

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| maint_id | TEXT | Yes | Primary key (UUID) |
| ball_id | TEXT | Yes | Foreign key to balls.ball_id |
| type | TEXT | Yes | 'deep_clean', 'oil_extract', 'resurface' |
| date | INT | Yes | Maintenance date (timestamp in milliseconds) |
| notes | TEXT | No | Additional notes |
| grit_sequence | TEXT | No | For resurface: "500, 1000, 2000, polish" |
| created_at | INT | Yes | Timestamp (milliseconds) |

**Constraints**:
- Primary key: maint_id
- Foreign key: ball_id REFERENCES balls(ball_id) ON DELETE CASCADE

### Table: kv_store
**Purpose**: Store app settings and configuration

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| key | TEXT | Yes | Setting key |
| value | TEXT | Yes | Setting value (stored as string) |

**Constraints**:
- Primary key: key

**Default Settings** (initialize on first run):
```
defaults.deep_clean_games: "18"
defaults.oil_extract_games: "70"
defaults.resurface_games.urethane: "90"
defaults.resurface_games.reactive_solid: "70"
defaults.resurface_games.reactive_pearl: "80"
defaults.resurface_games.reactive_hybrid: "80"
schema_version: "3"
```

---

## Core Functionality Requirements

### 1. Ball Management

#### Add Ball
**Screen**: AddBallScreen
**Route**: `/add-ball`

**Form Fields**:
- Name (required, text input)
- Brand (optional, text input)
- Weight (optional, dropdown: 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0 lbs)
- Coverstock (optional, dropdown: Urethane, Reactive Solid, Reactive Pearl, Reactive Hybrid)
- Factory Finish (optional, text input)
- Weight (optional, number input with lbs suffix)
- Serial Number (optional, text input)
- Image Upload (optional, file picker)
  - Web: Store as base64 in image_base64 field
  - Mobile: Store file path in image_local_path field

**Advanced Specs** (collapsible section):
- RG Factory (optional, decimal input)
- Diff Factory (optional, decimal input)
- RG After Drilling (optional, decimal input)
- Diff After Drilling (optional, decimal input)

**PAP Configuration** (collapsible section):
- PAP Over (optional, decimal input)
- PAP Up (optional, decimal input)
- PAP Unit (dropdown: inches, cm)
- PAP Hand (dropdown: Left, Right, Unknown)

**Behavior**:
- Set created_at and updated_at to current timestamp
- Generate UUID for ball_id
- Navigate back to home screen on save
- Show validation errors inline

#### Edit Ball
**Screen**: EditBallScreen
**Route**: `/ball/:id/edit`

**Requirements**:
- Pre-populate all fields with existing ball data
- Same form layout as Add Ball
- Update updated_at timestamp on save
- Navigate back to ball detail screen on save

#### Delete Ball
**Location**: Ball detail screen or edit screen
**Requirements**:
- Show confirmation dialog
- Cascade delete all game_logs and maintenance_records for this ball
- Navigate back to home screen after deletion

#### View Ball Details
**Screen**: BallDetailScreen
**Route**: `/ball/:id`

**Layout**:
- **Header Section**:
  - Square ball image (120x120px) on left
  - Ball name and brand on right
  - Edit button in app bar

- **Progress Indicators** (below header):
  - Three circular progress rings side-by-side
  - Each ring shows:
    - Current games / threshold games
    - Color based on percentage (green/yellow/red)
    - Label below (Deep Clean, Oil Extract, Resurface)

- **Tabbed Content**:
  1. **Specs Tab**:
     - Factory Specifications card
     - Post-Drill Specifications card (if data exists)
     - PAP Configuration card (if data exists)

  2. **Logs Tab**:
     - List of game logs sorted by date (newest first)
     - Each entry shows: date, center name, game count
     - "Add Game Log" button at bottom
     - Empty state: "No game logs yet" with add button

  3. **Maintenance Tab**:
     - List of maintenance records sorted by date (newest first)
     - Each entry shows: type, date, notes, grit sequence (if resurface)
     - "Add Maintenance" button at bottom
     - Empty state: "No maintenance records yet" with add button

### 2. Game Logging

#### Add Game Log
**Screen**: AddGameLogScreen
**Route**: `/ball/:id/add-log`

**Form Fields**:
- Date (required, date picker, default: today)
- Bowling Center (optional, text input)
- Number of Games (required, decimal input, min: 0.5, step: 0.5)
- Notes (optional, multi-line text input)

**Behavior**:
- Generate UUID for log_id
- Set created_at to current timestamp
- Navigate back to ball detail screen (Logs tab) on save
- **Critical**: Trigger UI update of progress rings

#### View Game Logs
**Location**: Ball detail screen, Logs tab

**Display**:
- List sorted by date (newest first)
- Card layout for each log:
  - Circle avatar with game count
  - Center name as title
  - Formatted date as subtitle
  - Game count badge on right

### 3. Maintenance Tracking

#### Add Maintenance Record
**Screen**: AddMaintenanceScreen
**Route**: `/ball/:id/add-maintenance`

**Form Fields**:
- Type (required, dropdown: Deep Clean, Oil Extract, Resurface)
- Date (required, date picker, default: today)
- Notes (optional, multi-line text input)
- Grit Sequence (conditional, shown only if type = Resurface, text input)
  - Placeholder: "500, 1000, 2000, polish"

**Behavior**:
- Generate UUID for maint_id
- Set created_at to current timestamp
- Navigate back to ball detail screen (Maintenance tab) on save
- **Critical**: Trigger UI update of progress rings

#### View Maintenance History
**Location**: Ball detail screen, Maintenance tab

**Display**:
- List sorted by date (newest first)
- Card layout for each record:
  - Icon indicating maintenance type
  - Type name as title
  - Date and notes as subtitle
  - Show grit sequence if type is resurface

### 4. Home Screen

#### Ball List View
**Screen**: HomeScreen
**Route**: `/`

**Layout**:
- App bar with "BallCare" title and settings icon
- Floating action button (+) to add new ball
- Empty state: "No bowling balls yet" with icon and helper text

**Ball Cards** (for each ball):
- Horizontal card layout:
  - Square thumbnail image (60x60px) on left
  - Ball name and brand stacked vertically
  - Three small progress rings below (one for each maintenance type)
- Tap entire card to navigate to ball detail screen

### 5. Settings Screen

#### Maintenance Interval Configuration
**Screen**: SettingsScreen
**Route**: `/settings`

**Settings Groups**:

1. **Deep Clean Interval**
   - Number input field
   - Label: "Games between deep cleans"
   - Default: 18

2. **Oil Extract Interval**
   - Number input field
   - Label: "Games between oil extractions"
   - Default: 70

3. **Resurface Intervals** (by coverstock type)
   - Urethane (number input, default: 90)
   - Reactive Solid (number input, default: 70)
   - Reactive Pearl (number input, default: 80)
   - Reactive Hybrid (number input, default: 80)

**Behavior**:
- Save to kv_store table on change
- Apply to new balls immediately
- Existing balls use their overrides or these defaults
- Show "Settings saved" confirmation

---

## Critical Business Logic

### Maintenance Status Calculation

**Algorithm** (for each maintenance type):

1. Find the most recent maintenance record of this type for the ball
2. If found: Use that maintenance date as cutoff
3. If not found: Use ball creation date as cutoff
4. Sum all games from game_logs where date >= cutoff
5. Get threshold:
   - Check ball's specific override (e.g., ball.deep_clean_games)
   - If null, use default from kv_store
   - For resurface: use coverstock-specific default
6. Calculate percentage: (games_since / threshold) * 100
7. Determine color:
   - Green: < 80%
   - Yellow: 80-100%
   - Red: > 100%

**Return**: MaintenanceStatus object with:
```dart
{
  type: MaintenanceType.deepClean,
  gamesSince: 15.0,
  threshold: 18.0,
  percentage: 83.3,
  status: StatusLevel.warning // green, warning, or critical
}
```

### Reactive UI Updates

**Requirement**: Progress rings must update automatically when game logs are added.

**Implementation**:
- Use **StreamBuilder** to watch game_logs for the specific ball
- When game_logs stream emits new data, trigger re-calculation of maintenance statuses
- Use **FutureBuilder** nested inside StreamBuilder to fetch fresh statuses

**Why**: Ensures UI stays in sync with data changes without manual refreshes.

---

## UI/UX Requirements

### Design Principles
1. **Clean and Minimal**: Focus on essential information
2. **Card-Based Layouts**: Group related information in cards
3. **Color-Coded Status**: Intuitive green/yellow/red system
4. **Mobile-First Responsive**: Works on all screen sizes

### Visual Progress Indicators

#### ProgressRing Widget
**Purpose**: Circular progress indicator for maintenance status

**Properties**:
- Size: 80x80 (home screen), 100x100 (detail screen)
- Ring thickness: 8px
- Center content:
  - Top: Games since (bold number)
  - Bottom: Threshold (smaller text)

**Colors**:
- Green (#4CAF50): < 80%
- Yellow (#FFC107): 80-100%
- Red (#F44336): > 100%

**Behavior**:
- Animate on value change (smooth transition)
- Cap visual progress at 100% (but show actual count in center)

### Image Handling

**Platform-Specific Storage**:
- **Web**: Store base64-encoded image in database (image_base64 field)
- **Mobile**: Store file path in database (image_local_path field), actual image in app documents

**Image Service Requirements**:
```dart
class ImageService {
  // Pick image from device (web: file picker, mobile: gallery/camera)
  Future<String?> pickImage();

  // Save image and return appropriate identifier
  // Web: returns base64 string
  // Mobile: saves to app docs, returns path
  Future<String?> saveImage(File image);

  // Load image for display
  // Web: decodes base64 to Uint8List
  // Mobile: loads File from path
  dynamic getDisplayImage({String? path, String? base64Data});
}
```

**Display Requirements**:
- Show placeholder icon if no image
- Rounded corners (8px for thumbnails, 12px for large)
- Aspect ratio: 1:1 (square)
- Image fit: cover (crop to fill square)

### Navigation Flow

```
Home Screen (/)
├─→ Add Ball (/add-ball)
│   └─→ [Save] → Home Screen
│
├─→ Ball Detail (/ball/:id)
│   ├─→ Edit Ball (/ball/:id/edit)
│   │   └─→ [Save] → Ball Detail
│   │
│   ├─→ Add Game Log (/ball/:id/add-log)
│   │   └─→ [Save] → Ball Detail (Logs tab)
│   │
│   └─→ Add Maintenance (/ball/:id/add-maintenance)
│       └─→ [Save] → Ball Detail (Maintenance tab)
│
└─→ Settings (/settings)
    └─→ [Back] → Home Screen
```

---

## Technical Implementation Details

### State Management with Riverpod

**Providers Needed**:

1. **Database Provider**:
```dart
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});
```

2. **Repository Providers**:
```dart
final ballRepositoryProvider = Provider<BallRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return BallRepository(db);
});

final gameLogRepositoryProvider = Provider<GameLogRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return GameLogRepository(db);
});

final maintenanceRepositoryProvider = Provider<MaintenanceRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return MaintenanceRepository(db);
});
```

### Repository Pattern

**BallRepository** methods:
- `Stream<List<Ball>> watchAllBalls()`
- `Stream<Ball?> watchBallById(String id)`
- `Future<Ball?> getBallById(String id)`
- `Future<void> insertBall(Ball ball)`
- `Future<void> updateBall(Ball ball)`
- `Future<void> deleteBall(String id)`
- `Future<Map<MaintenanceType, MaintenanceStatus>> getAllMaintenanceStatuses(String ballId)`

**GameLogRepository** methods:
- `Stream<List<GameLog>> watchLogsForBall(String ballId)`
- `Future<List<GameLog>> getLogsForBall(String ballId)`
- `Future<void> insertLog(GameLog log)`
- `Future<void> deleteLog(String logId)`

**MaintenanceRepository** methods:
- `Stream<List<Maintenance>> watchMaintenanceForBall(String ballId)`
- `Future<List<Maintenance>> getMaintenanceForBall(String ballId)`
- `Future<void> insertMaintenance(Maintenance record)`
- `Future<void> deleteMaintenance(String maintId)`

### Drift Database Setup

**database.dart** structure:
```dart
@DriftDatabase(tables: [Balls, GameLogs, MaintenanceRecords, KvStore])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connectionFactory());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _initializeDefaults();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle schema migrations
      },
    );
  }

  Future<void> _initializeDefaults() async {
    // Insert default settings into kv_store
  }

  // Core query: Calculate games since last maintenance
  Future<double> getGamesSince({
    required String ballId,
    required String maintenanceType,
  }) async {
    // 1. Find last maintenance of this type
    // 2. Use that date as cutoff (or ball creation date if none)
    // 3. Sum games where date >= cutoff
    // IMPORTANT: Use >= comparison, not > (include games at cutoff time)
  }
}
```

### Platform Detection

Use `kIsWeb` from `package:flutter/foundation.dart`:
```dart
import 'package:flutter/foundation.dart';

if (kIsWeb) {
  // Web-specific code
} else {
  // Mobile-specific code
}
```

### Date Handling

**Storage**: All dates stored as INT (milliseconds since epoch)
**Conversion**:
```dart
// Store
int timestamp = DateTime.now().millisecondsSinceEpoch;

// Retrieve
DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);

// Display
String formatted = DateFormat.yMMMd().format(date); // Jan 15, 2025
```

---

## Development Workflow

### Initial Setup

1. Create Flutter project:
```bash
flutter create ball_care
cd ball_care
```

2. Add dependencies to `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  drift: ^2.14.0
  sqlite3_flutter_libs: ^0.5.0
  path_provider: ^2.1.0
  path: ^1.8.0
  flutter_riverpod: ^2.4.0
  go_router: ^12.0.0
  intl: ^0.19.0
  image_picker: ^1.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  drift_dev: ^2.14.0
  build_runner: ^2.4.0
```

3. Run build_runner for code generation:
```bash
dart run build_runner build --delete-conflicting-outputs
```

4. Start development server (web):
```bash
flutter run -d web-server --web-port=9000
```

### Hot Reload Limitation

**Important**: Flutter web-server mode does NOT support hot reload.
- Every code change requires full server restart
- Kill dart processes and restart server to see changes

**Restart process** (Windows):
```bash
taskkill //F //IM dart.exe
cd ball_care
flutter run -d web-server --web-port=9000
```

---

## Testing Requirements

### Manual Testing Checklist

#### Ball Management
- [ ] Add ball with only required fields (name)
- [ ] Add ball with all fields including image
- [ ] Add ball with different coverstock types
- [ ] Edit ball and verify changes persist
- [ ] Delete ball and verify cascade (logs/maintenance also deleted)
- [ ] Verify ball images display correctly (web: base64)

#### Game Logging
- [ ] Add game log with decimal games (e.g., 2.5)
- [ ] Add multiple game logs to same ball
- [ ] Verify logs appear sorted by date (newest first)
- [ ] Add game log and verify progress rings update immediately

#### Maintenance Tracking
- [ ] Add deep clean record
- [ ] Add oil extract record
- [ ] Add resurface record with grit sequence
- [ ] Verify maintenance records sorted by date
- [ ] Add maintenance and verify progress rings reset

#### Progress Indicators
- [ ] **CRITICAL**: Verify rings are GREEN when < 80% threshold
- [ ] **CRITICAL**: Verify rings turn YELLOW at 80-100%
- [ ] **CRITICAL**: Verify rings turn RED when > 100%
- [ ] Add games and confirm rings update without page refresh
- [ ] Add maintenance and confirm rings reset to low count

#### Settings
- [ ] Change default intervals and verify saved
- [ ] Add new ball and verify it uses updated defaults
- [ ] Verify existing balls keep their settings

#### Edge Cases
- [ ] Ball with no games (rings should show 0)
- [ ] Ball with games but no maintenance records (use creation date)
- [ ] Adding games on same day as ball creation
- [ ] Adding maintenance on same day as games

---

## Known Technical Challenges

### Challenge 1: Reactive Progress Indicators
**Problem**: FutureBuilder only fetches data once. When game logs are added, progress rings don't update.

**Solution**: Wrap FutureBuilder in StreamBuilder that watches game logs:
```dart
StreamBuilder(
  stream: gameLogRepository.watchLogsForBall(ballId),
  builder: (context, gameLogsSnapshot) {
    return FutureBuilder<Map<MaintenanceType, MaintenanceStatus>>(
      future: ballRepository.getAllMaintenanceStatuses(ballId),
      builder: (context, statusSnapshot) {
        // Build progress rings
      },
    );
  },
)
```

### Challenge 2: Date Comparison in Queries
**Problem**: Using `>` (greater than) in SQL excludes games at exact cutoff time.

**Solution**: Use `>=` (greater than or equal) to include games at cutoff:
```dart
// WRONG
..where(gameLogs.date.isBiggerThanValue(cutoffDate))

// CORRECT
..where(gameLogs.date.isBiggerOrEqualValue(cutoffDate))
```

### Challenge 3: Image Storage on Web
**Problem**: Web can't access file system for images.

**Solution**: Store base64-encoded image strings in database for web platform.

### Challenge 4: Multiple Server Restarts
**Problem**: Flutter web doesn't support hot reload; changes require restart.

**Solution**: Always kill existing dart processes before restarting server.

---

## Success Criteria

The project is complete when:

1. ✅ User can add, edit, and delete bowling balls with full specifications
2. ✅ User can add game logs and maintenance records
3. ✅ Progress rings display correct colors based on thresholds
4. ✅ **Progress rings update automatically when games/maintenance added** (no page refresh)
5. ✅ Images display correctly on web platform (base64)
6. ✅ Settings are configurable and persist
7. ✅ All navigation flows work correctly
8. ✅ Cascade deletes work (deleting ball removes logs/maintenance)
9. ✅ Date sorting works correctly (newest first)
10. ✅ Empty states display with helpful messages

---

## Future Enhancements (Out of Scope for Initial Build)

- Edit/delete game logs and maintenance records
- Ball comparison tool
- Performance tracking (scores, pin counts)
- Export data to CSV
- Mobile apps (iOS/Android)
- Cloud sync
- Multiple user accounts
- Lane condition tracking
- Ball inventory management (storage location)
- Maintenance cost tracking
- Ball performance analytics
- Push notifications for due maintenance
- Dark mode

---

## How to Use This Document

### Starting Fresh with Claude

Provide this prompt:
```
I want to build a Flutter web application for tracking bowling ball maintenance.

Please read the complete requirements document at:
C:\Projects\BallMainLog\PROJECT_REQUIREMENTS.md

Create the project from scratch following all specifications in the document.

Start by:
1. Creating the Flutter project structure
2. Setting up dependencies
3. Implementing the database schema with Drift
4. Building the core screens and navigation

Working directory: C:\Projects\BallMainLog
Target server port: 9000
```

### Key Focus Areas for Claude

1. **Database Schema**: Ensure all fields and relationships are correct
2. **Reactive UI**: StreamBuilder wrapping FutureBuilder for progress rings
3. **Date Queries**: Use `>=` not `>` in getGamesSince query
4. **Image Handling**: Platform-specific (base64 for web)
5. **Cascade Deletes**: ON DELETE CASCADE in foreign keys

---

## Project File Structure

Expected final structure:
```
ball_care/
├── lib/
│   ├── main.dart
│   ├── core/
│   │   └── constants/
│   │       └── app_constants.dart
│   ├── data/
│   │   ├── database/
│   │   │   ├── database.dart
│   │   │   ├── database.g.dart (generated)
│   │   │   └── connection/
│   │   │       ├── connection.dart
│   │   │       └── native.dart / web.dart
│   │   ├── models/
│   │   │   └── maintenance_status.dart
│   │   ├── repositories/
│   │   │   ├── ball_repository.dart
│   │   │   ├── game_log_repository.dart
│   │   │   └── maintenance_repository.dart
│   │   └── services/
│   │       └── image_service.dart
│   └── presentation/
│       ├── router/
│       │   └── app_router.dart
│       ├── screens/
│       │   ├── home_screen.dart
│       │   ├── ball_detail_screen.dart
│       │   ├── add_ball_screen.dart
│       │   ├── edit_ball_screen.dart
│       │   ├── add_game_log_screen.dart
│       │   ├── add_maintenance_screen.dart
│       │   └── settings_screen.dart
│       └── widgets/
│           └── progress_ring.dart
├── pubspec.yaml
└── README.md
```

---

**End of Requirements Document**