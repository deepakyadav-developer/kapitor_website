import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KapAiStatsSection extends StatefulWidget {
  const KapAiStatsSection({super.key});

  @override
  State<KapAiStatsSection> createState() => _KapAiStatsSectionState();
}

class _KapAiStatsSectionState extends State<KapAiStatsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_hasAnimated) {
      _controller.forward();
      _hasAnimated = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    // Start animation when widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAnimation();
    });

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 80 : (isTablet ? 60 : 40),
      ),
      child: isMobile
          ? _buildMobileLayout()
          : _buildDesktopLayout(isDesktop, isTablet),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Left side - KapAI users
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AnimatedCounter(
              animation: _animation,
              endValue: 50000,
              label: '50,000+ active\nusers.',
              description:
                  'Making smarter financial decisions with KapAI every day',
              isLarge: true,
              isMobile: true,
            ),
          ],
        ),
        Hbox(40),
        // Right side - Stats
        Column(
          children: [
            _AnimatedCounter(
              animation: _animation,
              endValue: 1,
              suffix: 'M+',
              label: 'AI PREDICTIONS\nDAILY',
              isLarge: false,
              isMobile: true,
            ),
            Hbox(32),
            _AnimatedCounter(
              animation: _animation,
              endValue: 99,
              suffix: '%',
              label: 'PREDICTION\nACCURACY',
              isLarge: false,
              isMobile: true,
            ),
            Hbox(32),
            _AnimatedCounter(
              animation: _animation,
              endValue: 24,
              suffix: '/7',
              label: 'REAL-TIME\nMONITORING',
              isLarge: false,
              isMobile: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side - KapAI users
        Expanded(
          flex: 2,
          child: _AnimatedCounter(
            animation: _animation,
            endValue: 50000,
            label: '50,000+ active\nusers.',
            description:
                'Making smarter financial decisions with KapAI every day',
            isLarge: true,
            isMobile: false,
          ),
        ),

        Wbox(isDesktop ? 80 : 60),

        // Right side - Stats in row
        Expanded(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _AnimatedCounter(
                animation: _animation,
                endValue: 1,
                suffix: 'M+',
                label: 'AI PREDICTIONS\nDAILY',
                isLarge: false,
                isMobile: false,
              ),
              _AnimatedCounter(
                animation: _animation,
                endValue: 99,
                suffix: '%',
                label: 'PREDICTION\nACCURACY',
                isLarge: false,
                isMobile: false,
              ),
              _AnimatedCounter(
                animation: _animation,
                endValue: 24,
                suffix: '/7',
                label: 'REAL-TIME\nMONITORING',
                isLarge: false,
                isMobile: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AnimatedCounter extends StatelessWidget {
  final Animation<double> animation;
  final int endValue;
  final String suffix;
  final String label;
  final String? description;
  final bool isLarge;
  final bool isMobile;

  const _AnimatedCounter({
    required this.animation,
    required this.endValue,
    this.suffix = '',
    required this.label,
    this.description,
    required this.isLarge,
    required this.isMobile,
  });

  String _formatNumber(int value) {
    if (value >= 1000) {
      final thousands = (value / 1000).floor();
      final remainder = value % 1000;
      return '$thousands,${remainder.toString().padLeft(3, '0')}';
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final currentValue = (endValue * animation.value).round();

        if (isLarge) {
          // Large counter for happy customers
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                '${_formatNumber(currentValue)}+ happy\ncustomers.',
                style: Ts.bold(size: isMobile ? 32 : 42, color: Colors.black),
              ),
              if (description != null) ...[
                Hbox(12),
                AppText(
                  description!,
                  style: Ts.regular(
                    size: isMobile ? 14 : 16,
                    color: Colors.black.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ],
          );
        } else {
          // Small counters for stats
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                '$currentValue$suffix',
                style: Ts.bold(size: isMobile ? 40 : 56, color: Colors.black),
              ),
              Hbox(8),
              AppText(
                label,
                textAlign: TextAlign.center,
                style: Ts.semiBold(
                  size: isMobile ? 11 : 12,
                  color: Colors.black.withValues(alpha: 0.5),
                ).copyWith(letterSpacing: 1.5),
              ),
            ],
          );
        }
      },
    );
  }
}
