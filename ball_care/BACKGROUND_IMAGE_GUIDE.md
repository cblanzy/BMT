# Background Image Setup Guide

The BallCare app is now configured to display a bowling lane arrows background image on the home screen!

## Quick Start

1. **Find a bowling lane arrows image** (see sources below)
2. **Save it as**: `assets/images/background.jpg` or `background.png`
3. **Restart the Flutter app**
4. **Done!** The background will appear automatically

## Where to Find Bowling Lane Images

### Free Stock Photo Websites

#### 1. Unsplash (https://unsplash.com)
- Search: "bowling lane arrows" or "bowling alley"
- License: Free for commercial use, no attribution required
- Quality: Very high resolution
- **Recommended searches**:
  - "bowling lane close up"
  - "bowling arrows"
  - "bowling alley perspective"

#### 2. Pexels (https://pexels.com)
- Search: "bowling lane" or "bowling arrows"
- License: Free for commercial use
- Quality: High resolution
- **Recommended searches**:
  - "bowling lane texture"
  - "bowling floor"
  - "bowling approach"

#### 3. Pixabay (https://pixabay.com)
- Search: "bowling lane"
- License: Free for commercial use
- Quality: Good resolution
- **Recommended searches**:
  - "bowling"
  - "bowling alley"
  - "bowling court"

#### 4. Freepik (https://freepik.com)
- Search: "bowling lane arrows"
- License: Free with attribution on free plan
- Quality: Professional
- Has both photos and vector graphics

### Example Search Terms
- "bowling lane arrows closeup"
- "bowling approach area"
- "bowling lane perspective"
- "bowling alley floor"
- "bowling lane wood texture"

## Image Specifications

### Recommended:
- **Resolution**: 1920x1080 or higher (Full HD minimum)
- **Format**: JPG (preferred) or PNG
- **Aspect Ratio**: 16:9 (landscape)
- **File Size**: Under 5MB for optimal loading
- **Filename**: `background.jpg` or `background.png`

### Visual Style:
- **Focus**: Sharp focus on arrow markings
- **Perspective**: From bowler's viewpoint looking down the lane
- **Lighting**: Well-lit but not overly bright
- **Composition**: Arrows prominently visible in center/foreground
- **Color**: Natural wood tones work best

## Installation Steps

### Step 1: Download Your Image
1. Visit one of the free stock photo sites listed above
2. Search for bowling lane images
3. Download in highest resolution available
4. Save to your computer

### Step 2: Prepare the Image (Optional)
You can edit the image using free tools if needed:
- **Brightness**: Reduce if too bright (for better text contrast)
- **Saturation**: Can be slightly reduced for subtler background
- **Crop**: Focus on the arrow area
- **Resize**: Recommended max 1920x1080 for web

Free editing tools:
- GIMP (https://gimp.org) - Desktop, full-featured
- Photopea (https://photopea.com) - Online, Photoshop-like
- Paint.NET (https://getpaint.net) - Windows only, simple

### Step 3: Save to Project
1. Navigate to your project folder:
   ```
   C:\Projects\BMT V1.1\ball_care\assets\images\
   ```
2. Save your image as one of these exact names:
   - `background.jpg` (preferred)
   - `background.png`

### Step 4: Restart App
The app needs to be restarted for asset changes:
1. Stop the current Flutter server (press `q` in terminal or kill dart processes)
2. Run: `flutter run -d web-server --web-port=9005`
3. Refresh your browser

## Customization

### Adjusting Background Settings

The background appearance can be customized in `lib/presentation/screens/home_screen.dart`:

```dart
BackgroundImage(
  opacity: 0.12,           // Image transparency (0.0 to 1.0)
  overlayOpacity: 0.4,     // Dark overlay amount (0.0 to 1.0)
  child: Column(
    // ... rest of content
  ),
),
```

**Settings explained**:
- `opacity`: Higher = more visible image (0.1-0.2 recommended)
- `overlayOpacity`: Higher = darker overlay (0.3-0.5 recommended)

### If Image Is Too Visible:
```dart
BackgroundImage(
  opacity: 0.08,           // Make image more subtle
  overlayOpacity: 0.5,     // Darken overlay more
  ...
)
```

### If Image Is Too Subtle:
```dart
BackgroundImage(
  opacity: 0.20,           // Make image more visible
  overlayOpacity: 0.2,     // Lighten overlay
  ...
)
```

## Fallback Behavior

If no image is found, the app will display a subtle gradient background instead:
- No errors will occur
- App will work normally
- Gradient provides clean dark background

## Troubleshooting

### Image Not Showing
1. **Check filename**: Must be exactly `background.jpg` or `.png`
2. **Check location**: Must be in `assets/images/` folder
3. **Restart app**: Asset changes require full restart
4. **Check pubspec.yaml**: Should have `assets/images/` listed

### Image Too Dark/Bright
- Edit `opacity` value in home_screen.dart
- Lower values = more subtle background
- Higher values = more visible background

### Text Hard to Read
- Increase `overlayOpacity` to darken background more
- Reduce `opacity` to make image more subtle
- Try a different image with less contrast

### Build Errors After Adding Image
1. Run `flutter clean`
2. Run `flutter pub get`
3. Restart app

## Tips for Best Results

1. **Choose Images With**:
   - Clear arrow markings
   - Good contrast
   - Natural lighting
   - Minimal clutter in background

2. **Avoid Images With**:
   - Heavy shadows
   - Extreme angles
   - Too much detail/noise
   - Very dark or very bright areas

3. **Test Different Opacity Settings**:
   - Start with default (opacity: 0.12)
   - Adjust based on your image
   - Balance visibility with readability

## Alternative: Use Custom Background

You can use a different image path with the CustomBackgroundImage widget:

```dart
CustomBackgroundImage(
  imagePath: 'assets/images/your_custom_image.jpg',
  opacity: 0.15,
  overlayOpacity: 0.3,
  child: YourContentHere(),
)
```

## Example Images to Search For

Here are specific types of bowling lane images that work well:

1. **"Bowling lane arrows from bowler perspective"**
   - Best for authentic feel
   - Shows approach area with arrows

2. **"Bowling lane wood texture closeup"**
   - Good for subtle background
   - Natural wood grain

3. **"Bowling alley approach floor"**
   - Professional look
   - Clear arrow markers

4. **"Bowling lane dots and arrows"**
   - Classic bowling look
   - Shows targeting system

## License Reminder

When using images from free stock sites:
- ✅ Unsplash, Pexels: No attribution required
- ⚠️ Pixabay: Check license per image
- ⚠️ Freepik: May require attribution on free plan

Always verify the specific license for each image you download!

---

**Current Version**: v1.1.006
**Feature Added**: Background image support
**Default Behavior**: Gradient background if no image present
