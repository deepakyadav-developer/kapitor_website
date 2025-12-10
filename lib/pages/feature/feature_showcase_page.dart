import 'package:flutter/material.dart';
import 'package:kapitor_website/widgets/common/feature_hero_example.dart';
import 'package:kapitor_website/widgets/common/feature2_hero_section.dart';
import 'package:kapitor_website/widgets/common/feature3_crypto_section.dart';
import 'package:kapitor_website/widgets/common/feature4_ai_income_section.dart';
import 'package:kapitor_website/widgets/common/feature5_ppp_section.dart';
import 'package:kapitor_website/widgets/common/feature6_crypto_features_section.dart';
import 'package:kapitor_website/widgets/common/feature7_booking_steps_section.dart';
import 'package:kapitor_website/widgets/common/feature8_insurance_section.dart';
import 'package:kapitor_website/widgets/common/interactive_feature_example.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';

/// Showcase page demonstrating the FeatureHeroSection widget
class FeatureShowcasePage extends StatelessWidget {
  const FeatureShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: HeaderWidget.buildMobileDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            HeaderWidget(),
            FeatureHeroExample(),
            InteractiveFeatureExample(),
            Feature2HeroSection(),
            Feature3CryptoSection(),
            Feature4AiIncomeSection(),
            Feature5PppSection(),
            Feature6CryptoFeaturesSection(),
            Feature7BookingStepsSection(),
            Feature8InsuranceSection(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
