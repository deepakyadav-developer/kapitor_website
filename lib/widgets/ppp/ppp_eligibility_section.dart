import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// PPP Eligibility Section
class PppEligibilitySection extends StatefulWidget {
  const PppEligibilitySection({super.key});

  @override
  State<PppEligibilitySection> createState() => _PppEligibilitySectionState();
}

class _PppEligibilitySectionState extends State<PppEligibilitySection>
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
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
          vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
        ),
        child: Column(
          children: [
            // Badge
            AppText(
              'LIMITED ACCESS BY DESIGN',
              style: Ts.medium(
                size: isDesktop ? 14 : 12,
                color: const Color(0xFF4DB8A4),
              ),
            ),
            Hbox(isDesktop ? 16 : 12),
            // Title
            AppText(
              'Eligibility For PPP',
              style: Ts.bold(
                size: isDesktop ? 48 : (isTablet ? 38 : 28),
                color: Colors.white,
              ),
            ),
            Hbox(isDesktop ? 20 : 16),
            // Description
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 100 : (isTablet ? 40 : 0),
              ),
              child: AppText(
                'PPP access is restricted to a small, global investor class to maintain regulatory compliance, pool stability, institutional discipline, and controlled risk exposure. PPP is not retail. PPP is not mass-market. PPP is for the financial elite.',
                style: Ts.regular(
                  size: isDesktop ? 15 : 14,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Hbox(isDesktop ? 60 : 40),
            // Eligibility Cards
            isMobile
                ? _buildMobileLayout()
                : _buildDesktopLayout(isDesktop, isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildEligibilityCard(
          icon: FontAwesomeIcons.userTie,
          title: 'HNI / UHNWI',
          description:
              'Investors with high liquidity profiles\nseeking structured wealth products.',
          isLarge: false,
        ),
        Hbox(40),
        _buildEligibilityCard(
          icon: FontAwesomeIcons.userGroup,
          title: 'Accredited Investors',
          description:
              'Documented according to jurisdiction\n(SEC/ESMA-approved standards).',
          isLarge: false,
        ),
        Hbox(40),
        _buildEligibilityCard(
          icon: FontAwesomeIcons.gift,
          title: 'Institutions & Family Offices',
          description:
              'Entities requiring multi-year, insured,\nhigh-yield programmes with predictable compounding.',
          isLarge: false,
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 60 : 40),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Wave line connecting the cards
          Positioned(
            top: isDesktop ? 60 : 50,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(double.infinity, 2),
              painter: WaveLinePainter(),
            ),
          ),
          // Cards Row
          Row(
            children: [
              Expanded(
                child: _buildEligibilityCard(
                  icon: FontAwesomeIcons.userTie,
                  title: 'HNI / UHNWI',
                  description:
                      'Investors with high liquidity profiles\nseeking structured wealth products.',
                  isLarge: isDesktop,
                ),
              ),
              Wbox(isDesktop ? 60 : 40),
              Expanded(
                child: _buildEligibilityCard(
                  icon: FontAwesomeIcons.userGroup,
                  title: 'Accredited Investors',
                  description:
                      'Documented according to jurisdiction\n(SEC/ESMA-approved standards).',
                  isLarge: isDesktop,
                ),
              ),
              Wbox(isDesktop ? 60 : 40),
              Expanded(
                child: _buildEligibilityCard(
                  icon: FontAwesomeIcons.gift,
                  title: 'Institutions & Family Offices',
                  description:
                      'Entities requiring multi-year, insured,\nhigh-yield programmes with predictable compounding.',
                  isLarge: isDesktop,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEligibilityCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isLarge,
  }) {
    return Column(
      children: [
        // Icon Circle
        Container(
          width: isLarge ? 80 : 60,
          height: isLarge ? 80 : 60,
          decoration: BoxDecoration(
            color: const Color(0xFF2C3E50),
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF4DB8A4), width: 2),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4DB8A4).withValues(alpha: 0.3),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: FaIcon(
              icon,
              color: const Color(0xFF4DB8A4),
              size: isLarge ? 32 : 24,
            ),
          ),
        ),
        Hbox(isLarge ? 24 : 20),
        // Title
        AppText(
          title,
          style: Ts.bold(size: isLarge ? 20 : 18, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Hbox(isLarge ? 12 : 10),
        // Description
        AppText(
          description,
          style: Ts.regular(
            size: isLarge ? 14 : 13,
            color: Colors.white.withValues(alpha: 0.6),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Custom painter for the wave line
class WaveLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4DB8A4)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final width = size.width;

    // Start from left
    path.moveTo(0, 0);

    // Create wave pattern
    final waveCount = 8;
    final waveWidth = width / waveCount;
    final waveHeight = 20.0;

    for (int i = 0; i < waveCount; i++) {
      final x1 = waveWidth * i + waveWidth / 4;
      final y1 = i % 2 == 0 ? -waveHeight : waveHeight;
      final x2 = waveWidth * i + waveWidth * 3 / 4;
      final y2 = i % 2 == 0 ? waveHeight : -waveHeight;
      final x3 = waveWidth * (i + 1);
      final y3 = 0.0;

      path.cubicTo(x1, y1, x2, y2, x3, y3);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
