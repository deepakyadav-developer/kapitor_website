import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';

class HeroBackgroundImages extends StatelessWidget {
  const HeroBackgroundImages({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Stack(
      children: [
        // Cube image - top left
        Positioned(
          top: isMobile ? 20 : 40,
          left: isMobile ? 20 : 50,
          child: Image.asset(
            AppImage.cube,
            width: isMobile ? 80 : 100,
            height: isMobile ? 80 : 100,
            fit: BoxFit.contain,
          ),
        ),

        // Boost card - left side below cube
        Positioned(
          top: isMobile ? 120 : 220,
          left: isMobile ? 20 : 40,
          child: Image.asset(
            AppImage.boostCard,
            width: isMobile ? 100 : 200,
            height: isMobile ? 100 : 200,
            fit: BoxFit.contain,
          ),
        ),

        // Test image - above graph on right side
        Positioned(
          top: isMobile ? 20 : 40,
          right: isMobile ? 10 : 20,
          child: Image.asset(
            AppImage.test,
            width: isMobile ? 60 : 120,
            height: isMobile ? 60 : 120,
            fit: BoxFit.contain,
          ),
        ),

        // Graph - right side
        Positioned(
          top: isMobile ? 100 : 180,
          right: isMobile ? 10 : 20,
          child: Image.asset(
            AppImage.graph,
            width: isMobile ? 120 : 240,
            height: isMobile ? 120 : 240,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

