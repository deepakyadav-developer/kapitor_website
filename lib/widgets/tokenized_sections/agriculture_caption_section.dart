import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class AgricultureCaptionSection extends StatelessWidget {
  const AgricultureCaptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;

        final horizontalPadding = isDesktop
            ? constraints.maxWidth * 0.08
            : (isTablet ? 24.0 : 16.0);
        final verticalPadding = isDesktop ? 80.0 : (isTablet ? 60.0 : 40.0);

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Quote marks and title
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    '"',
                    style: Ts.bold(
                      size: isDesktop ? 80.0 : (isTablet ? 60.0 : 50.0),
                      color: const Color(0xFF26CE92),
                    ),
                  ),
                  Wbox(16.0),
                  Flexible(
                    child: AppText(
                      'Agricultre related trading caption and all',
                      textAlign: TextAlign.center,
                      style: Ts.bold(
                        size: isDesktop ? 42.0 : (isTablet ? 34.0 : 28.0),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Wbox(16.0),
                  AppText(
                    '"',
                    style: Ts.bold(
                      size: isDesktop ? 80.0 : (isTablet ? 60.0 : 50.0),
                      color: const Color(0xFF26CE92),
                    ),
                  ),
                ],
              ),
              Hbox(isDesktop ? 32.0 : 24.0),

              // Description
              Container(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 900 : double.infinity,
                ),
                child: AppText(
                  'Instant everything. Incredible prices. Big heart. Instant everything. Incredible prices. Big heart.Instant everything. Incredible prices. Big heart.Instant everything. Incredible prices. Big heart.',
                  textAlign: TextAlign.center,
                  style: Ts.regular(
                    size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Hbox(isDesktop ? 40.0 : 32.0),

              // Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                    vertical: isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 0,
                ),
                child: AppText(
                  'check your prices',
                  style: Ts.semiBold(
                    size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                    color: Colors.white,
                  ),
                ),
              ),
              Hbox(isDesktop ? 60.0 : 50.0),

              // Rafiki image
              Container(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 700 : double.infinity,
                ),
                child: Image.asset(AppImage.rafiki, fit: BoxFit.contain),
              ),
            ],
          ),
        );
      },
    );
  }
}
