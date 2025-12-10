import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class ForecastViewingSection extends StatelessWidget {
  const ForecastViewingSection({Key? key}) : super(key: key);

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

        return Column(
          children: [
            // Viewing Forecast Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [const Color(0xFFE8F5F1), const Color(0xFFD4F1E8)],
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: isMobile
                  ? _buildMobileLayout()
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left Section - Stacked Phone Images
                        Expanded(
                          flex: 1,
                          child: _buildStackedPhones(isDesktop, isTablet),
                        ),
                        Wbox(isDesktop ? 80.0 : 60.0),
                        // Right Section - Content
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                'How it works',
                                style: Ts.semiBold(
                                  size: isDesktop
                                      ? 14.0
                                      : (isTablet ? 13.0 : 12.0),
                                  color: const Color(0xFF26CE92),
                                ),
                              ),
                              Hbox(isDesktop ? 16.0 : 12.0),
                              AppText(
                                'Viewing long- term\nand short -term\nforcast',
                                style: Ts.bold(
                                  size: isDesktop
                                      ? 40.0
                                      : (isTablet ? 32.0 : 28.0),
                                  color: Colors.black,
                                ),
                              ),
                              Hbox(isDesktop ? 24.0 : 20.0),
                              AppText(
                                'Analyze market trends with AI-powered forecasting tools. View long-term and short-term predictions to make informed trading decisions.',
                                style: Ts.regular(
                                  size: isDesktop
                                      ? 16.0
                                      : (isTablet ? 15.0 : 14.0),
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Hbox(isDesktop ? 40.0 : 32.0),
                              AppText(
                                'Explore Now',
                                style: Ts.semiBold(
                                  size: isDesktop
                                      ? 16.0
                                      : (isTablet ? 15.0 : 14.0),
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),

            // Agriculture Trading Section
            Container(
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
                            size: isDesktop ? 36.0 : (isTablet ? 28.0 : 24.0),
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
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: isDesktop ? 800 : double.infinity,
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
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStackedPhones(bool isDesktop, bool isTablet) {
    final phoneHeight = isDesktop ? 550.0 : (isTablet ? 450.0 : 380.0);

    return SizedBox(
      height: phoneHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Back phone (ltst1)
          Positioned(
            left: isDesktop ? 40 : 20,
            top: isDesktop ? 40 : 20,
            child: SizedBox(
              width: isDesktop ? 280 : (isTablet ? 240 : 200),
              child: Image.asset(
                AppImage.feature3,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: isDesktop ? 500 : 400,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            ),
          ),
          // Front phone (ltst1)
          Positioned(
            right: isDesktop ? 40 : 20,
            top: 0,
            child: SizedBox(
              width: isDesktop ? 280 : (isTablet ? 240 : 200),
              child: Image.asset(
                AppImage.ltst1,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: isDesktop ? 500 : 400,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        AppText(
          'How it works',
          textAlign: TextAlign.center,
          style: Ts.semiBold(size: 12.0, color: const Color(0xFF26CE92)),
        ),
        Hbox(12.0),
        AppText(
          'Viewing long- term\nand short -term\nforcast',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 28.0, color: Colors.black),
        ),
        Hbox(20.0),
        AppText(
          'Lorem ipsum dolor sit amet. Qui consequatur sint 33 voluptatem officia et sint laboriosam sed ipsa sint ut voluptatum labore et possimus voluptas.',
          textAlign: TextAlign.center,
          style: Ts.regular(size: 14.0, color: Colors.grey.shade700),
        ),
        Hbox(32.0),
        SizedBox(
          height: 350,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 20,
                top: 40,
                child: SizedBox(
                  width: 160,
                  child: Image.asset(AppImage.ltst1, fit: BoxFit.contain),
                ),
              ),
              Positioned(
                right: 20,
                top: 0,
                child: SizedBox(
                  width: 160,
                  child: Image.asset(AppImage.ltst1, fit: BoxFit.contain),
                ),
              ),
            ],
          ),
        ),
        Hbox(32.0),
        AppText(
          'Explore Now',
          style: Ts.semiBold(size: 14.0, color: Colors.black),
        ),
      ],
    );
  }
}
