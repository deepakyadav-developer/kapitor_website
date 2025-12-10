import 'package:flutter/material.dart';
import 'package:kapitor_website/widgets/customer_care/customer_care_hero_section.dart';
import 'package:kapitor_website/widgets/customer_care/support_services_section.dart';
import 'package:kapitor_website/widgets/customer_care/faq_section.dart';
import 'package:kapitor_website/widgets/customer_care/contact_form_section.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';

/// Customer Care & FAQ Page
class CustomerCarePage extends StatelessWidget {
  const CustomerCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            CustomerCareHeroSection(),
            SupportServicesSection(),
            FaqSection(),
            ContactFormSection(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
