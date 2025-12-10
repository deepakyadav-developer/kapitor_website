import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';

class TravelSponsorSection extends StatelessWidget {
  const TravelSponsorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 60 : (isTablet ? 40 : 30),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isDesktop ? 1200 : double.infinity,
          ),
          child: Image.asset(
            AppImage.sponsore,
            fit: BoxFit.contain,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: isDesktop ? 150 : (isTablet ? 120 : 80),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    Icons.business,
                    size: isDesktop ? 60 : (isTablet ? 50 : 40),
                    color: Colors.grey.shade400,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
