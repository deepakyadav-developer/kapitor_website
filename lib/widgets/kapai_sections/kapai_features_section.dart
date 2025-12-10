import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KapAiFeaturesSection extends StatelessWidget {
  const KapAiFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      color: const Color(0xFFFAFAFA),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: Column(
        children: [
          // Header section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left side - Title
              Expanded(
                flex: isMobile ? 1 : 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'KAPAI\nCAPABILITIES',
                      style: Ts.semiBold(
                        size: isDesktop ? 13 : 12,
                        color: Colors.black.withValues(alpha: 0.5),
                      ).copyWith(letterSpacing: 1.5, height: 1.8),
                    ),
                    Hbox(isDesktop ? 20 : 16),
                    AppText(
                      'Intelligent Financial\nDecision Making',
                      style: Ts.bold(
                        size: isDesktop ? 44 : (isTablet ? 36 : 28),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              if (!isMobile) Wbox(isDesktop ? 60 : 40),

              // Right side - Description with icons
              if (!isMobile)
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.auto_awesome,
                            size: isDesktop ? 28 : 24,
                            color: Colors.black.withValues(alpha: 0.7),
                          ),
                          Wbox(16),
                          Icon(
                            Icons.settings,
                            size: isDesktop ? 28 : 24,
                            color: Colors.black.withValues(alpha: 0.7),
                          ),
                        ],
                      ),
                      Hbox(20),
                      AppText(
                        'KapAI transforms Kapitor from a financial app into a self-learning, adaptive, smart wealth ecosystem that continuously optimizes yields, minimizes risks, and protects your assets.',
                        style: Ts.regular(
                          size: isDesktop ? 16 : 15,
                          color: Colors.black.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),

          // Mobile description
          if (isMobile) ...[
            Hbox(24),
            Row(
              children: [
                Icon(
                  Icons.auto_awesome,
                  size: 24,
                  color: Colors.black.withValues(alpha: 0.7),
                ),
                Wbox(12),
                Icon(
                  Icons.settings,
                  size: 24,
                  color: Colors.black.withValues(alpha: 0.7),
                ),
              ],
            ),
            Hbox(16),
            AppText(
              'KapAI transforms Kapitor from a financial app into a self-learning, adaptive, smart wealth ecosystem that continuously optimizes yields, minimizes risks, and protects your assets.',
              style: Ts.regular(
                size: 14,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ),
          ],

          Hbox(isDesktop ? 60 : 40),

          // Features grid
          isMobile
              ? _buildMobileGrid()
              : _buildDesktopGrid(isDesktop, isTablet),
        ],
      ),
    );
  }

  Widget _buildMobileGrid() {
    return Column(
      children: [
        _FeatureCard(
          icon: Icons.trending_up,
          title: 'Market Sentiment Engine',
          description:
              'Analyzes millions of data points across crypto, equities, commodities, and macro indicators for live sentiment assessments.',
          isMobile: true,
        ),
        Hbox(20),
        _FeatureCard(
          icon: Icons.auto_graph,
          title: 'Yield Optimization',
          description:
              'Continuously evaluates yield routes, risk profiles, and compounding opportunities to maximize returns with lowest risk.',
          isMobile: true,
        ),
        Hbox(20),
        _FeatureCard(
          icon: Icons.show_chart,
          title: 'Trade Suggestions',
          description:
              'Provides predictive buy/sell signals, volatility forecasts, and risk-adjusted entry points powered by AI analysis.',
          isMobile: true,
        ),
        Hbox(20),
        _FeatureCard(
          icon: Icons.warning_amber,
          title: 'Risk Alerts',
          description:
              'Real-time threat detection for unusual price movements, fraud signatures, and liquidity anomalies to protect assets.',
          isMobile: true,
        ),
        Hbox(20),
        _FeatureCard(
          icon: Icons.health_and_safety,
          title: 'Portfolio Health Score',
          description:
              'Real-time wealth diagnostics analyzing diversification, risk concentration, and performance vs benchmarks.',
          isMobile: true,
        ),
        Hbox(20),
        _FeatureCard(
          icon: Icons.support_agent,
          title: 'AI Helpdesk',
          description:
              '24/7 personal financial assistant explaining concepts, guiding actions, and providing insights directly in the app.',
          isMobile: true,
        ),
      ],
    );
  }

  Widget _buildDesktopGrid(bool isDesktop, bool isTablet) {
    return Column(
      children: [
        // First row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _FeatureCard(
                icon: Icons.trending_up,
                title: 'Market Sentiment Engine',
                description:
                    'Analyzes millions of data points across crypto, equities, commodities, and macro indicators for live sentiment assessments.',
                isMobile: false,
              ),
            ),
            Wbox(isDesktop ? 24 : 20),
            Expanded(
              child: _FeatureCard(
                icon: Icons.auto_graph,
                title: 'Yield Optimization',
                description:
                    'Continuously evaluates yield routes, risk profiles, and compounding opportunities to maximize returns with lowest risk.',
                isMobile: false,
              ),
            ),
            Wbox(isDesktop ? 24 : 20),
            Expanded(
              child: _FeatureCard(
                icon: Icons.show_chart,
                title: 'Trade Suggestions',
                description:
                    'Provides predictive buy/sell signals, volatility forecasts, and risk-adjusted entry points powered by AI analysis.',
                isMobile: false,
              ),
            ),
          ],
        ),

        Hbox(isDesktop ? 24 : 20),

        // Second row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _FeatureCard(
                icon: Icons.warning_amber,
                title: 'Risk Alerts',
                description:
                    'Real-time threat detection for unusual price movements, fraud signatures, and liquidity anomalies to protect assets.',
                isMobile: false,
              ),
            ),
            Wbox(isDesktop ? 24 : 20),
            Expanded(
              child: _FeatureCard(
                icon: Icons.health_and_safety,
                title: 'Portfolio Health Score',
                description:
                    'Real-time wealth diagnostics analyzing diversification, risk concentration, and performance vs benchmarks.',
                isMobile: false,
              ),
            ),
            Wbox(isDesktop ? 24 : 20),
            Expanded(
              child: _FeatureCard(
                icon: Icons.support_agent,
                title: 'AI Helpdesk',
                description:
                    '24/7 personal financial assistant explaining concepts, guiding actions, and providing insights directly in the app.',
                isMobile: false,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isMobile;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isMobile,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(_isHovered ? -0.02 : 0)
          ..translate(0.0, _isHovered ? -8.0 : 0.0, _isHovered ? 10.0 : 0.0),
        padding: EdgeInsets.all(widget.isMobile ? 24 : 32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppColor.primary.withValues(alpha: 0.3)
                : Colors.black.withValues(alpha: 0.08),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColor.primary.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: _isHovered ? 30 : 10,
              offset: Offset(0, _isHovered ? 15 : 5),
              spreadRadius: _isHovered ? 2 : 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.all(widget.isMobile ? 12 : 14),
              decoration: BoxDecoration(
                color: _isHovered
                    ? AppColor.primary.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.icon,
                size: widget.isMobile ? 28 : 32,
                color: _isHovered ? AppColor.primary : Colors.black,
              ),
            ),

            Hbox(widget.isMobile ? 20 : 24),

            // Title
            AppText(
              widget.title,
              style: Ts.bold(
                size: widget.isMobile ? 18 : 20,
                color: Colors.black,
              ),
            ),

            Hbox(12),

            // Description
            AppText(
              widget.description,
              style: Ts.regular(
                size: widget.isMobile ? 14 : 15,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
