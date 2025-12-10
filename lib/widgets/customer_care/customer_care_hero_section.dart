import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Customer Care Hero Section
/// Shows dedicated customer care with Group image, cube, and boost-card
class CustomerCareHeroSection extends StatefulWidget {
  const CustomerCareHeroSection({super.key});

  @override
  State<CustomerCareHeroSection> createState() =>
      _CustomerCareHeroSectionState();
}

class _CustomerCareHeroSectionState extends State<CustomerCareHeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

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
          child: Column(
            children: [
              // Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.2),
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: AppText(
                  'Customer Care',
                  style: Ts.regular(
                    size: isMobile ? 13 : 15,
                    color: Colors.black.withValues(alpha: 0.7),
                  ),
                ),
              ),
              Hbox(isDesktop ? 40 : 32),
              // Main Title
              AppText(
                'Dedicated Customer Care &\nPremium Support',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 56 : (isTablet ? 42 : 32),
                  color: Colors.black,
                ).copyWith(height: 1.2),
              ),
              Hbox(isDesktop ? 80 : 60),
              // Images Section with cube, group, and boost-card
              _buildImagesSection(isDesktop, isTablet, isMobile),
              Hbox(isDesktop ? 60 : 40),
              // Bottom Text
              SizedBox(
                width: isDesktop ? 800 : double.infinity,
                child: AppText(
                  'The Kapitor Commitment: Dedicated, Expert Support When You Need It',
                  textAlign: TextAlign.center,
                  style: Ts.regular(
                    size: isDesktop ? 18 : (isTablet ? 16 : 14),
                    color: Colors.black.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagesSection(bool isDesktop, bool isTablet, bool isMobile) {
    if (isMobile) {
      return Column(
        children: [
          _buildCubeImage(false),
          Hbox(40),
          _buildGroupImage(false),
          Hbox(40),
          _buildBoostCardImage(false),
        ],
      );
    }

    return SizedBox(
      height: isDesktop ? 400 : 350,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Cube on the left
          Positioned(
            left: isDesktop ? 0 : 20,
            top: isDesktop ? 100 : 120,
            child: _buildCubeImage(isDesktop),
          ),
          // Group image in the center
          Center(child: _buildGroupImage(isDesktop)),
          // Boost card on the right
          Positioned(
            right: isDesktop ? 0 : 20,
            top: isDesktop ? 50 : 70,
            child: _buildBoostCardImage(isDesktop),
          ),
        ],
      ),
    );
  }

  Widget _buildCubeImage(bool isLarge) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.rotate(
          angle: value * 0.2,
          child: Image.asset(
            AppImage.cube,
            width: isLarge ? 120 : 80,
            height: isLarge ? 120 : 80,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: isLarge ? 120 : 80,
                height: isLarge ? 120 : 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.view_in_ar,
                  size: 40,
                  color: Colors.grey,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildGroupImage(bool isLarge) {
    return Image.asset(
      AppImage.people,
      height: isLarge ? 350 : 280,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: isLarge ? 350 : 280,
          width: isLarge ? 400 : 320,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.people,
                size: isLarge ? 100 : 80,
                color: Colors.grey.shade400,
              ),
              Hbox(16),
              Icon(
                Icons.support_agent,
                size: isLarge ? 60 : 50,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBoostCardImage(bool isLarge) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, -10 * (1 - value)),
          child: Image.asset(
            AppImage.boostCard,
            width: isLarge ? 140 : 100,
            height: isLarge ? 140 : 100,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: isLarge ? 140 : 100,
                height: isLarge ? 140 : 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade300, Colors.green.shade600],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.card_giftcard,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
