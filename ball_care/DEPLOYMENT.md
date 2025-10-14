# BallCare Deployment Guide

This guide covers deploying the BallCare application for web access using GitHub Pages and Cloudflare, as well as building an Android APK.

## Table of Contents
- [Web Deployment (GitHub Pages + Cloudflare)](#web-deployment-github-pages--cloudflare)
- [Android APK Build](#android-apk-build)
- [Troubleshooting](#troubleshooting)

---

## Web Deployment (GitHub Pages + Cloudflare)

### Prerequisites
- GitHub account
- Cloudflare account (free tier)
- Git installed on your computer

### Step 1: Prepare Your Repository

1. **Initialize Git repository** (if not already done):
   ```bash
   cd "C:\Projects\BMT V1.1\ball_care"
   git init
   ```

2. **Create `.gitignore` file** (if not already exists):
   ```bash
   # Create .gitignore with Flutter defaults
   echo /build/ > .gitignore
   echo /.dart_tool/ >> .gitignore
   echo /.idea/ >> .gitignore
   echo /.vscode/ >> .gitignore
   echo *.iml >> .gitignore
   echo *.log >> .gitignore
   echo .DS_Store >> .gitignore
   ```

3. **Commit your code**:
   ```bash
   git add .
   git commit -m "Initial commit - BallCare v1.1.004"
   ```

### Step 2: Build for Web Production

1. **Build the web application**:
   ```bash
   flutter build web --base-href "/ball_care/" --release
   ```

   **Note**: Replace `/ball_care/` with your repository name. If your repo is named differently, use `/your-repo-name/`

2. **Verify the build** - Check that these files exist in `build/web/`:
   - `index.html`
   - `sqlite3.wasm`
   - `drift_worker.js`
   - `flutter.js`
   - `main.dart.js`

### Step 3: Create GitHub Repository

1. **Go to GitHub** (https://github.com)

2. **Create a new repository**:
   - Click the "+" icon → "New repository"
   - Name: `ball_care` (or your preferred name)
   - Description: "Ball Maintenance Tracker - Flutter Web App"
   - Visibility: Public (required for free GitHub Pages)
   - Don't initialize with README (we already have code)
   - Click "Create repository"

3. **Add remote and push**:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/ball_care.git
   git branch -M main
   git push -u origin main
   ```
   Replace `YOUR_USERNAME` with your GitHub username.

### Step 4: Deploy to GitHub Pages

#### Option A: Using gh-pages branch (Recommended)

1. **Install gh-pages dependencies** (one-time setup):
   ```bash
   npm install -g gh-pages
   ```

   If you don't have npm, you can use the manual method below.

2. **Deploy to gh-pages branch**:
   ```bash
   cd "C:\Projects\BMT V1.1\ball_care"
   gh-pages -d build/web
   ```

#### Option B: Manual Deployment

1. **Create and switch to gh-pages branch**:
   ```bash
   git checkout --orphan gh-pages
   ```

2. **Remove all files from staging**:
   ```bash
   git rm -rf .
   ```

3. **Copy build files**:
   ```bash
   xcopy /E /I "build\web\*" .
   ```

4. **Add and commit**:
   ```bash
   git add .
   git commit -m "Deploy Flutter web app"
   ```

5. **Push to gh-pages**:
   ```bash
   git push origin gh-pages
   ```

6. **Switch back to main branch**:
   ```bash
   git checkout main
   ```

### Step 5: Enable GitHub Pages

1. **Go to your repository on GitHub**:
   - Navigate to `https://github.com/YOUR_USERNAME/ball_care`

2. **Open Settings**:
   - Click "Settings" tab
   - Scroll down to "Pages" in the left sidebar

3. **Configure Pages**:
   - Source: Select "Deploy from a branch"
   - Branch: Select `gh-pages` and `/ (root)`
   - Click "Save"

4. **Wait for deployment** (usually 1-5 minutes)
   - Your site will be available at: `https://YOUR_USERNAME.github.io/ball_care/`

### Step 6: Configure Cloudflare (Optional - for Custom Domain)

#### 6.1: Add Domain to Cloudflare

1. **Log in to Cloudflare** (https://dash.cloudflare.com)

2. **Add a site**:
   - Click "Add a site"
   - Enter your domain name (e.g., `yourdomain.com`)
   - Select the Free plan
   - Click "Continue"

3. **Update nameservers**:
   - Cloudflare will provide you with nameservers
   - Go to your domain registrar and update the nameservers
   - Wait for DNS propagation (can take up to 24 hours)

#### 6.2: Configure DNS Records

1. **Add CNAME records** in Cloudflare DNS:

   **For root domain** (yourdomain.com):
   - Type: `CNAME`
   - Name: `@`
   - Target: `YOUR_USERNAME.github.io`
   - Proxy status: Proxied (orange cloud)

   **For www subdomain**:
   - Type: `CNAME`
   - Name: `www`
   - Target: `YOUR_USERNAME.github.io`
   - Proxy status: Proxied (orange cloud)

2. **Enable HTTPS**:
   - Go to SSL/TLS → Overview
   - Set encryption mode to "Full" or "Flexible"

#### 6.3: Configure GitHub Pages Custom Domain

1. **Go back to GitHub repository Settings → Pages**

2. **Add custom domain**:
   - Enter your domain: `yourdomain.com`
   - Click "Save"
   - Check "Enforce HTTPS"

3. **Create CNAME file** (if not automatically created):
   ```bash
   cd "C:\Projects\BMT V1.1\ball_care\build\web"
   echo yourdomain.com > CNAME
   ```
   Then redeploy using Step 4.

### Step 7: Update base-href for Custom Domain (if using)

If using a custom domain, rebuild with root base-href:

```bash
flutter build web --base-href "/" --release
```

Then redeploy following Step 4.

---

## Android APK Build

### Prerequisites
- Android Studio installed (or at least Android SDK)
- Java JDK 11 or later

### Step 1: Configure Android Build

1. **Update app information** in `android/app/build.gradle`:

   Open the file and verify/update:
   ```gradle
   android {
       defaultConfig {
           applicationId "com.yourcompany.ball_care"
           minSdkVersion 21
           targetSdkVersion 34
           versionCode 1
           versionName "1.1.004"
       }
   }
   ```

2. **Update app name** in `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <application
       android:label="BallCare"
       ...>
   ```

### Step 2: Build Debug APK (for testing)

1. **Build debug APK**:
   ```bash
   cd "C:\Projects\BMT V1.1\ball_care"
   flutter build apk --debug
   ```

2. **Find the APK**:
   - Location: `build\app\outputs\flutter-apk\app-debug.apk`
   - Size: ~40-50 MB (debug builds are larger)

3. **Install on Android device**:
   - Enable "Install from Unknown Sources" in device settings
   - Transfer APK to device
   - Tap to install

### Step 3: Build Release APK (for distribution)

#### 3.1: Create Keystore (One-time Setup)

1. **Generate keystore**:
   ```bash
   cd "C:\Projects\BMT V1.1\ball_care\android\app"
   keytool -genkey -v -keystore ball_care_release.keystore -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias ball_care
   ```

2. **Answer the prompts**:
   - Enter keystore password (remember this!)
   - Enter your name, organization, etc.
   - Confirm with "yes"

3. **Create key properties file**:

   Create `android/key.properties`:
   ```properties
   storePassword=YOUR_KEYSTORE_PASSWORD
   keyPassword=YOUR_KEY_PASSWORD
   keyAlias=ball_care
   storeFile=ball_care_release.keystore
   ```

   **IMPORTANT**: Add `key.properties` to `.gitignore` to keep passwords secure!

4. **Update `.gitignore`**:
   ```bash
   echo /android/key.properties >> .gitignore
   echo /android/app/*.keystore >> .gitignore
   ```

#### 3.2: Configure Signing in build.gradle

1. **Edit `android/app/build.gradle`**:

   Add before `android {` block:
   ```gradle
   def keystoreProperties = new Properties()
   def keystorePropertiesFile = rootProject.file('key.properties')
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }
   ```

   Add inside `android {` block:
   ```gradle
   signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
           storePassword keystoreProperties['storePassword']
       }
   }
   buildTypes {
       release {
           signingConfig signingConfigs.release
           minifyEnabled true
           shrinkResources true
       }
   }
   ```

#### 3.3: Build Release APK

1. **Build release APK**:
   ```bash
   cd "C:\Projects\BMT V1.1\ball_care"
   flutter build apk --release
   ```

2. **Build split APKs** (smaller file sizes - recommended):
   ```bash
   flutter build apk --split-per-abi --release
   ```

   This creates separate APKs for different CPU architectures:
   - `app-armeabi-v7a-release.apk` (32-bit ARM - older devices)
   - `app-arm64-v8a-release.apk` (64-bit ARM - most modern devices)
   - `app-x86_64-release.apk` (64-bit Intel - emulators/tablets)

3. **Find the APKs**:
   - Location: `build\app\outputs\flutter-apk\`
   - Size: ~15-20 MB per APK (split), ~40 MB (universal)

### Step 4: Test Release APK

1. **Install on test device**:
   ```bash
   flutter install
   ```

   Or manually transfer the APK and install.

2. **Test all features**:
   - Add a ball
   - Log games
   - Record maintenance
   - Verify database persistence
   - Test image upload

### Step 5: Distribution Options

#### Option A: Direct Distribution
- Share the APK file directly with users
- Users must enable "Install from Unknown Sources"

#### Option B: Google Play Store
1. **Create Google Play Developer Account** ($25 one-time fee)
2. **Prepare store listing**:
   - App name, description, screenshots
   - Privacy policy (required)
   - Content rating
3. **Upload APK/AAB** (Android App Bundle recommended):
   ```bash
   flutter build appbundle --release
   ```
4. **Submit for review**

#### Option C: Alternative App Stores
- Amazon Appstore
- Samsung Galaxy Store
- F-Droid (for open source)

---

## Deployment Checklist

### Web Deployment Checklist
- [ ] Code committed to Git
- [ ] Web build created with correct base-href
- [ ] WASM files (sqlite3.wasm, drift_worker.js) in build
- [ ] Pushed to GitHub
- [ ] Deployed to gh-pages branch
- [ ] GitHub Pages enabled
- [ ] Site accessible at GitHub URL
- [ ] (Optional) Custom domain configured in Cloudflare
- [ ] (Optional) DNS records updated
- [ ] (Optional) HTTPS enabled

### Android APK Checklist
- [ ] App name and version updated
- [ ] Keystore created (for release)
- [ ] Signing configuration added
- [ ] Debug APK built and tested
- [ ] Release APK built
- [ ] APK tested on real device
- [ ] All features working
- [ ] Database persists data
- [ ] Ready for distribution

---

## Troubleshooting

### Web Deployment Issues

**Issue**: 404 errors on page reload
- **Solution**: This is normal for single-page apps. Users should bookmark the root URL.

**Issue**: WASM files not loading (CORS errors)
- **Solution**: Ensure files are in the build output and GitHub Pages is serving with correct headers.

**Issue**: Database not persisting
- **Solution**: Web databases are stored in browser localStorage. Clearing browser data will reset the database.

**Issue**: Base-href issues (assets not loading)
- **Solution**: Rebuild with correct `--base-href` matching your deployment path.

### Android APK Issues

**Issue**: "App not installed" error
- **Solution**:
  - Enable "Install from Unknown Sources"
  - Uninstall old version if exists
  - Check storage space

**Issue**: APK build fails with signing errors
- **Solution**: Verify key.properties file exists and passwords are correct.

**Issue**: Database errors on Android
- **Solution**: Ensure `sqlite3_flutter_libs` is in pubspec.yaml dependencies.

**Issue**: Large APK size
- **Solution**: Use `--split-per-abi` flag to create smaller, architecture-specific APKs.

---

## Updating Your Deployment

### Web Updates

1. **Make your code changes**
2. **Update version** in `lib/core/constants/app_version.dart`
3. **Rebuild for web**:
   ```bash
   flutter build web --base-href "/ball_care/" --release
   ```
4. **Redeploy**:
   ```bash
   gh-pages -d build/web
   ```
   Or use the manual method from Step 4.

### Android Updates

1. **Make your code changes**
2. **Update version** in `android/app/build.gradle`:
   - Increment `versionCode` (integer)
   - Update `versionName` (string)
3. **Rebuild APK**:
   ```bash
   flutter build apk --split-per-abi --release
   ```
4. **Distribute new APK**

---

## Security Notes

1. **Never commit sensitive files**:
   - `key.properties`
   - `*.keystore` files
   - API keys or secrets

2. **Keep your keystore safe**:
   - Back up your keystore file
   - Store passwords securely
   - You cannot update your app without the same keystore

3. **Web security**:
   - All data is stored locally in browser
   - No backend authentication required
   - Users should not share devices if data is sensitive

---

## Support

For issues specific to:
- **Flutter**: https://flutter.dev/docs
- **GitHub Pages**: https://docs.github.com/en/pages
- **Cloudflare**: https://developers.cloudflare.com/
- **Android**: https://developer.android.com/

For BallCare app issues, check the project repository or contact the developer.

---

**Current Version**: v1.1.004
**Last Updated**: October 2025
