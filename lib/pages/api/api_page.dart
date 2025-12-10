import 'package:flutter/material.dart';
import 'package:kapitor_website/widgets/api/api_hero_section.dart';
import 'package:kapitor_website/widgets/api/api_categories_section.dart';
import 'package:kapitor_website/widgets/api/api_security_section.dart';
import 'package:kapitor_website/widgets/api/api_endpoints_section.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';

/// API Documentation Page
class ApiPage extends StatelessWidget {
  const ApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            ApiHeroSection(),
            ApiCategoriesSection(),
            ApiSecuritySection(),
            ApiEndpointsSection(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
