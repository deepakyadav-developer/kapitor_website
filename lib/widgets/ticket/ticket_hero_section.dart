import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Ticket Hero Section
/// Priority Support Desk introduction with secure badge
class TicketHeroSection extends StatefulWidget {
  const TicketHeroSection({super.key});

  @override
  State<TicketHeroSection> createState() => _TicketHeroSectionState();
}

class _TicketHeroSectionState extends State<TicketHeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1A1A2E),
              const Color(0xFF16213E),
              const Color(0xFF0F3460),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
          vertical: isDesktop ? 120 : (isTablet ? 80 : 60),
        ),
        child: Column(
          children: [
            // Secure Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xFF4DB8A4).withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.lock,
                    size: 14,
                    color: Color(0xFF4DB8A4),
                  ),
                  Wbox(8),
                  AppText(
                    'SECURE PRIORITY SUPPORT DESK',
                    style: Ts.semiBold(
                      size: isDesktop ? 13 : 12,
                      color: const Color(0xFF4DB8A4),
                    ),
                  ),
                ],
              ),
            ),
            Hbox(32),
            // Main Title
            AppText(
              'Submit a Ticket',
              textAlign: TextAlign.center,
              style: Ts.bold(
                size: isDesktop ? 72 : (isTablet ? 56 : 40),
                color: Colors.white,
              ).copyWith(height: 1.1),
            ),
            Hbox(24),
            // Subtitle
            Container(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 800 : double.infinity,
              ),
              child: AppText(
                'A secure, structured channel for resolving advanced issues, account-specific concerns, and operational escalations',
                textAlign: TextAlign.center,
                style: Ts.regular(
                  size: isDesktop ? 18 : (isTablet ? 16 : 14),
                  color: Colors.white.withValues(alpha: 0.8),
                ).copyWith(height: 1.6),
              ),
            ),
            Hbox(48),
            // Key Features
            Wrap(
              spacing: isDesktop ? 40 : 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                _FeatureBadge(
                  icon: FontAwesomeIcons.clockRotateLeft,
                  text: '1-2 Hour Response',
                  isLarge: isDesktop,
                ),
                _FeatureBadge(
                  icon: FontAwesomeIcons.userShield,
                  text: 'Specialist Teams',
                  isLarge: isDesktop,
                ),
                _FeatureBadge(
                  icon: FontAwesomeIcons.chartLine,
                  text: 'Full Tracking',
                  isLarge: isDesktop,
                ),
                _FeatureBadge(
                  icon: FontAwesomeIcons.shieldHalved,
                  text: 'Audit-Proof Logs',
                  isLarge: isDesktop,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureBadge extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isLarge;

  const _FeatureBadge({
    required this.icon,
    required this.text,
    required this.isLarge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isLarge ? 24 : 20,
        vertical: isLarge ? 14 : 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, size: isLarge ? 16 : 14, color: const Color(0xFF4DB8A4)),
          Wbox(10),
          AppText(
            text,
            style: Ts.medium(size: isLarge ? 14 : 13, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
