import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// PPP One Banking Section
class PppOneBankingSection extends StatefulWidget {
  const PppOneBankingSection({super.key});

  @override
  State<PppOneBankingSection> createState() => _PppOneBankingSectionState();
}

class _PppOneBankingSectionState extends State<PppOneBankingSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  int? _hoveredIndex;

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
        color: Colors.white,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(false),
        Hbox(40),
        _buildFeatureCards(false, true),
        Hbox(40),
        _buildRightContent(false),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(isDesktop),
              Hbox(isDesktop ? 60 : 40),
              _buildFeatureCards(isDesktop, false),
            ],
          ),
        ),
        Wbox(isDesktop ? 80 : 60),
        Expanded(flex: 1, child: _buildRightContent(isDesktop)),
      ],
    );
  }

  Widget _buildTitle(bool isLarge) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Complete PPP',
          style: Ts.bold(
            size: isLarge ? 56 : 40,
            color: Colors.black,
          ).copyWith(height: 1.2),
        ),
        AppText(
          'Documentation Suite',
          style: Ts.bold(
            size: isLarge ? 56 : 40,
            color: Colors.black,
          ).copyWith(height: 1.2),
        ),
      ],
    );
  }

  Widget _buildFeatureCards(bool isLarge, bool isMobile) {
    final features = [
      {
        'icon': FontAwesomeIcons.fileContract,
        'color': const Color(0xFF4DB8A4),
        'title': 'Allocation Certificate',
        'description':
            'Digitally signed certificate with\ninvestment amount, pool tier,\nyield plan, and insurance coverage.',
      },
      {
        'icon': FontAwesomeIcons.chartLine,
        'color': const Color(0xFF4DB8A4),
        'title': 'Daily NAV Reports',
        'description':
            'Real-time Net Asset Value tracking\nwith pool health, strategy\nperformance, and reserve ratios.',
      },
      {
        'icon': FontAwesomeIcons.shieldHalved,
        'color': const Color(0xFF4DB8A4),
        'title': 'Insurance Documents',
        'description':
            'Principal protection coverage\ndetails with custodial, smart\ncontract, and liquidity insurance.',
      },
      {
        'icon': FontAwesomeIcons.robot,
        'color': const Color(0xFF4DB8A4),
        'title': 'AI Risk Reports',
        'description':
            'KapAI surveillance reports with\ndrawdown limits, liquidity exposure,\nand strategy rebalancing insights.',
      },
      {
        'icon': FontAwesomeIcons.fileInvoice,
        'color': const Color(0xFF4DB8A4),
        'title': 'Performance Statements',
        'description':
            'Monthly and quarterly performance\nbreakdowns with compounding\nanalysis and yield projections.',
      },
      {
        'icon': FontAwesomeIcons.signature,
        'color': const Color(0xFF4DB8A4),
        'title': 'E-Sign Contracts',
        'description':
            'Secure digital signing for all\nPPP agreements with blockchain\nverification and hash storage.',
      },
    ];

    if (isMobile) {
      return Column(
        children: List.generate(
          features.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _buildFeatureCard(
              icon: features[index]['icon'] as IconData,
              color: features[index]['color'] as Color,
              title: features[index]['title'] as String,
              description: features[index]['description'] as String,
              index: index,
              isLarge: false,
            ),
          ),
        ),
      );
    }

    return Wrap(
      spacing: isLarge ? 24 : 20,
      runSpacing: isLarge ? 24 : 20,
      children: List.generate(
        features.length,
        (index) => SizedBox(
          width: isLarge ? 240 : 200,
          child: _buildFeatureCard(
            icon: features[index]['icon'] as IconData,
            color: features[index]['color'] as Color,
            title: features[index]['title'] as String,
            description: features[index]['description'] as String,
            index: index,
            isLarge: isLarge,
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required Color color,
    required String title,
    required String description,
    required int index,
    required bool isLarge,
  }) {
    final isHovered = _hoveredIndex == index;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = null),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(isLarge ? 24 : 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isHovered ? color : Colors.grey.shade200,
            width: isHovered ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered
                  ? color.withValues(alpha: 0.3)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: isHovered ? 30 : 10,
              offset: Offset(0, isHovered ? 15 : 4),
            ),
          ],
        ),
        transform: isHovered
            ? (Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(-0.05)
                ..rotateY(0.05)
                ..translate(0.0, -10.0, 20.0))
            : Matrix4.identity(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: isLarge ? 48 : 40,
              height: isLarge ? 48 : 40,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: FaIcon(icon, color: color, size: isLarge ? 24 : 20),
              ),
            ),
            Hbox(isLarge ? 20 : 16),
            // Title
            AppText(
              title,
              style: Ts.bold(size: isLarge ? 18 : 16, color: Colors.black),
            ),
            Hbox(isLarge ? 12 : 10),
            // Description
            AppText(
              description,
              style: Ts.regular(
                size: isLarge ? 13 : 12,
                color: Colors.black.withValues(alpha: 0.6),
              ).copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightContent(bool isLarge) {
    return Center(
      child: Image.asset(
        AppImage.kphone,
        width: isLarge ? 500 : 400,
        height: isLarge ? 600 : 500,
        fit: BoxFit.contain,
      ),
    );
  }
}
