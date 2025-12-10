import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/widgets/all_in_one_app/all_in_one_app_section.dart';
import 'package:kapitor_website/widgets/common/scroll_to_top_button.dart';
import 'package:kapitor_website/widgets/feature_cards/feature_cards_section.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';
import 'package:kapitor_website/widgets/hero/hero_section.dart';
import 'package:kapitor_website/widgets/predictable_value/predictable_value_section.dart';
import 'package:kapitor_website/widgets/stability_advantage/stability_advantage_section.dart';
import 'package:kapitor_website/widgets/trust_commitment/trust_commitment_section.dart';
import 'package:kapitor_website/widgets/why_kapitor/why_kapitor_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      endDrawer: HeaderWidget.buildMobileDrawer(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: const Column(
              children: [
                HeaderWidget(),
                HeroSection(),
                WhyKapitorSection(),
                FeatureCardsSection(),
                TrustCommitmentSection(),
                StabilityAdvantageSection(),
                PredictableValueSection(),
                AllInOneAppSection(),
                FooterWidget(),
              ],
            ),
          ),
          // Scroll to Top Button with Progress Indicator
          ScrollToTopButton(
            scrollController: _scrollController,
            progressColor: AppColor.primary,
            showAfterScroll: 300,
          ),
        ],
      ),
    );
  }
}
