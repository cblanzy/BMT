# Quick Deployment Reference

Quick commands for deploying BallCare.

## Web Deployment (Fast Track)

### 1. Build for Web
```bash
cd "C:\Projects\BMT V1.1\ball_care"
flutter build web --base-href "/ball_care/" --release
```

### 2. Initialize Git (first time only)
```bash
git init
git add .
git commit -m "Initial commit"
```

### 3. Push to GitHub (first time)
```bash
# Create repository on github.com first, then:
git remote add origin https://github.com/YOUR_USERNAME/ball_care.git
git branch -M main
git push -u origin main
```

### 4. Deploy to GitHub Pages

**If you have Node.js/npm:**
```bash
npm install -g gh-pages
gh-pages -d build/web
```

**Without npm (manual method):**
```bash
git checkout --orphan gh-pages
git rm -rf .
xcopy /E /I "build\web\*" .
git add .
git commit -m "Deploy to GitHub Pages"
git push origin gh-pages --force
git checkout main
```

### 5. Enable GitHub Pages
- Go to repository Settings → Pages
- Source: Branch `gh-pages`, folder `/ (root)`
- Save
- Access at: `https://YOUR_USERNAME.github.io/ball_care/`

---

## Android APK (Fast Track)

### Debug APK (for quick testing)
```bash
cd "C:\Projects\BMT V1.1\ball_care"
flutter build apk --debug
```
**Output**: `build\app\outputs\flutter-apk\app-debug.apk`

### Release APK (for distribution)

**First time setup:**
```bash
# Create keystore
cd android\app
keytool -genkey -v -keystore ball_care_release.keystore -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias ball_care

# Create key.properties file in android/ folder
# Add these lines:
# storePassword=YOUR_PASSWORD
# keyPassword=YOUR_PASSWORD
# keyAlias=ball_care
# storeFile=ball_care_release.keystore
```

**Build release APK:**
```bash
cd "C:\Projects\BMT V1.1\ball_care"
flutter build apk --split-per-abi --release
```
**Output**: `build\app\outputs\flutter-apk\app-arm64-v8a-release.apk` (and others)

---

## Update Deployment

### Web Update
```bash
# 1. Make changes
# 2. Update version in lib/core/constants/app_version.dart
# 3. Rebuild
flutter build web --base-href "/ball_care/" --release
# 4. Redeploy
gh-pages -d build/web
```

### Android Update
```bash
# 1. Make changes
# 2. Update versionCode and versionName in android/app/build.gradle.kts
# 3. Rebuild
flutter build apk --split-per-abi --release
```

---

## Common Issues

**Web: Assets not loading**
- Check base-href matches repository name
- Rebuild with correct `--base-href` flag

**Web: Database not working**
- Verify `sqlite3.wasm` and `drift_worker.js` are in `build/web/`
- Check browser console for errors

**Android: Can't install APK**
- Enable "Install from Unknown Sources" in device settings
- Uninstall old version first

**Android: Keystore errors**
- Verify `key.properties` file exists in `android/` folder
- Check passwords are correct

---

## File Locations

**Web Build Output**: `build\web\`
**Android Debug APK**: `build\app\outputs\flutter-apk\app-debug.apk`
**Android Release APK**: `build\app\outputs\flutter-apk\app-arm64-v8a-release.apk`
**Keystore**: `android\app\ball_care_release.keystore`
**Key Config**: `android\key.properties`

---

## Ports for Local Testing

**Current Server**: http://localhost:9005

Start new server:
```bash
flutter run -d web-server --web-port=9005
```

---

For detailed instructions, see **DEPLOYMENT.md**
