import 'package:flutter/material.dart';
import 'package:kapitor_website/widgets/terms/terms_content_section.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';

/// Terms and Conditions Page
class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [HeaderWidget(), TermsContentSection(), FooterWidget()],
        ),
      ),
    );
  }
}
