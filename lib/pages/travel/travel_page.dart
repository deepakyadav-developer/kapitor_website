import 'package:flutter/material.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';
import 'package:kapitor_website/widgets/travel_sections/travel_booking_steps_section.dart';
import 'package:kapitor_website/widgets/travel_sections/travel_features_section.dart';
import 'package:kapitor_website/widgets/travel_sections/travel_giftcard_section.dart';
import 'package:kapitor_website/widgets/travel_sections/travel_hero_section.dart';
import 'package:kapitor_website/widgets/travel_sections/travel_memories_section.dart';
import 'package:kapitor_website/widgets/travel_sections/travel_point_section.dart';
import 'package:kapitor_website/widgets/travel_sections/travel_services_section.dart';
import 'package:kapitor_website/widgets/travel_sections/travel_sponsor_section.dart';
import 'package:kapitor_website/widgets/travel_sections/travel_why_choose_section.dart';

class TravelPage extends StatelessWidget {
  const TravelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: HeaderWidget.buildMobileDrawer(context),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            TravelHeroSection(),
            TravelSponsorSection(),
            TravelServicesSection(),
            TravelGiftcardSection(),
            TravelPointSection(),
            TravelFeaturesSection(),
            TravelMemoriesSection(),
            TravelWhyChooseSection(),
            TravelBookingStepsSection(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
