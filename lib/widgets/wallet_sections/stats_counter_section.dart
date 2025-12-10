import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class StatsCounterSection extends StatefulWidget {
  const StatsCounterSection({Key? key}) : super(key: key);

  @override
  State<StatsCounterSection> createState() => _StatsCounterSectionState();
}

class _StatsCounterSectionState extends State<StatsCounterSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;

        final horizontalPadding = isDesktop
            ? constraints.maxWidth * 0.08
            : (isTablet ? 24.0 : 16.0);
        final verticalPadding = isDesktop ? 80.0 : (isTablet ? 60.0 : 40.0);

        // Start animation when widget is built
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _startAnimation();
        });

        return Container(
          width: double.infinity,
          color: const Color(0xFF26CE92),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Title
              AppText(
                'Some count that matters',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                  color: Colors.white,
                ),
              ),
              
              Hbox(isDesktop ? 16.0 : 12.0),
              
              // Subtitle
              AppText(
                'Our achievement in the journey depicted in numbers',
                textAlign: TextAlign.center,
                style: Ts.regular(
                  size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              
              Hbox(isDesktop ? 60.0 : (isTablet ? 50.0 : 40.0)),
              
              // Stats Row
              if (isMobile)
                _buildMobileStats()
              else
                _buildDesktopStats(isDesktop, isTablet),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopStats(bool isDesktop, bool isTablet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _AnimatedStatCard(
            animation: _animation,
            endValue: 30,
            label: 'Partners',
            isDesktop: isDesktop,
            isTablet: isTablet,
          ),
        ),
        Wbox(isDesktop ? 60.0 : 40.0),
        Expanded(
          child: _AnimatedStatCard(
            animation: _animation,
            endValue: 10000,
            label: 'Users',
            isDesktop: isDesktop,
            isTablet: isTablet,
          ),
        ),
        Wbox(isDesktop ? 60.0 : 40.0),
        Expanded(
          child: _AnimatedStatCard(
            animation: _animation,
            endValue: 10,
            label: 'Years of Journey',
            isDesktop: isDesktop,
            isTablet: isTablet,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileStats() {
    return Column(
      children: [
        _AnimatedStatCard(
          animation: _animation,
          endValue: 30,
          label: 'Partners',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(32.0),
        _AnimatedStatCard(
          animation: _animation,
          endValue: 10000,
          label: 'Users',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(32.0),
        _AnimatedStatCard(
          animation: _animation,
          endValue: 10,
          label: 'Years of Journey',
          isDesktop: false,
          isTablet: false,
        ),
      ],
    );
  }
}

class _AnimatedStatCard extends StatelessWidget {
  final Animation<double> animation;
  final int endValue;
  final String label;
  final bool isDesktop;
  final bool isTablet;

  const _AnimatedStatCard({
    required this.animation,
    required this.endValue,
    required this.label,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final currentValue = (endValue * animation.value).round();
        
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Number
            AppText(
              currentValue.toString(),
              textAlign: TextAlign.center,
              style: Ts.bold(
                size: isDesktop ? 64.0 : (isTablet ? 56.0 : 48.0),
                color: Colors.white,
              ),
            ),
            
            Hbox(isDesktop ? 12.0 : 8.0),
            
            // Label
            AppText(
              label,
              textAlign: TextAlign.center,
              style: Ts.regular(
                size: isDesktop ? 18.0 : (isTablet ? 16.0 : 15.0),
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ],
        );
      },
    );
  }
}
