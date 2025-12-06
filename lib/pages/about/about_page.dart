import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/widgets/explore_offering/explore_offering_section.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';
import 'package:kapitor_website/widgets/our_mission/our_mission_section.dart';
import 'package:kapitor_website/widgets/strategic_wealth/strategic_wealth_section.dart';
import 'package:kapitor_website/widgets/testimonial/testimonial_section.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: const [
                HeaderWidget(),
                OurMissionSection(),
                ExploreOfferingSection(),
                StrategicWealthSection(),
                TestimonialSection(),
                FooterWidget(),
              ],
            ),
          ),
          // Dark vertical bar on far right edge
      
        ],
      ),
    );
  }
}

