# App Download Buttons Widget

Reusable Google Play and App Store download buttons matching the reference design.

## Features

✅ **Google Play Button** - "GET IT ON Google Play" with Play icon
✅ **App Store Button** - "Download on the App Store" with Apple icon
✅ **Responsive** - Large and small sizes
✅ **Animated** - Hover effects with scale and shadow
✅ **Flexible Layout** - Horizontal or vertical arrangement
✅ **Customizable** - Optional URLs for each store

## Usage

### Basic Example (Both Buttons)

```dart
import 'package:kapitor_website/widgets/common/app_download_buttons.dart';

AppDownloadButtons(
  playStoreUrl: 'https://play.google.com/store/apps/details?id=com.yourapp',
  appStoreUrl: 'https://apps.apple.com/app/idYOURAPPID',
  isLarge: true,
  direction: Axis.horizontal,
)
```

### Only Google Play Button

```dart
AppDownloadButtons(
  playStoreUrl: 'https://play.google.com/...',
  isLarge: true,
)
```

### Only App Store Button

```dart
AppDownloadButtons(
  appStoreUrl: 'https://apps.apple.com/...',
  isLarge: true,
)
```

### Vertical Layout

```dart
AppDownloadButtons(
  playStoreUrl: 'https://play.google.com/...',
  appStoreUrl: 'https://apps.apple.com/...',
  isLarge: true,
  direction: Axis.vertical,
)
```

### Small Size

```dart
AppDownloadButtons(
  playStoreUrl: 'https://play.google.com/...',
  appStoreUrl: 'https://apps.apple.com/...',
  isLarge: false,
)
```

## Individual Button Usage

### Google Play Button Only

```dart
import 'package:kapitor_website/widgets/common/app_download_buttons.dart';

GooglePlayButton(
  onTap: () {
    // Open Play Store
  },
  isLarge: true,
)
```

### App Store Button Only

```dart
import 'package:kapitor_website/widgets/common/app_download_buttons.dart';

AppStoreButton(
  onTap: () {
    // Open App Store
  },
  isLarge: true,
)
```

## Parameters

### AppDownloadButtons

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `playStoreUrl` | String? | null | Google Play Store URL |
| `appStoreUrl` | String? | null | Apple App Store URL |
| `isLarge` | bool | true | Button size (large: 56px, small: 48px) |
| `direction` | Axis | Axis.horizontal | Layout direction |

### GooglePlayButton / AppStoreButton

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `onTap` | VoidCallback | Yes | Callback when button is tapped |
| `isLarge` | bool | No (default: true) | Button size |

## Button Specifications

### Large Size (isLarge: true)
- Height: 56px
- Icon size: 28px
- Small text: 10px
- Large text: 18px
- Padding: 20px horizontal, 8px vertical

### Small Size (isLarge: false)
- Height: 48px
- Icon size: 24px
- Small text: 9px
- Large text: 16px
- Padding: 16px horizontal, 6px vertical

## Design Details

### Colors
- Background: Black (#000000)
- Text: White (#FFFFFF)
- Border radius: 8px

### Animations
- Hover scale: 1.05x
- Animation duration: 200ms
- Curve: easeInOut

### Shadows
- Default: 4px blur, 2px offset, 10% opacity
- Hover: 12px blur, 4px offset, 30% opacity

## Integration with Feature Hero Section

The buttons are automatically integrated with `FeatureHeroSection`:

```dart
FeatureHeroSection(
  badge: 'Welcome',
  title: 'Your Title',
  description: 'Your description',
  imagePath: AppImage.feature1,
  playStoreUrl: 'https://play.google.com/...',
  appStoreUrl: 'https://apps.apple.com/...',
)
```

## Examples in Codebase

See these files for usage examples:
- `lib/widgets/common/feature_hero_section.dart`
- `lib/widgets/common/feature_hero_example.dart`
- `lib/pages/feature/feature_showcase_page.dart`

## Customization

To customize the button appearance, edit:
- `lib/widgets/common/app_download_buttons.dart`

Key customization points:
- Button colors (line ~100, ~200)
- Text sizes (line ~90, ~190)
- Icon sizes (line ~88, ~188)
- Padding and spacing
- Shadow effects
- Animation parameters
