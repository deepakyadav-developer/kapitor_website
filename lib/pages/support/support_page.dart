import 'package:flutter/material.dart';
import 'package:kapitor_website/widgets/support/support_hero_section.dart';
import 'package:kapitor_website/widgets/support/support_services_section.dart';
import 'package:kapitor_website/widgets/support/product_support_section.dart';
import 'package:kapitor_website/widgets/support/account_security_support_section.dart';
import 'package:kapitor_website/widgets/support/education_resources_section.dart';
import 'package:kapitor_website/widgets/support/support_faq_section.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';

/// Support Page - Kapitor Help Center
class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            SupportHeroSection(),
            // SupportServicesSection(),
            // ProductSupportSection(),
            // AccountSecuritySupportSection(),
            // EducationResourcesSection(),
            SupportFaqSection(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
