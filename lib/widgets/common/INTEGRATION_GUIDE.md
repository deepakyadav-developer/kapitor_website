# Feature Widget Integration Guide

## Quick Start

### 1. Add Route to main.dart

```dart
import 'package:kapitor_website/pages/feature/feature_showcase_page.dart';

// In your routes:
'/feature-showcase': (context) => const FeatureShowcasePage(),
```

### 2. Use in Any Page

```dart
import 'package:kapitor_website/widgets/common/feature_hero_section.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/pages/feature/feature_detail_page.dart';

// In your widget build method:
FeatureHeroSection(
  badge: 'Welcome to a Modern Financial Experience',
  title: 'Managing Your Personal\nFinances Made Easier',
  description: 'Elevate your financial experience with CashEase. We simplify how you pay, transfer money, and manage your finances, giving you full control over your money. with QR Scan & Pay Instant transfers',
  imagePath: AppImage.feature1,
  playStoreUrl: 'https://play.google.com',
  appStoreUrl: 'https://apps.apple.com',
  onFeatureTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FeatureDetailPage(
          title: 'Managing Your Personal Finances Made Easier',
          description: 'Elevate your financial experience with CashEase.',
          imagePath: AppImage.feature1,
        ),
      ),
    );
  },
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

## Features

✅ **Responsive Design** - Automatically adapts to mobile, tablet, and desktop
✅ **Smooth Animations** - Fade-in, slide-up, and floating effects
✅ **Tap to Navigate** - Opens detail page when tapped
✅ **Customizable** - All text, images, and colors can be customized
✅ **App Store Buttons** - Optional Play Store and App Store download buttons
✅ **Floating Icons** - Add decorative animated icons around the image

## Animation Details

- **Fade In**: 1200ms duration with ease-out curve
- **Slide Up**: 1000ms duration with ease-out-cubic curve
- **Float**: 2000ms continuous loop with ease-in-out curve
- **Hover Effects**: 200ms scale animation on buttons

## Customization Examples

### Change Background Color

```dart
FeatureHeroSection(
  backgroundColor: Colors.grey.shade50,
  // ... other parameters
)
```

### Without App Store Buttons

```dart
FeatureHeroSection(
  badge: 'Your Badge',
  title: 'Your Title',
  description: 'Your description',
  imagePath: AppImage.feature1,
  // Don't include playStoreUrl or appStoreUrl
)
```

### Custom Floating Icons

```dart
floatingIcons: [
  Positioned(
    top: 50,
    left: 30,
    child: FloatingIcon(
      icon: Icons.star,
      color: Colors.amber,
      size: 40,
    ),
  ),
  Positioned(
    bottom: 100,
    right: 50,
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Icon(Icons.favorite, color: Colors.red),
    ),
  ),
]
```

## Files Created

1. `lib/widgets/common/feature_hero_section.dart` - Main reusable widget
2. `lib/widgets/common/feature_hero_example.dart` - Usage example
3. `lib/pages/feature/feature_detail_page.dart` - Detail page that opens on tap
4. `lib/pages/feature/feature_showcase_page.dart` - Demo page
5. `lib/widgets/common/FEATURE_WIDGET_README.md` - Documentation
6. `lib/widgets/common/INTEGRATION_GUIDE.md` - This file

## Testing

Run your app and navigate to the feature showcase page to see the widget in action:

```dart
Navigator.pushNamed(context, '/feature-showcase');
```

Or use it directly in any existing page by importing and using the `FeatureHeroSection` widget.
