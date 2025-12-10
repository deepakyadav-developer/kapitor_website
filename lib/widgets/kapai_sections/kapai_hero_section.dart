import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KapAiHeroSection extends StatelessWidget {
  const KapAiHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      height: isMobile ? null : screenHeight * 0.85,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.white,
            const Color(0xFFFFFBE6).withValues(alpha: 0.3),
            const Color(0xFFE8F9F3).withValues(alpha: 0.5),
            const Color(0xFFE0F7FA),
          ],
          stops: const [0.0, 0.3, 0.6, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Decorative circles
          if (!isMobile) ...[
            Positioned(
              right: isDesktop ? 200 : 150,
              top: isDesktop ? 100 : 80,
              child: Container(
                width: isDesktop ? 150 : 120,
                height: isDesktop ? 150 : 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFFFFC107).withValues(alpha: 0.3),
                      const Color(0xFFFFC107).withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: isDesktop ? 100 : 70,
              top: isDesktop ? 200 : 160,
              child: Container(
                width: isDesktop ? 100 : 80,
                height: isDesktop ? 100 : 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColor.primary.withValues(alpha: 0.2),
                      AppColor.primary.withValues(alpha: 0.0),
                    ],
                  ),
                ),
              ),
            ),
          ],

          // Main content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
              vertical: isDesktop ? 60 : (isTablet ? 40 : 30),
            ),
            child: isMobile
                ? _buildMobileLayout(isMobile)
                : _buildDesktopLayout(isDesktop, isTablet),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hbox(20),
        // Badge
        AppText(
          '55,000+ TRUSTED BUSINESSES',
          style: Ts.semiBold(
            size: 11,
            color: Colors.black.withValues(alpha: 0.5),
          ).copyWith(letterSpacing: 1.5),
        ),
        Hbox(24),
        // Heading
        AppText(
          'KAPAI — The Intelligence\nLayer Across Kapitor',
          style: Ts.bold(size: 32, color: Colors.black),
        ),
        Hbox(20),
        // Description
        AppText(
          'KapAI is the predictive engine that powers every financial decision, security process, and insight inside Kapitor. A full-spectrum financial intelligence system.',
          style: Ts.regular(
            size: 15,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),
        Hbox(24),
        // Robot image
        Center(
          child: Image.asset(
            AppImage.ai,
            height: 300,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 300,
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(Icons.smart_toy, size: 100, color: Colors.grey),
                ),
              );
            },
          ),
        ),
        Hbox(24),
        // Email input with button inside
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: Colors.black.withValues(alpha: 0.1),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your mail address',
                    hintStyle: Ts.regular(
                      size: 14,
                      color: Colors.black.withValues(alpha: 0.4),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 0,
                ),
                child: AppText(
                  'Get Started',
                  style: Ts.semiBold(size: 14, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Hbox(24),
        // Features
        _buildFeatureItem('Market Sentiment Engine', isMobile),
        Hbox(16),
        _buildFeatureItem('AI-Powered Risk Alerts', isMobile),
        Hbox(40),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      children: [
        // Left content
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Badge
              AppText(
                '55,000+ TRUSTED BUSINESSES',
                style: Ts.semiBold(
                  size: isDesktop ? 12 : 11,
                  color: Colors.black.withValues(alpha: 0.5),
                ).copyWith(letterSpacing: 2),
              ),
              Hbox(isDesktop ? 32 : 24),
              // Heading
              AppText(
                'KAPAI — The Intelligence\nLayer Across Kapitor',
                style: Ts.bold(size: isDesktop ? 52 : 42, color: Colors.black),
              ),
              Hbox(isDesktop ? 24 : 20),
              // Description
              SizedBox(
                width: isDesktop ? 500 : 400,
                child: AppText(
                  'KapAI is the predictive engine that powers every financial decision, security process, and insight inside Kapitor. A full-spectrum financial intelligence system embedded into Kapitor\'s core infrastructure.',
                  style: Ts.regular(
                    size: isDesktop ? 17 : 15,
                    color: Colors.black.withValues(alpha: 0.6),
                  ),
                ),
              ),
              Hbox(isDesktop ? 40 : 32),
              // Email input with button inside
              Container(
                width: isDesktop ? 500 : 420,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.1),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(6),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your mail address',
                          hintStyle: Ts.regular(
                            size: isDesktop ? 15 : 14,
                            color: Colors.black.withValues(alpha: 0.4),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: isDesktop ? 24 : 20,
                            vertical: isDesktop ? 16 : 14,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop ? 36 : 32,
                          vertical: isDesktop ? 18 : 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 0,
                      ),
                      child: AppText(
                        'Get Started',
                        style: Ts.semiBold(
                          size: isDesktop ? 16 : 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Hbox(isDesktop ? 40 : 32),
              // Features
              Row(
                children: [
                  _buildFeatureItem('Market Sentiment Engine', isDesktop),
                  Wbox(isDesktop ? 40 : 32),
                  _buildFeatureItem('AI-Powered Risk Alerts', isDesktop),
                ],
              ),
            ],
          ),
        ),

        Wbox(isDesktop ? 60 : 40),

        // Right side - Robot image with floating badge
        Expanded(
          flex: 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Robot image
              Image.asset(
                AppImage.ai,
                height: isDesktop ? 500 : 400,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: isDesktop ? 500 : 400,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.smart_toy,
                        size: 150,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
              // Floating AI badge
              Positioned(
                top: isDesktop ? 120 : 100,
                left: isDesktop ? 80 : 60,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 24 : 20,
                    vertical: isDesktop ? 16 : 14,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.auto_awesome,
                        color: AppColor.primary,
                        size: isDesktop ? 24 : 20,
                      ),
                      Wbox(8),
                      AppText(
                        'AI',
                        style: Ts.bold(
                          size: isDesktop ? 18 : 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String text, bool isLarge) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: isLarge ? 8 : 6,
          height: isLarge ? 8 : 6,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        Wbox(12),
        AppText(
          text,
          style: Ts.regular(
            size: isLarge ? 15 : 14,
            color: Colors.black.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
