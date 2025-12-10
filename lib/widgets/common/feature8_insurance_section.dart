import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Feature 8 - We've Got Your Back Insurance Section
/// Light theme with insurance illustration
class Feature8InsuranceSection extends StatefulWidget {
  const Feature8InsuranceSection({super.key});

  @override
  State<Feature8InsuranceSection> createState() =>
      _Feature8InsuranceSectionState();
}

class _Feature8InsuranceSectionState extends State<Feature8InsuranceSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: isMobile
              ? _buildMobileLayout()
              : _buildDesktopLayout(isDesktop, isTablet),
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildLeftContent(false), Hbox(40), _buildRightContent(false)],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: isDesktop ? 5 : 1, child: _buildLeftContent(isDesktop)),
        Wbox(isDesktop ? 60 : 40),
        Expanded(flex: isDesktop ? 5 : 1, child: _buildRightContent(isDesktop)),
      ],
    );
  }

  Widget _buildLeftContent(bool isLarge) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Main Title
        AppText(
          'We\'ve got\nyour Back',
          style: Ts.bold(
            size: isLarge ? 72 : 42,
            color: Colors.black,
          ).copyWith(height: 1.1),
        ),
        Hbox(isLarge ? 24 : 20),
        // Description
        AppText(
          'Insurance that\'s there for you when you\nneed it the most.',
          style: Ts.regular(
            size: isLarge ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.5),
          ).copyWith(height: 1.6),
        ),
        Hbox(isLarge ? 40 : 32),
        // CTA Button
        _buildExploreButton(isLarge),
        if (isLarge) ...[Hbox(60), _buildDecorativeElements()],
      ],
    );
  }

  Widget _buildExploreButton(bool isLarge) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isLarge ? 40 : 32,
          vertical: isLarge ? 18 : 14,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF4CAF50),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4CAF50).withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: AppText(
          'EXPLORE MORE ON OUR APP',
          style: Ts.bold(size: isLarge ? 14 : 12, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDecorativeElements() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 2,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        Wbox(16),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade400, width: 2),
          ),
        ),
        Wbox(32),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade400, width: 2),
          ),
        ),
      ],
    );
  }

  Widget _buildRightContent(bool isLarge) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Decorative circles around the image
        if (isLarge) ...[
          Positioned(
            top: 10,
            right: 40,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400, width: 2),
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: 10,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 10,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400, width: 2),
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: -10,
            child: Container(
              width: 50,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            right: 60,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 80,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400, width: 2),
              ),
            ),
          ),
        ],
        // Main illustration
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImage.feature7,
              height: isLarge ? 380 : 300,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: isLarge ? 380 : 300,
                  width: isLarge ? 380 : 300,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_work,
                        size: 80,
                        color: Colors.grey.shade400,
                      ),
                      Hbox(16),
                      Icon(
                        Icons.security,
                        size: 60,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                );
              },
            ),
            Hbox(20),
            AppText(
              'Protection from all unfortunate events',
              textAlign: TextAlign.center,
              style: Ts.regular(
                size: isLarge ? 13 : 12,
                color: Colors.black.withValues(alpha: 0.4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
