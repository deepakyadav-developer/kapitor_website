import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Feature 7 - Book Your Next Trip Section
/// Light theme with booking steps and trip card
class Feature7BookingStepsSection extends StatefulWidget {
  const Feature7BookingStepsSection({super.key});

  @override
  State<Feature7BookingStepsSection> createState() =>
      _Feature7BookingStepsSectionState();
}

class _Feature7BookingStepsSectionState
    extends State<Feature7BookingStepsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _step1Animation;
  late Animation<double> _step2Animation;
  late Animation<double> _step3Animation;
  late Animation<double> _cardAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.0, 0.3, curve: Curves.easeOutCubic),
          ),
        );

    _step1Animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
      ),
    );

    _step2Animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.7, curve: Curves.easeOut),
      ),
    );

    _step3Animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.9, curve: Curves.easeOut),
      ),
    );

    _cardAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );

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
      color: const Color(0xFFF5F7FA),
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
        // Badge
        AppText(
          'Easy and Fast',
          style: Ts.regular(
            size: isLarge ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.5),
          ),
        ),
        Hbox(16),
        // Main Title
        AppText(
          'Book Your Next Trip\nIn 3 Easy Steps With\nKapitor',
          style: Ts.bold(
            size: isLarge ? 48 : 32,
            color: const Color(0xFF1A1A2E),
          ).copyWith(height: 1.2),
        ),
        Hbox(isLarge ? 48 : 32),
        // Step 1 - Animated
        FadeTransition(
          opacity: _step1Animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-0.3, 0),
              end: Offset.zero,
            ).animate(_step1Animation),
            child: _buildStepItem(
              Icons.location_on,
              'Choose Destination',
              'Browse flights, hotels, and travel packages. Select your destination and dates with instant USDT pricing.',
              const Color(0xFFFFA500),
              isLarge,
            ),
          ),
        ),
        Hbox(32),
        // Step 2 - Animated
        FadeTransition(
          opacity: _step2Animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-0.3, 0),
              end: Offset.zero,
            ).animate(_step2Animation),
            child: _buildStepItem(
              Icons.payment,
              'Make Payment',
              'Pay instantly with USDT from your Kapitor Wallet. Secure, fast, and no currency conversion fees.',
              const Color(0xFFFF6B6B),
              isLarge,
            ),
          ),
        ),
        Hbox(32),
        // Step 3 - Animated
        FadeTransition(
          opacity: _step3Animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-0.3, 0),
              end: Offset.zero,
            ).animate(_step3Animation),
            child: _buildStepItem(
              Icons.local_airport,
              'Reach Airport on Selected Date',
              'Receive instant booking confirmation and e-tickets. Track your trip status and enjoy seamless travel.',
              const Color(0xFF4A90E2),
              isLarge,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStepItem(
    IconData icon,
    String title,
    String description,
    Color color,
    bool isLarge,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: isLarge ? 60 : 50,
          height: isLarge ? 60 : 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: isLarge ? 28 : 24, color: Colors.white),
        ),
        Wbox(20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                style: Ts.bold(
                  size: isLarge ? 18 : 16,
                  color: const Color(0xFF5E6282),
                ),
              ),
              Hbox(8),
              AppText(
                description,
                style: Ts.regular(
                  size: isLarge ? 15 : 13,
                  color: const Color(0xFF5E6282).withValues(alpha: 0.7),
                ).copyWith(height: 1.6),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRightContent(bool isLarge) {
    return Center(
      child: FadeTransition(
        opacity: _cardAnimation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(_cardAnimation),
          child: Image.asset(
            AppImage.travel5,
            width: isLarge ? 700 : (isLarge ? 400 : double.infinity),
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: isLarge ? 500 : 400,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(
                    Icons.travel_explore,
                    size: 80,
                    color: Colors.grey,
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
