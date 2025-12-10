import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// PPP Hero Section with Stacked Cards
class PppHeroSection extends StatefulWidget {
  const PppHeroSection({super.key});

  @override
  State<PppHeroSection> createState() => _PppHeroSectionState();
}

class _PppHeroSectionState extends State<PppHeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

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

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        width: double.infinity,
        color: const Color(0xFFF5F7FA),
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
          vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
        ),
        child: isMobile
            ? _buildMobileLayout()
            : _buildDesktopLayout(isDesktop, isTablet),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [_buildLeftContent(false), Hbox(40), _buildRightContent(false)],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: _buildLeftContent(isDesktop)),
        Wbox(isDesktop ? 100 : 60),
        Expanded(flex: 1, child: _buildRightContent(isDesktop)),
      ],
    );
  }

  Widget _buildLeftContent(bool isLarge) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Title - 2 lines
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'PRIVATE PLACEMENT PROGRAMME (PPP) ',
                style: Ts.bold(
                  size: isLarge ? 52 : 36,
                  color: Colors.black,
                ).copyWith(height: 1.2),
              ),
              TextSpan(
                text: '\nInstitutional Wealth Engine',
                style: Ts.bold(
                  size: isLarge ? 52 : 36,
                  color: Colors.black,
                ).copyWith(height: 1.2),
              ),
            ],
          ),
        ),
        Hbox(isLarge ? 24 : 20),
        // Subtitle
        AppText(
          'A private, insured, AI-governed investment architecture designed exclusively for accredited investors, HNIs, UHNWI, institutions, and family offices.',
          style: Ts.regular(
            size: isLarge ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.6),
          ).copyWith(height: 1.6),
        ),
        Hbox(isLarge ? 40 : 32),
        // Features Grid
        _buildFeaturesGrid(isLarge),
        Hbox(isLarge ? 40 : 32),
        // Download Button
        _buildDownloadButton(isLarge),
      ],
    );
  }

  Widget _buildFeaturesGrid(bool isLarge) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildFeatureItem('10x to 20x Returns', isLarge)),
            Wbox(isLarge ? 40 : 24),
            Expanded(child: _buildFeatureItem('Principal Insured', isLarge)),
          ],
        ),
        Hbox(16),
        Row(
          children: [
            Expanded(child: _buildFeatureItem('Daily NAV Tracking', isLarge)),
            Wbox(isLarge ? 40 : 24),
            Expanded(child: _buildFeatureItem('AI Risk Management', isLarge)),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String text, bool isLarge) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFF4DB8A4).withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            size: isLarge ? 16 : 14,
            color: const Color(0xFF4DB8A4),
          ),
        ),
        Wbox(12),
        Expanded(
          child: AppText(
            text,
            style: Ts.regular(
              size: isLarge ? 15 : 14,
              color: Colors.black.withValues(alpha: 0.7),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDownloadButton(bool isLarge) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isLarge ? 32 : 28,
          vertical: isLarge ? 16 : 14,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF4DB8A4),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF4DB8A4).withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: AppText(
          'Apply for PPP',
          style: Ts.bold(size: isLarge ? 15 : 14, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildRightContent(bool isLarge) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isLarge ? 500 : 400,
          maxHeight: isLarge ? 500 : 400,
        ),
        child: Image.asset(
          AppImage.ppp1,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            // Fallback to card stack if image not found
            return SizedBox(
              height: isLarge ? 500 : 400,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Profile image at top
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
