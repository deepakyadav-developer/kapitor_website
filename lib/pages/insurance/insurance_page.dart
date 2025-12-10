import 'package:flutter/material.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';
import 'package:kapitor_website/widgets/insurance_sections/doctor_travel_section.dart';
import 'package:kapitor_website/widgets/insurance_sections/agriculture_insurance_section.dart';
import 'package:kapitor_website/widgets/insurance_sections/essence_faq_section.dart';
import 'package:kapitor_website/widgets/insurance_sections/future_insurance_section.dart';
import 'package:kapitor_website/widgets/insurance_sections/get_app_section.dart';
import 'package:kapitor_website/widgets/insurance_sections/insurance_features_section.dart';
import 'package:kapitor_website/widgets/insurance_sections/insurance_hero_section.dart';
import 'package:kapitor_website/widgets/insurance_sections/invite_team_insurance_section.dart';
import 'package:kapitor_website/widgets/insurance_sections/kapsure_kapclear_section.dart';

class InsurancePage extends StatelessWidget {
  const InsurancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: HeaderWidget.buildMobileDrawer(context),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            InsuranceHeroSection(),
            InviteTeamInsuranceSection(),
            DoctorTravelSection(),
            GetAppSection(),
            AgricultureInsuranceSection(),
            InsuranceFeaturesSection(),
            FutureInsuranceSection(),
            KapsureKapclearSection(),
            EssenceFaqSection(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
