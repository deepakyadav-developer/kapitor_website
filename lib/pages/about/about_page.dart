import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/widgets/common/scroll_to_top_button.dart';
import 'package:kapitor_website/widgets/explore_offering/explore_offering_section.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';
import 'package:kapitor_website/widgets/our_mission/our_mission_section.dart';
import 'package:kapitor_website/widgets/scalable_userbase/scalable_userbase_section.dart';
import 'package:kapitor_website/widgets/strategic_wealth/strategic_wealth_section.dart';
import 'package:kapitor_website/widgets/testimonial/testimonial_section.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
                OurMissionSection(),
                ExploreOfferingSection(),
                StrategicWealthSection(),
                TestimonialSection(),
                ScalableUserbaseSection(),
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
