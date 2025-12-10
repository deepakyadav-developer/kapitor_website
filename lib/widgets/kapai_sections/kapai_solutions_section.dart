import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KapAiSolutionsSection extends StatefulWidget {
  const KapAiSolutionsSection({super.key});

  @override
  State<KapAiSolutionsSection> createState() => _KapAiSolutionsSectionState();
}

class _KapAiSolutionsSectionState extends State<KapAiSolutionsSection> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: Column(
        children: [
          // Top section with machine
          isMobile
              ? _buildMobileTopSection()
              : _buildDesktopTopSection(isDesktop, isTablet),

          Hbox(isDesktop ? 80 : 60),

          // Bottom section - Services
          _buildServicesSection(isDesktop, isTablet, isMobile),
        ],
      ),
    );
  }

  Widget _buildMobileTopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColor.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.layers, size: 32, color: AppColor.primary),
        ),
        Hbox(24),
        // Heading
        AppText(
          'AI-Powered Intelligence\nFor Every Financial Decision',
          style: Ts.bold(size: 28, color: Colors.black),
        ),
        Hbox(16),
        // Description
        AppText(
          'KapAI analyzes market trends, predicts risks, and optimizes your portfolio in real-time—giving you the intelligence layer that powers smarter financial outcomes.',
          style: Ts.regular(
            size: 14,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),
        Hbox(20),
        // Features
        _buildFeatureItem('24/7 Real-Time Market Analysis', true),
        Hbox(12),
        _buildFeatureItem('Predictive Risk Management', true),
        Hbox(24),
        // Learn More button
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.black.withValues(alpha: 0.2)),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                'Learn More',
                style: Ts.semiBold(size: 14, color: Colors.black),
              ),
              Wbox(8),
              const Icon(Icons.arrow_forward, size: 18, color: Colors.black),
            ],
          ),
        ),
        Hbox(32),
        // Machine image
        Center(
          child: Image.asset(
            AppImage.machine,
            height: 300,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopTopSection(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side - Content
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              Container(
                padding: EdgeInsets.all(isDesktop ? 16 : 14),
                decoration: BoxDecoration(
                  color: AppColor.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.layers,
                  size: isDesktop ? 40 : 36,
                  color: AppColor.primary,
                ),
              ),
              Hbox(isDesktop ? 32 : 24),
              // Heading
              AppText(
                'AI-Powered Intelligence\nFor Every Financial Decision',
                style: Ts.bold(size: isDesktop ? 44 : 36, color: Colors.black),
              ),
              Hbox(isDesktop ? 24 : 20),
              // Description
              SizedBox(
                width: isDesktop ? 450 : 380,
                child: AppText(
                  'KapAI analyzes market trends, predicts risks, and optimizes your portfolio in real-time—giving you the intelligence layer that powers smarter financial outcomes.',
                  style: Ts.regular(
                    size: isDesktop ? 16 : 15,
                    color: Colors.black.withValues(alpha: 0.6),
                  ),
                ),
              ),
              Hbox(isDesktop ? 32 : 24),
              // Features
              _buildFeatureItem('24/7 Real-Time Market Analysis', isDesktop),
              Hbox(16),
              _buildFeatureItem('Predictive Risk Management', isDesktop),
              Hbox(isDesktop ? 40 : 32),
              // Learn More button
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.black.withValues(alpha: 0.2)),
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 32 : 28,
                    vertical: isDesktop ? 16 : 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      'Learn More',
                      style: Ts.semiBold(
                        size: isDesktop ? 16 : 15,
                        color: Colors.black,
                      ),
                    ),
                    Wbox(12),
                    Icon(
                      Icons.arrow_forward,
                      size: isDesktop ? 20 : 18,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Wbox(isDesktop ? 80 : 60),

        // Right side - Machine image
        Expanded(
          flex: 1,
          child: Image.asset(
            AppImage.machine,
            height: isDesktop ? 450 : 380,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String text, bool isLarge) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.check_circle,
          size: isLarge ? 20 : 18,
          color: AppColor.primary,
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

  Widget _buildServicesSection(bool isDesktop, bool isTablet, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        AppText(
          'Intelligence Capabilities',
          style: Ts.semiBold(
            size: isMobile ? 13 : 14,
            color: const Color(0xFFFF6B6B),
          ),
        ),
        Hbox(16),
        AppText(
          'KapAI Core\nIntelligence Modules',
          style: Ts.bold(
            size: isMobile ? 28 : (isDesktop ? 40 : 34),
            color: Colors.black,
          ),
        ),

        Hbox(isDesktop ? 50 : 40),

        // Service cards
        isMobile
            ? _buildMobileServiceCards()
            : _buildDesktopServiceCards(isDesktop, isTablet),
      ],
    );
  }

  Widget _buildMobileServiceCards() {
    return Column(
      children: [
        _ServiceCard(
          icon: Icons.analytics_outlined,
          title: 'Market Intelligence',
          description:
              'Real-time analysis of crypto markets, tokenized assets, and commodities with AI-powered trend detection and price predictions.',
          isSelected: _selectedIndex == 0,
          onTap: () => setState(() => _selectedIndex = 0),
          isMobile: true,
        ),
        Hbox(20),
        _ServiceCard(
          icon: Icons.shield_outlined,
          title: 'Risk Management',
          description:
              'Predictive risk alerts, portfolio health monitoring, and automated safety recommendations to protect your investments.',
          isSelected: _selectedIndex == 1,
          onTap: () => setState(() => _selectedIndex = 1),
          isMobile: true,
        ),
        Hbox(20),
        _ServiceCard(
          icon: Icons.auto_graph,
          title: 'Portfolio Optimization',
          description:
              'AI-driven yield optimization, automated rebalancing, and personalized investment strategies based on your goals.',
          isSelected: _selectedIndex == 2,
          onTap: () => setState(() => _selectedIndex = 2),
          isMobile: true,
        ),
      ],
    );
  }

  Widget _buildDesktopServiceCards(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _ServiceCard(
            icon: Icons.analytics_outlined,
            title: 'Market Intelligence',
            description:
                'Real-time analysis of crypto markets, tokenized assets, and commodities with AI-powered trend detection and price predictions.',
            isSelected: _selectedIndex == 0,
            onTap: () => setState(() => _selectedIndex = 0),
            isMobile: false,
          ),
        ),
        Wbox(isDesktop ? 24 : 20),
        Expanded(
          child: _ServiceCard(
            icon: Icons.shield_outlined,
            title: 'Risk Management',
            description:
                'Predictive risk alerts, portfolio health monitoring, and automated safety recommendations to protect your investments.',
            isSelected: _selectedIndex == 1,
            onTap: () => setState(() => _selectedIndex = 1),
            isMobile: false,
          ),
        ),
        Wbox(isDesktop ? 24 : 20),
        Expanded(
          child: _ServiceCard(
            icon: Icons.auto_graph,
            title: 'Portfolio Optimization',
            description:
                'AI-driven yield optimization, automated rebalancing, and personalized investment strategies based on your goals.',
            isSelected: _selectedIndex == 2,
            onTap: () => setState(() => _selectedIndex = 2),
            isMobile: false,
          ),
        ),
      ],
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isMobile;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
    required this.isMobile,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isActive = widget.isSelected || _isHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(isActive ? -0.02 : 0)
            ..translate(0.0, isActive ? -10.0 : 0.0, isActive ? 15.0 : 0.0),
          padding: EdgeInsets.all(widget.isMobile ? 28 : 36),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isActive
                  ? const Color(0xFFFFB84D).withValues(alpha: 0.5)
                  : Colors.black.withValues(alpha: 0.08),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: isActive
                    ? const Color(0xFFFFB84D).withValues(alpha: 0.2)
                    : Colors.black.withValues(alpha: 0.05),
                blurRadius: isActive ? 35 : 10,
                offset: Offset(0, isActive ? 20 : 5),
                spreadRadius: isActive ? 3 : 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.all(widget.isMobile ? 16 : 20),
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFFFFB84D)
                      : const Color(0xFFFFB84D).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.icon,
                  size: widget.isMobile ? 32 : 40,
                  color: isActive ? Colors.white : const Color(0xFFFFB84D),
                ),
              ),

              Hbox(widget.isMobile ? 20 : 24),

              // Title
              AppText(
                widget.title,
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: widget.isMobile ? 18 : 20,
                  color: Colors.black,
                ),
              ),

              Hbox(12),

              // Description
              AppText(
                widget.description,
                textAlign: TextAlign.center,
                style: Ts.regular(
                  size: widget.isMobile ? 13 : 14,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
