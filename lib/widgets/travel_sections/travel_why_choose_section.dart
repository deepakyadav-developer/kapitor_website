import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TravelWhyChooseSection extends StatefulWidget {
  const TravelWhyChooseSection({super.key});

  @override
  State<TravelWhyChooseSection> createState() => _TravelWhyChooseSectionState();
}

class _TravelWhyChooseSectionState extends State<TravelWhyChooseSection>
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
          ? _buildMobileLayout(isDesktop, isTablet)
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: _buildImageSection(isDesktop, isTablet),
                ),
                Wbox(isDesktop ? 80 : 40),
                Expanded(
                  flex: 1,
                  child: _buildContentSection(isDesktop, isTablet),
                ),
              ],
            ),
    );
  }

  Widget _buildMobileLayout(bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageSection(isDesktop, isTablet),
        Hbox(40),
        _buildContentSection(isDesktop, isTablet),
      ],
    );
  }

  Widget _buildImageSection(bool isDesktop, bool isTablet) {
    return Center(
      child: Image.asset(
        AppImage.travel4,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: isDesktop ? 500 : (isTablet ? 400 : 300),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(Icons.image, size: 100, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContentSection(bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFFF6F00).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Way Choose Us?',
            style: Ts.bold(size: 14, color: const Color(0xFFFF6F00)),
          ),
        ),

        Hbox(20),

        // Main Heading
        AppText(
          'Choose Dream Destination\nFor Explore World',
          style: Ts.bold(
            size: isDesktop ? 40 : (isTablet ? 32 : 28),
            color: Colors.black,
          ),
        ),

        Hbox(24),

        // Description
        AppText(
          'Kapitor revolutionizes travel booking by combining the convenience of traditional platforms with the power of cryptocurrency. Book flights, hotels, and experiences worldwide using USDT, enjoying seamless transactions, competitive rates, and instant confirmations. Our platform offers exclusive deals on gift cards from global brands, making your travel dreams more affordable and accessible.',
          style: Ts.regular(
            size: isDesktop ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),

        Hbox(32),

        // About Us Button
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 40 : 32,
              vertical: isDesktop ? 20 : 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: AppText(
            'About Us',
            style: Ts.semiBold(size: isDesktop ? 16 : 14, color: Colors.white),
          ),
        ),

        Hbox(isDesktop ? 60 : 40),

        // Animated Counters
        Wrap(
          spacing: isDesktop ? 60 : 40,
          runSpacing: 32,
          children: [
            _AnimatedCounter(
              animation: _animation,
              endValue: 14,
              label: 'Years Experience',
              isDesktop: isDesktop,
              isTablet: isTablet,
            ),
            _AnimatedCounter(
              animation: _animation,
              endValue: 320,
              label: 'Destination Collaboration',
              suffix: '+',
              isDesktop: isDesktop,
              isTablet: isTablet,
            ),
            _AnimatedCounter(
              animation: _animation,
              endValue: 67,
              label: 'Satisfied Customer',
              suffix: '+',
              isDesktop: isDesktop,
              isTablet: isTablet,
            ),
          ],
        ),
      ],
    );
  }
}

class _AnimatedCounter extends StatelessWidget {
  final Animation<double> animation;
  final int endValue;
  final String label;
  final String suffix;
  final bool isDesktop;
  final bool isTablet;

  const _AnimatedCounter({
    required this.animation,
    required this.endValue,
    required this.label,
    this.suffix = '',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Animated Number
            AppText(
              '$currentValue$suffix',
              style: Ts.bold(
                size: isDesktop ? 48 : (isTablet ? 40 : 36),
                color: AppColor.primary,
              ),
            ),

            Hbox(8),

            // Label
            AppText(
              label,
              style: Ts.regular(
                size: isDesktop ? 16 : 14,
                color: Colors.black.withValues(alpha: 0.7),
              ),
            ),
          ],
        );
      },
    );
  }
}
