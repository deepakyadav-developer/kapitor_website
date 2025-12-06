import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class StrategicWealthSection extends StatelessWidget {
  const StrategicWealthSection({Key? key}) : super(key: key);

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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Section - Text and Cards
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    AppText(
                      'Strategic Wealth Management',
                      style: Ts.bold(
                        size: isDesktop ? 48.0 : (isTablet ? 36.0 : 32.0),
                        color: AppColor.textcolor,
                      ),
                    ),
                    
                    Hbox(isDesktop ? 24.0 : 16.0),
                    
                    // Subtitle
                    AppText(
                      'Master the Art of Financial Stability with Effective and Intelligent Money Management Techniques.',
                      style: Ts.regular(
                        size: isDesktop ? 18.0 : (isTablet ? 16.0 : 14.0),
                        color: Colors.grey.shade600,
                      ),
                    ),
                    
                    Hbox(isDesktop ? 40.0 : 32.0),
                    
                    // Transaction Cards Grid with Wavy Background
                    Stack(
                      children: [
                        // Wavy background pattern
                        Positioned.fill(
                          child: CustomPaint(
                            painter: _WavyBackgroundPainter(),
                          ),
                        ),
                        // Transaction Cards
                        _buildTransactionCardsGrid(isDesktop, isTablet),
                      ],
                    ),
                  ],
                ),
              ),
              
              Wbox(isDesktop ? 60.0 : 40.0),
              
              // Right Section - Phone Images
              Expanded(
                flex: 1,
                child: _buildPhoneStack(isDesktop, isTablet),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTransactionCardsGrid(bool isDesktop, bool isTablet) {
    final cardSize = isDesktop ? 180.0 : (isTablet ? 150.0 : 140.0);
    final spacing = isDesktop ? 16.0 : 12.0;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _TransactionCard(
                iconColor: const Color(0xFFFFB3BA), // Light pink
                title: 'Netflix Subscript',
                amount: r'-$7.00',
                isExpense: true,
                cardSize: cardSize,
                isDesktop: isDesktop,
              ),
            ),
            Wbox(spacing),
            Expanded(
              child: _TransactionCard(
                iconColor: const Color(0xFF90EE90), // Light green
                title: 'Starbucks Coffee',
                amount: r'+$10.00',
                isExpense: false,
                cardSize: cardSize,
                isDesktop: isDesktop,
              ),
            ),
          ],
        ),
        Hbox(spacing),
        Row(
          children: [
            Expanded(
              child: _TransactionCard(
                iconColor: Colors.grey.shade300,
                title: 'Apple Subscript',
                amount: r'+$8.00',
                isExpense: false,
                cardSize: cardSize,
                isDesktop: isDesktop,
              ),
            ),
            Wbox(spacing),
            Expanded(
              child: _TransactionCard(
                iconColor: const Color(0xFFFFB3BA), // Light pink
                title: 'Dribbble subscribe',
                amount: r'+$7.00',
                isExpense: false,
                cardSize: cardSize,
                isDesktop: isDesktop,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPhoneStack(bool isDesktop, bool isTablet) {
    final phoneWidth = isDesktop ? 280.0 : (isTablet ? 240.0 : 200.0);
    final phoneHeight = isDesktop ? 560.0 : (isTablet ? 480.0 : 400.0);

    return SizedBox(
      width: phoneWidth,
      height: phoneHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Phone (iPhone 15) - Partially visible
          Positioned(
            right: isDesktop ? -40.0 : -30.0,
            child: Transform.scale(
              scale: 0.85,
              child: Opacity(
                opacity: 0.7,
                child: Image.asset(
                  AppImage.iphone15,
                  width: phoneWidth,
                  height: phoneHeight,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: phoneWidth,
                      height: phoneHeight,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Center(
                        child: Icon(Icons.phone_iphone, size: 100, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          
          // Foreground Phone (iPhone 12) - Fully visible
          Positioned(
            left: 0,
            child: Image.asset(
              AppImage.iphone12,
              width: phoneWidth,
              height: phoneHeight,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: phoneWidth,
                  height: phoneHeight,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Center(
                    child: Icon(Icons.phone_iphone, size: 100, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(double horizontalPadding, double verticalPadding) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          // Title
          AppText(
            'Strategic Wealth Management',
            style: Ts.bold(
              size: 32.0,
              color: AppColor.textcolor,
            ),
          ),
          
          Hbox(16.0),
          
          // Subtitle
          AppText(
            'Master the Art of Financial Stability with Effective and Intelligent Money Management Techniques.',
            style: Ts.regular(
              size: 14.0,
              color: Colors.grey.shade600,
            ),
          ),
          
          Hbox(32.0),
          
          // Transaction Cards Grid
          _buildTransactionCardsGrid(false, false),
          
          Hbox(40.0),
          
          // Phone Stack
          _buildPhoneStack(false, false),
        ],
      ),
    );
  }
}

class _TransactionCard extends StatefulWidget {
  final Color iconColor;
  final String title;
  final String amount;
  final bool isExpense;
  final double cardSize;
  final bool isDesktop;

  const _TransactionCard({
    required this.iconColor,
    required this.title,
    required this.amount,
    required this.isExpense,
    required this.cardSize,
    required this.isDesktop,
  });

  @override
  State<_TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<_TransactionCard>
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
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.isExpense
        ? const Color(0xFF424242) // Dark grey
        : Colors.grey.shade100; // Light grey
    
    final textColor = widget.isExpense
        ? Colors.white
        : AppColor.textcolor;

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
              height: widget.cardSize,
              padding: EdgeInsets.all(widget.isDesktop ? 20.0 : 16.0),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 20,
                          spreadRadius: 0,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : [],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon
                  Container(
                    width: widget.isDesktop ? 48.0 : 40.0,
                    height: widget.isDesktop ? 48.0 : 40.0,
                    decoration: BoxDecoration(
                      color: widget.iconColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  
                  // Title and Amount
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        widget.title,
                        style: Ts.medium(
                          size: widget.isDesktop ? 14.0 : 12.0,
                          color: textColor,
                        ),
                      ),
                      Hbox(8.0),
                      AppText(
                        widget.amount,
                        style: Ts.bold(
                          size: widget.isDesktop ? 24.0 : 20.0,
                          color: textColor,
                        ),
                      ),
                    ],
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

// Wavy background pattern painter
class _WavyBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade200.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw multiple wavy lines
    for (double y = size.height * 0.2; y < size.height; y += 60) {
      final path = Path();
      path.moveTo(0, y);
      
      for (double x = 0; x < size.width; x += 40) {
        path.quadraticBezierTo(
          x + 20,
          y - 15,
          x + 40,
          y,
        );
      }
      
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

