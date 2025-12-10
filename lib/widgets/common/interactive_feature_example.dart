import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/widgets/common/interactive_feature_section.dart';

/// Example usage of InteractiveFeatureSection widget
class InteractiveFeatureExample extends StatelessWidget {
  const InteractiveFeatureExample({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveFeatureSection(
      title: 'All Your Money And Payment\nNeeds In One App',
      subtitle: 'FEATURES',
      chartImage: AppImage.fChart,
      features: const [
        FeatureItem(
          title: 'Multi-chain USDT wallet',
          description:
              'Our comprehensive selection of medications, supplements, and healthcare products.',
          icon: Icons.account_balance_wallet,
        ),
        FeatureItem(
          title: 'Custodial or self-custody',
          description:
              'From advanced imaging technology such as MRI and CT scanners to precision surgical tools.',
          icon: Icons.security,
        ),
        FeatureItem(
          title: 'Cross-chain bridge',
          description:
              'We\'re committed to leveraging the latest innovations in medical technology.',
          icon: Icons.swap_horiz,
        ),
      ],
    );
  }
}
