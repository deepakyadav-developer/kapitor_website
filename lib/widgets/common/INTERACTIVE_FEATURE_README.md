# Interactive Feature Section Widget

A reusable, animated feature section with a chart display and selectable feature cards with progress stepper.

## Features

✅ **Interactive Selection** - Click feature cards to select them
✅ **Animated Transitions** - Smooth fade and slide animations
✅ **Progress Stepper** - Visual progress indicator at the bottom
✅ **Chart Display** - Shows chart image with decorative icons
✅ **Fully Responsive** - Works on mobile, tablet, and desktop
✅ **Hover Effects** - Cards respond to mouse hover
✅ **Customizable** - Colors, icons, text, and images

## Design

```
┌─────────────────────────────────────────────────────────┐
│                                                         │
│  FEATURES                                               │
│  All Your Money And Payment Needs In One App            │
│                                                         │
│  ┌──────────────┐    ┌─────────────────────────────┐  │
│  │   $ Icon     │    │ ✓ Multi-chain USDT wallet  │  │
│  │              │    │   Description...            │  │
│  │   Chart      │    ├─────────────────────────────┤  │
│  │   Image      │    │   Custodial or self-custody │  │
│  │              │    │   Description...            │  │
│  │   🔗 🔗      │    ├─────────────────────────────┤  │
│  └──────────────┘    │   Cross-chain bridge        │  │
│                      │   Description...            │  │
│                      └─────────────────────────────┘  │
│                      ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬  │
│                      Progress Stepper                  │
└─────────────────────────────────────────────────────────┘
```

## Usage

### Basic Example

```dart
import 'package:kapitor_website/widgets/common/interactive_feature_section.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';

InteractiveFeatureSection(
  title: 'All Your Money And Payment\nNeeds In One App',
  subtitle: 'FEATURES',
  chartImage: AppImage.fChart,
  features: const [
    FeatureItem(
      title: 'Multi-chain USDT wallet',
      description: 'Our comprehensive selection of medications...',
      icon: Icons.account_balance_wallet,
    ),
    FeatureItem(
      title: 'Custodial or self-custody',
      description: 'From advanced imaging technology...',
      icon: Icons.security,
    ),
    FeatureItem(
      title: 'Cross-chain bridge',
      description: 'We\'re committed to leveraging...',
      icon: Icons.swap_horiz,
    ),
  ],
)
```

### With Custom Background

```dart
InteractiveFeatureSection(
  title: 'Your Title',
  subtitle: 'YOUR SUBTITLE',
  chartImage: AppImage.fChart,
  backgroundColor: Colors.grey.shade50,
  features: [...],
)
```

### With Custom Chart Image

```dart
InteractiveFeatureSection(
  title: 'Your Title',
  subtitle: 'YOUR SUBTITLE',
  chartImage: 'assets/images/your-chart.png',
  features: [...],
)
```

## Parameters

### InteractiveFeatureSection

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `title` | String | Yes | Main heading text |
| `subtitle` | String | Yes | Subtitle/label text (e.g., "FEATURES") |
| `features` | List<FeatureItem> | Yes | List of feature items |
| `chartImage` | String? | No | Path to chart image (default: AppImage.fChart) |
| `backgroundColor` | Color? | No | Background color (default: white) |

### FeatureItem

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `title` | String | Yes | Feature title |
| `description` | String | Yes | Feature description |
| `icon` | IconData | Yes | Material icon for the feature |

## Responsive Breakpoints

- **Mobile**: < 768px (vertical layout)
- **Tablet**: 768px - 1023px
- **Desktop**: ≥ 1024px (horizontal layout)

## Animations

### 1. Initial Load
- Fade in: 500ms
- Slide in: 400ms from right

### 2. Feature Selection
- Card highlight: 300ms
- Progress stepper: 300ms
- Chart transition: 500ms fade + 400ms slide

### 3. Hover Effects
- Card elevation and shadow
- Border color change
- Smooth transitions

## Component Structure

### Chart Section
- Dollar icon at top
- Chart image in center
- Connection icons at bottom
- Rounded container with shadow

### Feature Cards
- Icon on left
- Title and description
- Selected state (green background)
- Hover state (shadow and border)
- Click to select

### Progress Stepper
- Horizontal progress bars
- Active segment highlighted
- Smooth color transitions

## Styling

### Colors
- Primary: #4CAF50 (Green)
- Selected background: #E8F5E9 (Light green)
- Border: Grey shades
- Text: Black with opacity variations

### Sizes

#### Desktop
- Chart height: 350px
- Card padding: 24px
- Icon size: 24px
- Title: 18px
- Description: 14px

#### Mobile
- Chart height: 280px
- Card padding: 20px
- Icon size: 20px
- Title: 16px
- Description: 13px

## State Management

The widget manages:
- Selected feature index
- Animation controllers
- Hover states
- Fade and slide animations

## Examples

### Example 1: Financial Features
```dart
InteractiveFeatureSection(
  title: 'All Your Money And Payment\nNeeds In One App',
  subtitle: 'FEATURES',
  features: const [
    FeatureItem(
      title: 'Multi-chain USDT wallet',
      description: 'Comprehensive cryptocurrency wallet...',
      icon: Icons.account_balance_wallet,
    ),
    FeatureItem(
      title: 'Custodial or self-custody',
      description: 'Choose your preferred custody model...',
      icon: Icons.security,
    ),
    FeatureItem(
      title: 'Cross-chain bridge',
      description: 'Seamless cross-chain transactions...',
      icon: Icons.swap_horiz,
    ),
  ],
)
```

### Example 2: Healthcare Features
```dart
InteractiveFeatureSection(
  title: 'Complete Healthcare\nSolutions',
  subtitle: 'SERVICES',
  chartImage: AppImage.chart,
  features: const [
    FeatureItem(
      title: 'Telemedicine',
      description: 'Connect with doctors remotely...',
      icon: Icons.video_call,
    ),
    FeatureItem(
      title: 'Health Records',
      description: 'Secure digital health records...',
      icon: Icons.folder_shared,
    ),
    FeatureItem(
      title: 'Prescription Management',
      description: 'Easy prescription refills...',
      icon: Icons.medication,
    ),
  ],
)
```

### Example 3: Tech Features
```dart
InteractiveFeatureSection(
  title: 'Powerful Development\nTools',
  subtitle: 'CAPABILITIES',
  features: const [
    FeatureItem(
      title: 'Cloud Integration',
      description: 'Seamless cloud connectivity...',
      icon: Icons.cloud,
    ),
    FeatureItem(
      title: 'API Management',
      description: 'Robust API infrastructure...',
      icon: Icons.api,
    ),
    FeatureItem(
      title: 'Real-time Analytics',
      description: 'Live data insights...',
      icon: Icons.analytics,
    ),
  ],
)
```

## File Structure

```
lib/
├── widgets/
│   └── common/
│       ├── interactive_feature_section.dart       # Main widget
│       ├── interactive_feature_example.dart       # Usage example
│       └── INTERACTIVE_FEATURE_README.md          # This file
└── pages/
    └── feature/
        └── interactive_feature_showcase_page.dart # Demo page
```

## Testing

Navigate to `/interactive-feature` to see the widget in action.

## Customization

To customize the widget, edit `lib/widgets/common/interactive_feature_section.dart`:

- **Colors**: Change green colors (lines ~250, ~350, ~400)
- **Animations**: Modify duration and curves (lines ~45-65)
- **Sizes**: Adjust padding and dimensions (lines ~200-250)
- **Icons**: Change decorative icons (lines ~220-240)
- **Shadows**: Modify BoxShadow properties (lines ~190-200)

## Integration

### In Any Page
```dart
import 'package:kapitor_website/widgets/common/interactive_feature_section.dart';

// In your widget build method:
InteractiveFeatureSection(
  title: 'Your Title',
  subtitle: 'YOUR SUBTITLE',
  features: [...],
)
```

### In Feature Showcase
See `lib/widgets/common/interactive_feature_example.dart` for complete example.

## Notes

- First feature is selected by default
- Click any feature card to select it
- Progress stepper updates automatically
- Chart animates on feature selection
- Fully keyboard accessible
- Works with any Material icon

All diagnostics passed ✅
