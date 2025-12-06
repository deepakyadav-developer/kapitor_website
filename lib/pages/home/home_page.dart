import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/widgets/all_in_one_app/all_in_one_app_section.dart';
import 'package:kapitor_website/widgets/feature_cards/feature_cards_section.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';
import 'package:kapitor_website/widgets/hero/hero_device_showcase.dart';
import 'package:kapitor_website/widgets/hero/hero_section.dart';
import 'package:kapitor_website/widgets/predictable_value/predictable_value_section.dart';
import 'package:kapitor_website/widgets/stability_advantage/stability_advantage_section.dart';
import 'package:kapitor_website/widgets/trust_commitment/trust_commitment_section.dart';
import 'package:kapitor_website/widgets/video_showcase/video_showcase_section.dart';
import 'package:kapitor_website/widgets/why_kapitor/why_kapitor_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderWidget(),
            HeroSection(),
            HeroDeviceShowcase(),
            VideoShowcaseSection(),
            WhyKapitorSection(),
            FeatureCardsSection(),
            TrustCommitmentSection(),
            StabilityAdvantageSection(),
            PredictableValueSection(),
            AllInOneAppSection(),
            FooterWidget(),
            // Add more sections here as needed
          ],
        ),
      ),
    );
  }
}

