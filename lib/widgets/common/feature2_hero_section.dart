import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Feature 2 Hero Section - Trading themed
/// Matches the "Your Edge in the Market" design
class Feature2HeroSection extends StatefulWidget {
  const Feature2HeroSection({super.key});

  @override
  State<Feature2HeroSection> createState() => _Feature2HeroSectionState();
}

class _Feature2HeroSectionState extends State<Feature2HeroSection>
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
      begin: const Offset(0, 0.3),
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
      children: [
        _buildBadge(false),
        Hbox(24),
        _buildTitle(false),
        Hbox(16),
        _buildDescription(false),
        Hbox(40),
        _buildImage(false),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBadge(isDesktop),
              Hbox(isDesktop ? 32 : 24),
              _buildTitle(isDesktop),
              Hbox(isDesktop ? 24 : 20),
              _buildDescription(isDesktop),
            ],
          ),
        ),
        Wbox(isDesktop ? 80 : 60),
        Expanded(flex: 1, child: _buildImage(isDesktop)),
      ],
    );
  }

  Widget _buildBadge(bool isLarge) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isLarge ? 24 : 20,
        vertical: isLarge ? 12 : 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(50),
      ),
      child: AppText(
        'Trading',
        style: Ts.medium(size: isLarge ? 14 : 13, color: Colors.black87),
      ),
    );
  }

  Widget _buildTitle(bool isLarge) {
    return AppText(
      'Your Edge in the\nMarket: Hero Headings\nfor Trading',
      style: Ts.bold(
        size: isLarge ? 48 : 32,
        color: Colors.black,
      ).copyWith(height: 1.2),
    );
  }

  Widget _buildDescription(bool isLarge) {
    return SizedBox(
      width: isLarge ? 550 : double.infinity,
      child: AppText(
        'Empower the world with a transparent, borderless financial system where anyone can bank, invest, trade, and grow wealth — all in one app, powered by stablecoins.',
        style: Ts.regular(
          size: isLarge ? 16 : 14,
          color: Colors.black.withValues(alpha: 0.7),
        ).copyWith(height: 1.6),
      ),
    );
  }

  Widget _buildImage(bool isLarge) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Decorative circle background
        Positioned(
          top: -50,
          right: -50,
          child: Container(
            width: isLarge ? 400 : 300,
            height: isLarge ? 400 : 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFFFE4CC).withValues(alpha: 0.5),
                width: 2,
              ),
            ),
          ),
        ),
        // Main image
        Center(
          child: Image.asset(
            AppImage.feature2,
            height: isLarge ? 450 : 350,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: isLarge ? 450 : 350,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(Icons.trending_up, size: 80, color: Colors.grey),
                ),
              );
            },
          ),
        ),
        // Decorative elements
        Positioned(
          top: 50,
          left: -20,
          child: _buildDecorativeIcon(
            Icons.circle,
            const Color(0xFFE0E0E0),
            20,
          ),
        ),
        Positioned(
          bottom: 100,
          right: -10,
          child: _buildDecorativeIcon(
            Icons.circle,
            const Color(0xFF4CAF50),
            30,
          ),
        ),
        Positioned(
          top: 150,
          right: 50,
          child: _buildDecorativeIcon(
            Icons.circle,
            const Color(0xFF4CAF50),
            25,
          ),
        ),
      ],
    );
  }

  Widget _buildDecorativeIcon(IconData icon, Color color, double size) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.3),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: size, color: color),
    );
  }
}
