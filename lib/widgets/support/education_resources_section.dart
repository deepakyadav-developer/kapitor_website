import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Education & Learning Resources Section
class EducationResourcesSection extends StatelessWidget {
  const EducationResourcesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF8F9FA),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: Column(
        children: [
          AppText(
            'Education & Learning Resources',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 48 : (isTablet ? 36 : 32),
              color: Colors.black,
            ),
          ),
          Hbox(16),
          AppText(
            'Build confidence and financial skills with comprehensive guides',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: isDesktop ? 16 : 14,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),
          Hbox(isDesktop ? 60 : 40),
          _buildEducationGrid(isDesktop, isTablet, screenWidth),
          Hbox(isDesktop ? 40 : 32),
          _buildEssenceCard(isDesktop),
        ],
      ),
    );
  }

  Widget _buildEducationGrid(
    bool isDesktop,
    bool isTablet,
    double screenWidth,
  ) {
    final resources = [
      _EducationResource(
        icon: FontAwesomeIcons.graduationCap,
        title: 'Crypto Basics',
        description: 'Understanding blockchain, wallets, and digital assets',
        level: 'Beginner',
        color: const Color(0xFF4DB8A4),
      ),
      _EducationResource(
        icon: FontAwesomeIcons.chartLine,
        title: 'Understanding Yields',
        description: 'How APY works and yield generation strategies',
        level: 'Beginner',
        color: const Color(0xFF5B8DEE),
      ),
      _EducationResource(
        icon: FontAwesomeIcons.coins,
        title: 'RWA Tokenization',
        description: 'Real-world assets on the blockchain explained',
        level: 'Intermediate',
        color: const Color(0xFFFFB84D),
      ),
      _EducationResource(
        icon: FontAwesomeIcons.wheatAwn,
        title: 'Commodity Trading',
        description:
            'Fundamentals of trading gold, silver, oil, and agriculture',
        level: 'Intermediate',
        color: const Color(0xFF9B59B6),
      ),
      _EducationResource(
        icon: FontAwesomeIcons.shieldHalved,
        title: 'Stablecoin Safety',
        description: 'Understanding USDT, reserves, and depeg protection',
        level: 'Beginner',
        color: const Color(0xFF1ABC9C),
      ),
      _EducationResource(
        icon: FontAwesomeIcons.briefcase,
        title: 'PPP Explanations',
        description: 'Private Placement Programme structure and benefits',
        level: 'Advanced',
        color: const Color(0xFFE67E22),
      ),
      _EducationResource(
        icon: FontAwesomeIcons.robot,
        title: 'AI & Market Predictions',
        description: 'How KapAI analyzes markets and generates signals',
        level: 'Intermediate',
        color: const Color(0xFFE74C3C),
      ),
      _EducationResource(
        icon: FontAwesomeIcons.bookOpen,
        title: 'Trading Guides',
        description: 'From beginner basics to advanced trading strategies',
        level: 'All Levels',
        color: const Color(0xFF3498DB),
      ),
    ];

    if (isDesktop) {
      return Wrap(
        spacing: 24,
        runSpacing: 24,
        children: resources
            .map(
              (resource) => SizedBox(
                width: (screenWidth - 160 - 72) / 4,
                child: _EducationCard(resource: resource, isLarge: true),
              ),
            )
            .toList(),
      );
    } else if (isTablet) {
      return Wrap(
        spacing: 20,
        runSpacing: 20,
        children: resources
            .map(
              (resource) => SizedBox(
                width: (screenWidth - 80 - 20) / 2,
                child: _EducationCard(resource: resource, isLarge: false),
              ),
            )
            .toList(),
      );
    } else {
      return Column(
        children: resources
            .map(
              (resource) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _EducationCard(resource: resource, isLarge: false),
              ),
            )
            .toList(),
      );
    }
  }

  Widget _buildEssenceCard(bool isLarge) {
    return Container(
      padding: EdgeInsets.all(isLarge ? 48 : 36),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4DB8A4), Color(0xFF5B8DEE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4DB8A4).withValues(alpha: 0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        children: [
          AppText(
            'THE ESSENCE OF THE KAPITOR HELP CENTER',
            textAlign: TextAlign.center,
            style: Ts.bold(size: isLarge ? 32 : 24, color: Colors.white),
          ),
          Hbox(32),
          Wrap(
            spacing: isLarge ? 40 : 24,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _EssenceItem(icon: FontAwesomeIcons.check, text: 'Simple'),
              _EssenceItem(icon: FontAwesomeIcons.check, text: 'Fast'),
              _EssenceItem(icon: FontAwesomeIcons.check, text: 'Intelligent'),
              _EssenceItem(icon: FontAwesomeIcons.check, text: 'Global'),
              _EssenceItem(
                icon: FontAwesomeIcons.check,
                text: 'Always-available',
              ),
              _EssenceItem(
                icon: FontAwesomeIcons.check,
                text: 'Multi-language',
              ),
              _EssenceItem(icon: FontAwesomeIcons.check, text: 'User-friendly'),
              _EssenceItem(
                icon: FontAwesomeIcons.check,
                text: 'Institutional-grade',
              ),
            ],
          ),
          Hbox(32),
          AppText(
            'Every Kapitor user — from beginners to high-net-worth investors — receives the clarity, assistance, and support they need to operate confidently across the entire Kapitor ecosystem.',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: isLarge ? 16 : 14,
              color: Colors.white.withValues(alpha: 0.9),
            ).copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}

class _EducationResource {
  final IconData icon;
  final String title;
  final String description;
  final String level;
  final Color color;

  _EducationResource({
    required this.icon,
    required this.title,
    required this.description,
    required this.level,
    required this.color,
  });
}

class _EducationCard extends StatefulWidget {
  final _EducationResource resource;
  final bool isLarge;

  const _EducationCard({required this.resource, required this.isLarge});

  @override
  State<_EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<_EducationCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(widget.isLarge ? 24 : 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? widget.resource.color
                : Colors.grey.withValues(alpha: 0.2),
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.resource.color.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(widget.isLarge ? 12 : 10),
                  decoration: BoxDecoration(
                    color: widget.resource.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FaIcon(
                    widget.resource.icon,
                    size: widget.isLarge ? 24 : 20,
                    color: widget.resource.color,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: widget.resource.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppText(
                    widget.resource.level,
                    style: Ts.semiBold(size: 10, color: widget.resource.color),
                  ),
                ),
              ],
            ),
            Hbox(16),
            AppText(
              widget.resource.title,
              style: Ts.bold(
                size: widget.isLarge ? 18 : 16,
                color: Colors.black,
              ),
            ),
            Hbox(8),
            AppText(
              widget.resource.description,
              style: Ts.regular(
                size: widget.isLarge ? 13 : 12,
                color: Colors.black.withValues(alpha: 0.6),
              ).copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

class _EssenceItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _EssenceItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(icon, size: 16, color: Colors.white),
        Wbox(8),
        AppText(text, style: Ts.semiBold(size: 15, color: Colors.white)),
      ],
    );
  }
}
