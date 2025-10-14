# BallCare - Ball Maintenance Tracker

A Flutter web and Android application for tracking bowling ball maintenance, game logs, and performance metrics.

## Features

- **Ball Management**: Track multiple bowling balls with detailed specifications
  - Ball name, brand, weight, surface, and core type
  - Photo upload support
  - PAP (Positive Axis Point) measurements in inches or centimeters

- **Game Logging**: Record your bowling sessions
  - Date and game count tracking (supports decimal values like 4.5 games)
  - Automatic calculation of games since last maintenance

- **Maintenance Tracking**: Monitor three types of maintenance
  - Deep Clean
  - Oil Extraction
  - Resurface
  - Visual progress indicators for each maintenance type
  - Automatic status calculation (Good, Due Soon, Overdue)

- **Configurable Settings**: Customize maintenance intervals
  - Set game thresholds for each maintenance type
  - Persistent settings stored locally

- **Reactive UI**: Real-time updates
  - Progress rings automatically update when games are logged
  - Maintenance status recalculated instantly
  - StreamBuilder architecture for reactive data flow

## Screenshots

*Coming soon*

## Technology Stack

- **Framework**: Flutter 3.x
- **State Management**: Riverpod
- **Database**: Drift (SQLite for web and mobile)
- **Navigation**: GoRouter
- **Platform Support**: Web and Android

## Version

Current Version: **v1.1.004**

## Getting Started

### Prerequisites

- Flutter SDK 3.9.2 or later
- Dart SDK
- For Android builds: Android Studio and Java JDK 11+

### Installation

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/ball_care.git
cd ball_care
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate Drift database code:
```bash
dart run build_runner build
```

4. Run the app:

**For web:**
```bash
flutter run -d chrome
# Or for web server:
flutter run -d web-server --web-port=9005
```

**For Android:**
```bash
flutter run
```

## Deployment

See detailed deployment instructions:
- **[DEPLOYMENT.md](DEPLOYMENT.md)** - Complete guide for web hosting (GitHub Pages + Cloudflare) and Android APK builds
- **[QUICK_DEPLOY.md](QUICK_DEPLOY.md)** - Quick reference for common deployment commands

### Quick Deploy

**Web (GitHub Pages):**
```bash
flutter build web --base-href "/ball_care/" --release
gh-pages -d build/web
```

**Android APK:**
```bash
flutter build apk --split-per-abi --release
```

## Project Structure

```
lib/
├── core/
│   ├── constants/       # App version and constants
│   └── theme/           # App theme configuration
├── data/
│   ├── database/        # Drift database definition
│   ├── models/          # Data models
│   ├── repositories/    # Data access layer
│   └── providers/       # Riverpod providers
├── presentation/
│   ├── screens/         # App screens
│   └── widgets/         # Reusable widgets
└── main.dart            # App entry point

web/
├── index.html           # Web app entry
├── sqlite3.wasm         # SQLite WebAssembly
└── drift_worker.js      # Drift web worker

android/                 # Android-specific code
```

## Database Schema

The app uses a local SQLite database with the following tables:

- **balls**: Bowling ball information
- **game_logs**: Game session records
- **maintenance_records**: Maintenance history
- **kv_store**: Key-value store for settings

All data is stored locally on the device/browser. No backend server required.

## Development

### Running in Debug Mode

```bash
flutter run
```

### Hot Reload

Press `r` in the terminal to hot reload.
Press `R` for hot restart.

### Building for Production

See [DEPLOYMENT.md](DEPLOYMENT.md) for complete build instructions.

## Troubleshooting

### Web: Database errors
- Ensure `sqlite3.wasm` and `drift_worker.js` are in the `web/` directory
- Clear browser cache and reload

### Android: Build errors
- Run `flutter clean` and `flutter pub get`
- Ensure Android SDK is properly configured

### Database not persisting
- Web: Data is stored in browser's IndexedDB (clearing browser data will delete it)
- Android: Data is stored in app's internal storage

## Contributing

This is a personal project, but feedback and suggestions are welcome!

## License

This project is private and not licensed for public use.

## Acknowledgments

- Built with Flutter and Dart
- Database powered by Drift
- Icons from Material Design

## Support

For issues or questions, please open an issue in the repository.

---

**Current Version**: v1.1.004
**Last Updated**: October 2025
**Platform**: Web & Android
