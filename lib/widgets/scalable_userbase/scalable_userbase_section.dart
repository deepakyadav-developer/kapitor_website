import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class ScalableUserbaseSection extends StatelessWidget {
  const ScalableUserbaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;

        final horizontalPadding = isDesktop
            ? constraints.maxWidth * 0.08
            : (isTablet ? 24.0 : 16.0);
        final verticalPadding = isDesktop ? 100.0 : (isTablet ? 80.0 : 60.0);

        if (isMobile) {
          return _buildMobileLayout(horizontalPadding, verticalPadding);
        }

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Heading with lines
              _buildHeading(isDesktop, isTablet),

              Hbox(isDesktop ? 60.0 : 40.0),

              // Three Cards with equal height
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: _UserCard(
                        title: 'Everyday Crypto Users',
                        description:
                            'We Offer A Comprehensive Range Of Innovative Financial Services Tailored To Meet Your Needs.',
                        backgroundColor: const Color(
                          0xFFADFF2F,
                        ), // Bright yellow-green
                        textColor: Colors.black,
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      ),
                    ),
                    Wbox(isDesktop ? 24.0 : 16.0),
                    Expanded(
                      child: _UserCard(
                        title: 'HNI & Institutional Clients',
                        description:
                            'We Offer A Comprehensive Range Of Innovative Financial Services Tailored To Meet Your Needs.',
                        backgroundColor: Colors.grey.shade100, // Light gray
                        textColor: Colors.black,
                        hasIcon: false,
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      ),
                    ),
                    Wbox(isDesktop ? 24.0 : 16.0),
                    Expanded(
                      child: _UserCard(
                        title:
                            'Explore More To Manage Your Crypto The Right Way',
                        description:
                            'We Offer A Comprehensive Range Of Innovative Financial Services Tailored To Meet Your Needs.',
                        backgroundColor: const Color(0xFF26A69A), // Teal
                        textColor: Colors.white,
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      ),
                    ),
                  ],
                ),
              ),

              Hbox(isDesktop ? 40.0 : 32.0),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeading(bool isDesktop, bool isTablet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
        Wbox(isDesktop ? 24.0 : 16.0),
        AppText(
          'Built for a scaleable userbase',
          style: Ts.bold(
            size: isDesktop ? 36.0 : (isTablet ? 28.0 : 24.0),
            color: AppColor.textcolor,
          ),
        ),
        Wbox(isDesktop ? 24.0 : 16.0),
        Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
      ],
    );
  }

  // Widget _buildViewMoreButton(bool isDesktop, bool isTablet) {
  //   return _ViewMoreButton(
  //     isDesktop: isDesktop,
  //     isTablet: isTablet,
  //   );
  // }

  Widget _buildMobileLayout(double horizontalPadding, double verticalPadding) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          // Heading with lines
          _buildHeading(false, false),

          Hbox(40.0),

          // Three Cards
          Column(
            children: [
              _UserCard(
                title: 'Everyday Crypto Users',
                description:
                    'We Offer A Comprehensive Range Of Innovative Financial Services Tailored To Meet Your Needs.',
                backgroundColor: const Color(0xFFADFF2F),
                textColor: Colors.black,
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(16.0),
              _UserCard(
                title: 'HNI & Institutional Clients',
                description:
                    'We Offer A Comprehensive Range Of Innovative Financial Services Tailored To Meet Your Needs.',
                backgroundColor: Colors.grey.shade100,
                textColor: Colors.black,
                hasIcon: false,
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(16.0),
              _UserCard(
                title: 'Explore More To Manage Your Crypto The Right Way',
                description:
                    'We Offer A Comprehensive Range Of Innovative Financial Services Tailored To Meet Your Needs.',
                backgroundColor: const Color(0xFF26A69A),
                textColor: Colors.white,
                isDesktop: false,
                isTablet: false,
              ),
            ],
          ),

          Hbox(32.0),
        ],
      ),
    );
  }
}

class _UserCard extends StatefulWidget {
  final String title;
  final String description;
  final Color backgroundColor;
  final Color textColor;
  final bool hasIcon;
  final bool isDesktop;
  final bool isTablet;

  const _UserCard({
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.textColor,
    this.hasIcon = false,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  State<_UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<_UserCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
          _animationController.forward();
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
          _animationController.reverse();
        });
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              padding: EdgeInsets.all(
                widget.isDesktop ? 32.0 : (widget.isTablet ? 24.0 : 20.0),
              ),
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : [],
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (widget.hasIcon) ...[
                        Container(
                          width: widget.isDesktop ? 56.0 : 48.0,
                          height: widget.isDesktop ? 56.0 : 48.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFF4CAF50), // Bright green
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: AppText(
                              '\$',
                              style: Ts.bold(
                                size: widget.isDesktop ? 28.0 : 24.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Hbox(widget.isDesktop ? 20.0 : 16.0),
                      ],
                      AppText(
                        widget.title,
                        style: Ts.bold(
                          size: widget.isDesktop
                              ? 24.0
                              : (widget.isTablet ? 20.0 : 18.0),
                          color: widget.textColor,
                        ),
                      ),
                      if (widget.description.isNotEmpty) ...[
                        Hbox(widget.isDesktop ? 16.0 : 12.0),
                        AppText(
                          widget.description,
                          style: Ts.regular(
                            size: widget.isDesktop
                                ? 16.0
                                : (widget.isTablet ? 14.0 : 12.0),
                            color: widget.textColor.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ],
                  ),
                  // Phone screen graphic for middle card (if needed)
                  if (widget.hasIcon)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Opacity(
                        opacity: 0.3,
                        child: Container(
                          width: widget.isDesktop ? 120.0 : 100.0,
                          height: widget.isDesktop ? 180.0 : 150.0,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  'Transactions history',
                                  style: Ts.regular(
                                    size: 8.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Hbox(8.0),
                                // Simple line graph representation
                                Expanded(
                                  child: CustomPaint(
                                    painter: _SimpleLineGraphPainter(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ViewMoreButton extends StatefulWidget {
  final bool isDesktop;
  final bool isTablet;

  const _ViewMoreButton({required this.isDesktop, required this.isTablet});

  @override
  State<_ViewMoreButton> createState() => _ViewMoreButtonState();
}

class _ViewMoreButtonState extends State<_ViewMoreButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
          _animationController.forward();
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
          _animationController.reverse();
        });
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: widget.isDesktop ? 32.0 : 24.0,
                vertical: widget.isDesktop ? 16.0 : 12.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: const Color(0xFF4CAF50), // Light green
                  width: 1,
                ),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    'View More',
                    style: Ts.semiBold(
                      size: widget.isDesktop ? 16.0 : 14.0,
                      color: Colors.black,
                    ),
                  ),
                  Wbox(12.0),
                  Container(
                    width: widget.isDesktop ? 36.0 : 32.0,
                    height: widget.isDesktop ? 36.0 : 32.0,
                    decoration: const BoxDecoration(
                      color: Color(0xFF4CAF50), // Bright green
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.trending_up,
                      color: Colors.white,
                      size: widget.isDesktop ? 20.0 : 18.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Simple line graph painter for phone screen
class _SimpleLineGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    final points = [0.2, 0.4, 0.5, 0.6, 0.7];

    for (int i = 0; i < points.length; i++) {
      final x = (i / (points.length - 1)) * size.width;
      final y = size.height - (points[i] * size.height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
