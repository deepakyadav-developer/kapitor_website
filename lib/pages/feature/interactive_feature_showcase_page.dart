import 'package:flutter/material.dart';
import 'package:kapitor_website/widgets/common/interactive_feature_example.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';

/// Showcase page for the Interactive Feature Section
class InteractiveFeatureShowcasePage extends StatelessWidget {
  const InteractiveFeatureShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            InteractiveFeatureExample(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
