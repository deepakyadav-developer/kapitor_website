# Feature Hero Section Widget

A reusable, animated, and responsive feature hero section widget that matches the design from your image.

## Features

✅ **Fully Responsive** - Works on mobile, tablet, and desktop
✅ **Smooth Animations** - Fade-in, slide-up, and floating animations
✅ **Tap Navigation** - Opens feature detail page on tap
✅ **Customizable** - Badge, title, description, images, and colors
✅ **App Store Buttons** - Optional Play Store and App Store buttons
✅ **Floating Icons** - Decorative floating icons around the main image

## Usage

### Basic Example

```dart
import 'package:kapitor_website/widgets/common/feature_hero_section.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';

FeatureHeroSection(
  badge: 'Welcome to a Modern Financial Experience',
  title: 'Managing Your Personal\nFinances Made Easier',
  description: 'Elevate your financial experience with CashEase.',
  imagePath: AppImage.feature1,
  playStoreUrl: 'https://play.google.com',
  appStoreUrl: 'https://apps.apple.com',
  onFeatureTap: () {
    // Navigate to feature detail page
  },
)
```

### With Navigation

```dart
FeatureHeroSection(
  badge: 'Welcome to a Modern Financial Experience',
  title: 'Managing Your Personal\nFinances Made Easier',
  description: 'Elevate your financial experience...',
  imagePath: AppImage.feature1,
  onFeatureTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FeatureDetailPage(
          title: 'Managing Your Personal Finances',
          description: 'Full description here...',
          imagePath: AppImage.feature1,
        ),
      ),
    );
  },
)
```

### With Floating Icons

```dart
FeatureHeroSection(
  badge: 'Welcome',
  title: 'Your Title',
  description: 'Your description',
  imagePath: AppImage.feature1,
  floatingIcons: [
    const Positioned(
      top: 20,
      left: 20,
      child: FloatingIcon(
        icon: Icons.pie_chart,
        color: Color(0xFF7B61FF),
        size: 32,
      ),
    ),
    const Positioned(
      top: 40,
      right: 100,
      child: FloatingIcon(
        icon: Icons.percent,
        color: Color(0xFFFF6B9D),
        size: 28,
      ),
    ),
  ],
)
```

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `badge` | String | Yes | Badge text at the top |
| `title` | String | Yes | Main heading text |
| `description` | String | Yes | Description text |
| `imagePath` | String | Yes | Path to the main image |
| `playStoreUrl` | String? | No | Play Store URL (shows button if provided) |
| `appStoreUrl` | String? | No | App Store URL (shows button if provided) |
| `onFeatureTap` | VoidCallback? | No | Callback when section is tapped |
| `floatingIcons` | List<Widget>? | No | Decorative floating icons |
| `backgroundColor` | Color? | No | Background color (default: white) |

## Responsive Breakpoints

- **Mobile**: < 768px
- **Tablet**: 768px - 1023px
- **Desktop**: ≥ 1024px

## Animations

1. **Fade In** - Content fades in on load (1200ms)
2. **Slide Up** - Content slides up from bottom (1000ms)
3. **Float** - Image and icons float up and down continuously (2000ms loop)
4. **Hover** - App store buttons scale on hover

## File Structure

```
lib/
├── widgets/
│   └── common/
│       ├── feature_hero_section.dart       # Main widget
│       ├── feature_hero_example.dart       # Usage example
│       └── FEATURE_WIDGET_README.md        # This file
└── pages/
    └── feature/
        ├── feature_detail_page.dart        # Detail page
        └── feature_showcase_page.dart      # Showcase page
```

## Complete Example

See `lib/widgets/common/feature_hero_example.dart` for a complete working example.

## Testing

To test the widget, add this route to your `main.dart`:

```dart
'/feature-showcase': (context) => const FeatureShowcasePage(),
```

Then navigate to `/feature-showcase` in your app.
