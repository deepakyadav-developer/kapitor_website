import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TravelBookingStepsSection extends StatelessWidget {
  const TravelBookingStepsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFE8F9F3), Color(0xFFF0FCF7), Colors.white],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 80 : (isTablet ? 60 : 40),
      ),
      child: isMobile
          ? _buildMobileLayout(isDesktop, isTablet)
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: _buildContentSection(isDesktop, isTablet),
                ),
                Wbox(isDesktop ? 80 : 40),
                Expanded(
                  flex: 1,
                  child: _buildCardSection(isDesktop, isTablet, isMobile),
                ),
              ],
            ),
    );
  }

  Widget _buildMobileLayout(bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContentSection(isDesktop, isTablet),
        Hbox(40),
        _buildCardSection(isDesktop, isTablet, true),
      ],
    );
  }

  Widget _buildContentSection(bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        AppText(
          'Easy and Fast',
          style: Ts.semiBold(
            size: isDesktop ? 18 : 16,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),

        Hbox(16),

        // Main Heading
        AppText(
          'Book Your Next Trip\nIn 3 Easy Steps',
          style: Ts.bold(
            size: isDesktop ? 48 : (isTablet ? 38 : 32),
            color: const Color(0xFF14183E),
          ),
        ),

        Hbox(isDesktop ? 40 : 32),

        // Step 1 - Selected with 3D effect
        _StepItem(
          icon: Icons.location_on,
          iconColor: const Color(0xFFF0B90B),
          title: 'Choose Destination',
          description:
              'Select your dream destination from our extensive list of global locations and start planning your perfect getaway.',
          isDesktop: isDesktop,
          isTablet: isTablet,
          isSelected: true,
        ),

        Hbox(24),

        // Step 2
        _StepItem(
          icon: Icons.credit_card,
          iconColor: const Color(0xFFFF6F61),
          title: 'Make Payment',
          description:
              'Complete your booking securely using USDT cryptocurrency for instant confirmation and competitive rates.',
          isDesktop: isDesktop,
          isTablet: isTablet,
          isSelected: false,
        ),

        Hbox(24),

        // Step 3
        _StepItem(
          icon: Icons.flight_takeoff,
          iconColor: const Color(0xFF006380),
          title: 'Reach Airport on Selected Date',
          description:
              'Receive your travel documents instantly and arrive at the airport ready for your adventure.',
          isDesktop: isDesktop,
          isTablet: isTablet,
          isSelected: false,
        ),
      ],
    );
  }

  Widget _buildCardSection(bool isDesktop, bool isTablet, bool isMobile) {
    return Column(
      children: [
        // Plane with planeway in Stack (top section)
        SizedBox(
          height: isMobile ? 120 : (isTablet ? 160 : 200),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Planeway background
              Positioned(
                right: isMobile ? -20 : (isTablet ? -30 : -40),
                top: 10,
                child: Image.asset(
                  AppImage.planeway,
                  width: isMobile ? 180 : (isTablet ? 240 : 300),
                  height: isMobile ? 120 : (isTablet ? 160 : 200),
                  fit: BoxFit.contain,
                ),
              ),
              // Plane on top of planeway
              Positioned(
                right: isMobile ? 0 : (isTablet ? 10 : 20),
                top: isMobile ? 0 : (isTablet ? 15 : -70),
                child: Image.asset(
                  AppImage.plane,
                  width: isMobile ? 50 : (isTablet ? 70 : 90),
                  height: isMobile ? 50 : (isTablet ? 70 : 90),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),

        Hbox(isMobile ? 20 : (isTablet ? 30 : 40)),

        // Main travel5 image below
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            AppImage.travel5,
            width: double.infinity,
            height: isMobile ? 300 : (isTablet ? 400 : 500),
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: isMobile ? 300 : (isTablet ? 400 : 500),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 80, color: Colors.grey),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _StepItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final bool isDesktop;
  final bool isTablet;
  final bool isSelected;

  const _StepItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.isDesktop,
    required this.isTablet,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isSelected
          ? EdgeInsets.all(isDesktop ? 20 : 16)
          : EdgeInsets.zero,
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                  spreadRadius: 5,
                ),
              ],
            )
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: isDesktop ? 50 : 45,
            height: isDesktop ? 50 : 45,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: isDesktop ? 28 : 24),
          ),

          Wbox(16),

          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  style: Ts.bold(
                    size: isDesktop ? 18 : 16,
                    color: const Color(0xFF5E6282),
                  ),
                ),
                Hbox(8),
                AppText(
                  description,
                  style: Ts.regular(
                    size: isDesktop ? 15 : 14,
                    color: const Color(0xFF5E6282).withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
