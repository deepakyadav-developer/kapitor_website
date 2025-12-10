import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/widgets/common/scroll_to_top_button.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';
import 'package:kapitor_website/widgets/kapai_sections/kapai_about_section.dart';
import 'package:kapitor_website/widgets/kapai_sections/kapai_cta_section.dart';
import 'package:kapitor_website/widgets/kapai_sections/kapai_empowering_section.dart';
import 'package:kapitor_website/widgets/kapai_sections/kapai_features_section.dart';
import 'package:kapitor_website/widgets/kapai_sections/kapai_hero_section.dart';
import 'package:kapitor_website/widgets/kapai_sections/kapai_performance_section.dart';
import 'package:kapitor_website/widgets/kapai_sections/kapai_power_section.dart';
import 'package:kapitor_website/widgets/kapai_sections/kapai_solutions_section.dart';
import 'package:kapitor_website/widgets/kapai_sections/kapai_stats_section.dart';
import 'package:kapitor_website/widgets/kapai_sections/kapai_tools_section.dart';

class KapAiPage extends StatefulWidget {
  const KapAiPage({super.key});

  @override
  State<KapAiPage> createState() => _KapAiPageState();
}

class _KapAiPageState extends State<KapAiPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: HeaderWidget.buildMobileDrawer(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: const Column(
              children: [
                HeaderWidget(),
                KapAiHeroSection(),
                KapAiStatsSection(),
                KapAiFeaturesSection(),
                KapAiSolutionsSection(),
                KapAiAboutSection(),
                KapAiPowerSection(),
                KapAiPerformanceSection(),
                KapAiToolsSection(),
                KapAiEmpoweringSection(),
                KapAiCtaSection(),
                FooterWidget(),
              ],
            ),
          ),
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
