# BMT (Ball Maintenance Tracker) - Complete Testing Checklist

**Version:** 1.2.12+34
**Last Updated:** 2025-10-18

This checklist should be completed in order after every app modification to ensure all features work correctly.

---

## Pre-Test Setup

- [ ] Fresh install of latest version
- [ ] Clear app data (or use fresh device/emulator)
- [ ] Note device: Android / iOS / Web
- [ ] Note version being tested: __________

---

## 1. INITIAL LAUNCH & NAVIGATION

### 1.1 First Launch
- [ ] App launches without errors
- [ ] Home screen displays empty state message
- [ ] Background image loads correctly
- [ ] Navigation buttons are visible and clickable

### 1.2 Navigation Bar
- [ ] "Add Ball" button (FAB) is visible
- [ ] Tapping FAB navigates to Add Ball screen
- [ ] Back button returns to home
- [ ] Settings icon in app bar works
- [ ] Settings screen loads

---

## 2. SETTINGS CONFIGURATION

### 2.1 Default Maintenance Intervals
- [ ] All fields display default values:
  - Deep Clean: 18 games
  - Oil Extract: 70 games
  - Resurface Urethane: 90 games
  - Resurface Reactive Solid: 70 games
  - Resurface Reactive Pearl: 80 games
  - Resurface Reactive Hybrid: 80 games

### 2.2 Modify Settings
- [ ] Change Deep Clean to: 20
- [ ] Change Oil Extract to: 75
- [ ] Change all resurface intervals to: 100
- [ ] Tap "SAVE"
- [ ] Success message appears
- [ ] Navigate back to home
- [ ] Return to Settings
- [ ] Verify all changes were saved

### 2.3 Settings Validation
- [ ] Try to save empty field → Error message appears
- [ ] Try to save "0" → Error message appears
- [ ] Try to save "-5" → Error message appears
- [ ] Try to save "abc" → Error message appears
- [ ] Cancel button returns to home without saving

### 2.4 Legal Pages
- [ ] Tap "Privacy Policy" → Page loads correctly
- [ ] Back button returns to Settings
- [ ] Tap "Terms of Service" → Page loads correctly
- [ ] Back button returns to Settings

---

## 3. ADD BALL - MANUAL ENTRY

### 3.1 Basic Ball Entry
- [ ] Navigate to Add Ball screen
- [ ] Leave Name empty and tap SAVE → Validation error appears
- [ ] Enter Ball Name: "Test Ball 1"
- [ ] Enter Brand: "Storm"
- [ ] Select Weight: 15 lbs
- [ ] Select Coverstock: "Reactive Solid"
- [ ] Enter Factory Finish: "1500 polished"
- [ ] Enter Serial Number: "SN12345"
- [ ] Tap SAVE
- [ ] Success message appears
- [ ] Ball appears on home screen
- [ ] Ball shows correct name and brand

### 3.2 Add Ball with Photo
- [ ] Navigate to Add Ball screen
- [ ] Tap photo placeholder
- [ ] Select "Choose from Gallery" (or "Take Photo" if using device camera)
- [ ] Select/take an image
- [ ] Image appears in placeholder
- [ ] Complete form with:
  - Name: "Test Ball 2"
  - Brand: "Hammer"
  - Weight: 14 lbs
  - Coverstock: "Reactive Pearl"
- [ ] Tap SAVE
- [ ] Ball appears on home screen with image thumbnail

### 3.3 Add Ball with Advanced Specs
- [ ] Navigate to Add Ball screen
- [ ] Enter Name: "Test Ball 3"
- [ ] Expand "Advanced Specifications"
- [ ] Enter RG (Factory): 2.48
- [ ] Enter Differential (Factory): 0.051
- [ ] Enter RG (After Drilling): 2.50
- [ ] Enter Differential (After Drilling): 0.048
- [ ] Tap SAVE
- [ ] Ball saves successfully

### 3.4 Add Ball with PAP Configuration
- [ ] Navigate to Add Ball screen
- [ ] Enter Name: "Test Ball 4"
- [ ] Expand "PAP Configuration"
- [ ] Enter PAP Over: 4.5
- [ ] Enter PAP Up: 0.5
- [ ] Select PAP Unit: in
- [ ] Select PAP Hand: Right
- [ ] Tap SAVE
- [ ] Ball saves successfully

### 3.5 Add Ball with Custom Maintenance Intervals
- [ ] Navigate to Add Ball screen
- [ ] Enter Name: "Test Ball 5"
- [ ] Select Coverstock: "Urethane"
- [ ] Expand "Maintenance Schedule Override"
- [ ] Check "Custom Deep Clean Schedule"
- [ ] Enter Deep Clean Games: 25
- [ ] Check "Custom Oil Extract Schedule"
- [ ] Enter Oil Extract Games: 80
- [ ] Check "Custom Resurface Schedule"
- [ ] Enter Resurface Games: 120
- [ ] Tap SAVE
- [ ] Ball saves successfully

### 3.6 Cancel Add Ball
- [ ] Navigate to Add Ball screen
- [ ] Enter some data
- [ ] Tap CANCEL
- [ ] Return to home screen
- [ ] Verify ball was NOT added

---

## 4. BALL SEARCH (BOWWWL.COM API)

### 4.1 Initial Search Load
- [ ] Navigate to Add Ball screen
- [ ] Tap "Search Ball Database"
- [ ] Search screen loads
- [ ] Initial ball list displays (first page)
- [ ] Loading indicator appears briefly
- [ ] No errors occur

### 4.2 Search by Name
- [ ] In search field, type: "Phaze"
- [ ] Tap Search button (or press Enter)
- [ ] Loading indicator with progress appears
- [ ] Results filter to show only balls with "Phaze" in name
- [ ] Results show ball images (thumbnails)
- [ ] Results show brand names
- [ ] Results show coverstock/core info chips

### 4.3 Filter by Brand
- [ ] Clear search field (if not empty)
- [ ] Open "Filter by Brand" dropdown
- [ ] Select "Storm"
- [ ] Search automatically executes
- [ ] Results show only Storm balls
- [ ] Verify multiple Storm balls appear

### 4.4 Combined Search
- [ ] Enter search term: "hyroad"
- [ ] Keep brand filter: "Storm"
- [ ] Tap Search
- [ ] Results show Storm balls with "hyroad" in name

### 4.5 Clear Filters
- [ ] Tap "Clear filters" icon in app bar
- [ ] Search field clears
- [ ] Brand filter resets to "All Brands"
- [ ] Initial results reload

### 4.6 Select Ball from Search
- [ ] Search for: "Alert" (or any specific ball)
- [ ] Tap on a search result
- [ ] **VERIFY: No grey screen appears**
- [ ] Return to Add Ball screen
- [ ] Verify fields auto-populated:
  - Ball Name filled
  - Brand filled (if available)
  - Coverstock selected (if available)
  - Weight selected (if available)
  - Factory Finish filled (if available)
  - RG Factory filled (if available)
  - Differential Factory filled (if available)
- [ ] **VERIFY: Ball image appears in photo area**
- [ ] **VERIFY: Success snackbar appears**
- [ ] Optionally modify name (e.g., add "My Alert")
- [ ] Tap SAVE
- [ ] Ball saves with all data and image

### 4.7 Search Error Handling
- [ ] Enable airplane mode (or disconnect internet)
- [ ] Navigate to Ball Search
- [ ] Verify error message displays
- [ ] Tap "Retry" button
- [ ] Re-enable internet
- [ ] Tap "Retry" again
- [ ] Search loads successfully

---

## 5. VIEW & EDIT BALLS

### 5.1 View Ball List
- [ ] On home screen, verify all added balls appear
- [ ] Each ball card shows:
  - Ball name
  - Brand (if entered)
  - Image thumbnail (if has image)
  - Weight indicator
  - Coverstock indicator

### 5.2 View Ball Details
- [ ] Tap on any ball card
- [ ] Ball detail screen opens
- [ ] All ball information displays correctly
- [ ] Maintenance section shows:
  - Deep Clean status
  - Oil Extract status
  - Resurface status
  - Games played / Games until due
- [ ] Navigation tabs visible (if applicable)

### 5.3 Edit Ball
- [ ] From ball detail screen, tap Edit icon (or Edit button)
- [ ] Edit Ball screen opens with all data populated
- [ ] Modify Ball Name: Add "(Edited)" to end
- [ ] Modify Weight: Change to different weight
- [ ] Tap SAVE
- [ ] Success message appears
- [ ] Return to ball detail
- [ ] Verify changes appear

### 5.4 Edit Ball with Ball Search
- [ ] Tap Edit on any ball
- [ ] Tap "Search Ball Database"
- [ ] Select a different ball
- [ ] **VERIFY: No grey screen**
- [ ] **VERIFY: Fields update with new ball data**
- [ ] **VERIFY: Image updates**
- [ ] Tap SAVE
- [ ] Changes save successfully

### 5.5 Delete Ball
- [ ] From ball detail screen, find Delete option
- [ ] Tap Delete
- [ ] Confirmation dialog appears
- [ ] Tap CANCEL → Ball not deleted
- [ ] Tap Delete again
- [ ] Tap CONFIRM/DELETE
- [ ] Ball is deleted
- [ ] Return to home screen
- [ ] Ball no longer appears in list

---

## 6. GAME LOGGING

### 6.1 Add Game (If feature exists)
- [ ] Select a ball from home screen
- [ ] Navigate to Games tab (or Add Game)
- [ ] Tap "Add Game" button
- [ ] Enter game details:
  - Date: (Today's date)
  - Score: 225
  - Number of games: 3
  - Location: "Test Bowling Alley"
- [ ] Tap SAVE
- [ ] Game appears in list
- [ ] Ball's total games count increases by 3

### 6.2 View Game History
- [ ] View list of games for the ball
- [ ] Games display with date, score, location
- [ ] Games sorted by date (newest first)

### 6.3 Edit Game
- [ ] Tap on a game entry
- [ ] Edit game screen opens
- [ ] Change Score to: 245
- [ ] Tap SAVE
- [ ] Game updates in list

### 6.4 Delete Game
- [ ] Tap Delete on a game
- [ ] Confirm deletion
- [ ] Game removed from list
- [ ] Ball's total games count decreases

---

## 7. MAINTENANCE TRACKING

### 7.1 View Maintenance Status
- [ ] Select a ball with games logged
- [ ] View maintenance section
- [ ] Verify each maintenance type shows:
  - Games played since last maintenance
  - Games until next due
  - Status indicator (green/yellow/red)

### 7.2 Record Deep Clean
- [ ] Tap "Record Deep Clean" (or similar)
- [ ] Select date (default to today)
- [ ] Optionally add notes
- [ ] Tap SAVE
- [ ] Maintenance record appears
- [ ] "Games since last deep clean" resets to 0
- [ ] "Next due" updates correctly

### 7.3 Record Oil Extract
- [ ] Tap "Record Oil Extract"
- [ ] Complete form and save
- [ ] Verify oil extract counter resets

### 7.4 Record Resurface
- [ ] Tap "Record Resurface"
- [ ] Complete form and save
- [ ] Verify resurface counter resets

### 7.5 View Maintenance History
- [ ] Navigate to maintenance history
- [ ] All maintenance records display
- [ ] Records show type, date, and notes
- [ ] Records sorted by date

### 7.6 Edit Maintenance Record
- [ ] Tap on a maintenance record
- [ ] Edit date or notes
- [ ] Save changes
- [ ] Changes appear in list

### 7.7 Delete Maintenance Record
- [ ] Delete a maintenance record
- [ ] Confirm deletion
- [ ] Record removed
- [ ] Counters recalculate based on remaining history

---

## 8. DATA EXPORT

### 8.1 Export Data (Android/iOS)
- [ ] Navigate to Settings
- [ ] Tap "Export Data"
- [ ] File picker dialog appears
- [ ] Choose save location
- [ ] Enter filename (or use default)
- [ ] Tap SAVE
- [ ] **VERIFY: Success message appears**
- [ ] **VERIFY: No error about "bytes required"**
- [ ] Navigate to saved file location
- [ ] Verify JSON file exists
- [ ] File size > 0 bytes

### 8.2 Export Data (Web)
- [ ] (If testing on web) Navigate to Settings
- [ ] Tap "Export Data"
- [ ] Browser download starts automatically
- [ ] JSON file downloads to default folder
- [ ] Verify file exists and has content

### 8.3 Verify Export Contents
- [ ] Open exported JSON file in text editor
- [ ] Verify file contains:
  - `balls` array with all ball data
  - `games` array with all game data
  - `maintenance` array with all maintenance records
  - `settings` object with configuration
- [ ] Verify sensitive data is NOT present (if applicable)
- [ ] Verify images are included as base64 (if applicable)

---

## 9. DATA IMPORT

### 9.1 Import Valid Data
- [ ] Navigate to Settings
- [ ] Tap "Import Data"
- [ ] File picker appears
- [ ] Select the JSON file exported in step 8
- [ ] Tap OPEN/SELECT
- [ ] Success message appears with import summary
- [ ] Navigate to home screen
- [ ] Verify all balls are present (including newly imported)
- [ ] Check for duplicates (should merge intelligently)
- [ ] Verify game logs imported
- [ ] Verify maintenance records imported

### 9.2 Import Error Handling
- [ ] Create a text file with invalid JSON: `{ "invalid": }`
- [ ] Try to import this file
- [ ] Verify error message appears
- [ ] App doesn't crash
- [ ] Try to import a .txt file
- [ ] Verify appropriate error message

### 9.3 Import Overwrite Behavior
- [ ] Note current number of balls
- [ ] Export data
- [ ] Add 1 new ball
- [ ] Import the exported file
- [ ] Verify behavior (merge or replace - document what happens)

---

## 10. PURGE DATA

### 10.1 Cancel Purge
- [ ] Navigate to Settings
- [ ] Tap "Purge All Data"
- [ ] Warning dialog appears
- [ ] Read warning message (verify it's clear)
- [ ] Tap CANCEL
- [ ] Dialog closes
- [ ] Return to home screen
- [ ] Verify data still exists

### 10.2 Purge with Wrong Confirmation
- [ ] Navigate to Settings
- [ ] Tap "Purge All Data"
- [ ] In confirmation field, type: "delete1" (wrong text)
- [ ] Tap PURGE DATA
- [ ] Verify action is rejected (or dialog doesn't close)

### 10.3 Successful Purge
- [ ] Navigate to Settings
- [ ] Tap "Purge All Data"
- [ ] In confirmation field, type exactly: "delete"
- [ ] Tap PURGE DATA
- [ ] Success/warning message appears
- [ ] Return to home screen
- [ ] Verify all balls are deleted
- [ ] Verify empty state message appears
- [ ] Navigate to Settings
- [ ] Verify settings reset to defaults

---

## 11. EDGE CASES & ERROR HANDLING

### 11.1 Network Connectivity
- [ ] Disable internet connection
- [ ] Try to use Ball Search → Error message displays
- [ ] Try to load ball images → Placeholder shows
- [ ] Re-enable internet
- [ ] Retry ball search → Works correctly

### 11.2 Form Validation
- [ ] Test all required fields with empty values
- [ ] Test numeric fields with letters
- [ ] Test numeric fields with special characters
- [ ] Test negative numbers where not allowed
- [ ] Verify all validation messages are clear

### 11.3 Image Handling
- [ ] Add ball with very large image → Verify it compresses
- [ ] Add ball with small image → Verify it displays
- [ ] Add ball with corrupted image → Verify error handling
- [ ] Ball search image fails to load → Verify placeholder shows
- [ ] Verify images display correctly on all screen sizes

### 11.4 Long Text Handling
- [ ] Add ball with very long name (100+ characters)
- [ ] Add ball with very long brand name
- [ ] Verify text truncates with ellipsis where needed
- [ ] Verify no text overflow issues

### 11.5 Special Characters
- [ ] Add ball with special characters in name: "Test's Ball #2 (Pro)"
- [ ] Add notes with emoji: "Great ball! 🎳"
- [ ] Export and import data
- [ ] Verify special characters preserved

### 11.6 Large Dataset
- [ ] Add 20+ balls to app
- [ ] Verify scrolling works smoothly
- [ ] Verify search/filter performance
- [ ] Export data → Verify file size reasonable
- [ ] Import data back → Verify all data loads

---

## 12. UI/UX POLISH

### 12.1 Visual Consistency
- [ ] All screens use consistent color scheme
- [ ] Background image displays on all screens
- [ ] Buttons have consistent styling
- [ ] Cards have consistent spacing and shadows
- [ ] Font sizes are consistent

### 12.2 Animations & Transitions
- [ ] Screen transitions are smooth
- [ ] Button presses show ripple effect
- [ ] Loading indicators appear for slow operations
- [ ] Snackbar messages appear and disappear smoothly
- [ ] No jarring or delayed animations

### 12.3 Responsive Design
- [ ] Rotate device to landscape → UI adapts properly
- [ ] Test on small screen device → Everything fits
- [ ] Test on large screen/tablet → No awkward spacing
- [ ] Bottom navigation stays accessible
- [ ] No overlapping elements

### 12.4 Accessibility (Basic)
- [ ] All buttons are large enough to tap easily
- [ ] Contrast ratios are readable
- [ ] Error messages are clear and visible
- [ ] Important actions have confirmation dialogs

---

## 13. PLATFORM-SPECIFIC TESTS

### 13.1 Android Only
- [ ] Back button navigation works correctly
- [ ] Verify permissions (storage, camera) requested properly
- [ ] Test file picker integration
- [ ] Test share functionality (if applicable)
- [ ] Verify app doesn't crash on rotation
- [ ] Test with different Android versions (if possible)

### 13.2 iOS Only
- [ ] (If applicable) Test on iOS device
- [ ] Verify iOS-specific UI patterns
- [ ] Test file picker integration
- [ ] Test share functionality
- [ ] Verify proper handling of iOS permissions

### 13.3 Web Only
- [ ] Test in Chrome
- [ ] Test in Firefox
- [ ] Test in Safari (if on Mac)
- [ ] Verify responsive breakpoints
- [ ] Test download/upload functionality
- [ ] Verify no CORS errors in console
- [ ] Test with browser dev tools (check for errors)

---

## 14. REGRESSION CHECKS (After Bug Fixes)

### 14.1 Grey Screen Issue (FIXED in v1.2.9-1.2.11)
- [ ] Navigate to Ball Search
- [ ] Select any ball from search results
- [ ] **CRITICAL: Verify NO grey screen appears**
- [ ] **CRITICAL: Verify form populates immediately**
- [ ] **CRITICAL: Verify ball image loads**
- [ ] Test with 5 different balls to ensure consistency

### 14.2 Image Display Issue (FIXED in v1.2.11)
- [ ] Select ball from search with image
- [ ] **CRITICAL: Verify image displays in form**
- [ ] **CRITICAL: Verify no "type 'Null' is not a subtype of type 'Uint8List'" error**
- [ ] Save ball and view in list
- [ ] Verify image thumbnail shows

### 14.3 Export Issue (FIXED in v1.2.12)
- [ ] Export data on Android
- [ ] **CRITICAL: Verify NO "bytes required" error**
- [ ] **CRITICAL: Verify file saves successfully**
- [ ] Verify file can be opened and contains data

---

## 15. PERFORMANCE & STABILITY

### 15.1 Memory Leaks
- [ ] Navigate between screens 20+ times
- [ ] App doesn't slow down
- [ ] No memory warnings/crashes

### 15.2 Battery Usage
- [ ] Leave app open for 10+ minutes
- [ ] Verify no excessive battery drain
- [ ] Verify app suspends properly in background

### 15.3 Crash Recovery
- [ ] Force close app mid-operation
- [ ] Reopen app
- [ ] Verify data integrity
- [ ] Verify no corrupted state

---

## POST-TEST CHECKLIST

- [ ] All critical features work correctly
- [ ] No crashes encountered
- [ ] No data loss observed
- [ ] All regressions fixed (grey screen, images, export)
- [ ] Performance is acceptable
- [ ] Ready for release: YES / NO

---

## NOTES SECTION

**Testing Date:** ___________
**Tester Name:** ___________
**Device/Platform:** ___________
**Issues Found:**

1.
2.
3.

**Additional Comments:**


---

## VERSION HISTORY

- **v1.2.12** - Export fix for Android (bytes parameter)
- **v1.2.11** - Image display fix for mobile (base64 support)
- **v1.2.10** - Re-enabled automatic ball image download
- **v1.2.9** - Fixed grey screen via post-frame callback in navigation
- **v1.2.8** - Debug logging version
- **v1.2.7** - Attempted grey screen fix
- **v1.2.6** - Non-blocking image download attempt
- **v1.2.5** - Image download disabled (successful grey screen fix temporarily)
- **v1.2.4** - Enhanced error handling
- **v1.2.3** - setState wrapper
- **v1.2.2** - Added INTERNET permission for Android
- **v1.2.1** - CORS proxy fix for mobile
- **v1.2.0** - Bowwwl.com API integration complete

---

**CRITICAL TESTS (Must pass every time):**
1. Ball Search → Select Ball → **NO GREY SCREEN**
2. Ball Search → Select Ball → **IMAGE DISPLAYS**
3. Export Data → **NO BYTES ERROR**
4. Import Data → **DATA RESTORES CORRECTLY**
5. Add/Edit/Delete Ball → **ALL WORK CORRECTLY**
