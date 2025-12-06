import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class ExploreOfferingSection extends StatelessWidget {
  const ExploreOfferingSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;
        
        if (isMobile) {
          return _buildMobileLayout();
        }
        
        return Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: isDesktop ? 600.0 : 500.0,
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Left Section - Dark Background
                Container(
                  width: isDesktop ? 400.0 : 300.0,
                  color: const Color(0xFF2C2C2C), // Dark background
                  padding: EdgeInsets.all(isDesktop ? 60.0 : 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    AppText(
                      'All you need in a single platform.',
                      style: Ts.bold(
                        size: isDesktop ? 36.0 : 28.0,
                        color: Colors.white,
                      ),
                    ),
                    Hbox(isDesktop ? 24.0 : 16.0),
                    AppText(
                      'From prototyping to production - develop without switching tabs.',
                      style: Ts.regular(
                        size: isDesktop ? 16.0 : 14.0,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Hbox(isDesktop ? 40.0 : 32.0),
                    // Get started button
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 32.0 : 24.0,
                        vertical: isDesktop ? 16.0 : 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF26A69A), // Dark teal/green
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: AppText(
                        'Get started',
                        style: Ts.semiBold(
                          size: isDesktop ? 16.0 : 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Divider line
              Container(
                width: 1,
                color: Colors.grey.shade300,
                constraints: const BoxConstraints(
                  minHeight: 0,
                ),
              ),
              
              // Middle Section - Cards Stack
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(isDesktop ? 60.0 : 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Horizontal line and heading
                      Row(
                        children: [
                          Container(
                            width: isDesktop ? 60.0 : 40.0,
                            height: 2,
                            color: Colors.grey.shade400,
                          ),
                          Wbox(isDesktop ? 16.0 : 12.0),
                          AppText(
                            'Explore Our Offering',
                            style: Ts.bold(
                              size: isDesktop ? 28.0 : 24.0,
                              color: AppColor.textcolor,
                            ),
                          ),
                        ],
                      ),
                      
                      Hbox(isDesktop ? 40.0 : 32.0),
                      
                      // Stacked Cards
                      Center(
                        child: SizedBox(
                          width: isDesktop ? 350.0 : 280.0,
                          height: isDesktop ? 500.0 : 400.0,
                          child: _buildCardStack(isDesktop),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Divider line
              Container(
                width: 1,
                color: Colors.grey.shade300,
                constraints: const BoxConstraints(
                  minHeight: 0,
                ),
              ),
              
              // Right Section - Features
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(isDesktop ? 60.0 : 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildFeatureItem(
                        title: 'Simple like PhonePe',
                        description:
                            'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed.',
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      ),
                      Hbox(isDesktop ? 32.0 : 24.0),
                      _buildFeatureItem(
                        title: 'Safe like a Private Bank',
                        description:
                            'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed.',
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      ),
                      Hbox(isDesktop ? 32.0 : 24.0),
                      _buildFeatureItem(
                        title: 'Transparent like DeFi',
                        description:
                            'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed.',
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      ),
                    ],
                  ),
                ),
              ),
            ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCardStack(bool isDesktop) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Bottom Card - Red/Coral
        Positioned(
          bottom: 0,
          child: Transform.rotate(
            angle: -0.05,
            child: _buildDebitCard(
              cardNumber: '************ 3923',
              cardHolder: 'Card Holder',
              validThru: '04/16',
              color: const Color(0xFFFF6B6B), // Coral/red
              isDesktop: isDesktop,
              isBottom: true,
            ),
          ),
        ),
        
        // Middle Card - Teal/Mint Green
        Positioned(
          bottom: isDesktop ? 40.0 : 30.0,
          child: Transform.rotate(
            angle: -0.02,
            child: _buildDebitCard(
              cardNumber: '************ 3923',
              color: const Color(0xFF81C784), // Light teal/mint green
              isDesktop: isDesktop,
            ),
          ),
        ),
        
        // Top Card - Dark Grey/Black
        Positioned(
          bottom: isDesktop ? 80.0 : 60.0,
          child: Transform.rotate(
            angle: 0.02,
            child: _buildDebitCard(
              cardNumber: '************ 3287',
              color: const Color(0xFF424242), // Dark grey/black
              isDesktop: isDesktop,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDebitCard({
    required String cardNumber,
    String? cardHolder,
    String? validThru,
    required Color color,
    required bool isDesktop,
    bool isBottom = false,
  }) {
    final cardWidth = isDesktop ? 320.0 : 260.0;
    final cardHeight = isDesktop ? 200.0 : 160.0;
    
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Wavy pattern for bottom card
          if (isBottom)
            Positioned.fill(
              child: CustomPaint(
                painter: _WavyPatternPainter(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(isDesktop ? 24.0 : 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      'Debit Card',
                      style: Ts.semiBold(
                        size: isDesktop ? 14.0 : 12.0,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: isDesktop ? 36.0 : 32.0,
                      height: isDesktop ? 36.0 : 32.0,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.trending_up,
                        color: Colors.white,
                        size: isDesktop ? 20.0 : 18.0,
                      ),
                    ),
                  ],
                ),
                
                if (!isBottom) ...[
                  // Chip icon for middle and top cards
                  Container(
                    width: isDesktop ? 40.0 : 32.0,
                    height: isDesktop ? 30.0 : 24.0,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Icon(
                      Icons.credit_card,
                      color: Colors.white,
                      size: isDesktop ? 20.0 : 16.0,
                    ),
                  ),
                ],
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          cardNumber,
                          style: Ts.semiBold(
                            size: isDesktop ? 16.0 : 14.0,
                            color: Colors.white,
                          ).copyWith(letterSpacing: 2),
                        ),
                        if (isBottom && cardHolder != null) ...[
                          SizedBox(height: isDesktop ? 8.0 : 6.0),
                          AppText(
                            cardHolder,
                            style: Ts.regular(
                              size: isDesktop ? 10.0 : 8.0,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ],
                    ),
                    if (isBottom && validThru != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          AppText(
                            'Valid Thru',
                            style: Ts.regular(
                              size: isDesktop ? 10.0 : 8.0,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          AppText(
                            validThru,
                            style: Ts.semiBold(
                              size: isDesktop ? 12.0 : 10.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem({
    required String title,
    required String description,
    required bool isDesktop,
    required bool isTablet,
  }) {
    final iconSize = isDesktop ? 36.0 : (isTablet ? 32.0 : 28.0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AppText(
                title,
                style: Ts.bold(
                  size: isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0),
                  color: AppColor.textcolor,
                ),
              ),
            ),
            Wbox(isDesktop ? 12.0 : 8.0),
            Container(
              width: iconSize,
              height: iconSize,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.trending_up,
                color: Colors.white,
                size: iconSize * 0.5,
              ),
            ),
          ],
        ),
        Hbox(isDesktop ? 12.0 : 8.0),
        AppText(
          description,
          style: Ts.regular(
            size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
            color: AppColor.textcolor.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Dark section
          Container(
            width: double.infinity,
            color: const Color(0xFF2C2C2C),
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'All you need in a single platform.',
                  style: Ts.bold(
                    size: 28.0,
                    color: Colors.white,
                  ),
                ),
                Hbox(16.0),
                AppText(
                  'From prototyping to production - develop without switching tabs.',
                  style: Ts.regular(
                    size: 14.0,
                    color: Colors.grey.shade300,
                  ),
                ),
                Hbox(32.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF26A69A),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: AppText(
                    'Get started',
                    style: Ts.semiBold(
                      size: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Hbox(40.0),
          
          // Heading
          Row(
            children: [
              Container(
                width: 40.0,
                height: 2,
                color: Colors.grey.shade400,
              ),
              Wbox(12.0),
              AppText(
                'Explore Our Offering',
                style: Ts.bold(
                  size: 24.0,
                  color: AppColor.textcolor,
                ),
              ),
            ],
          ),
          
          Hbox(32.0),
          
          // Stacked Cards
          SizedBox(
            width: 280.0,
            height: 400.0,
            child: _buildCardStack(false),
          ),
          
          Hbox(40.0),
          
          // Features
          _buildFeatureItem(
            title: 'Simple like PhonePe',
            description:
                'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed.',
            isDesktop: false,
            isTablet: false,
          ),
          Hbox(24.0),
          _buildFeatureItem(
            title: 'Safe like a Private Bank',
            description:
                'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed.',
            isDesktop: false,
            isTablet: false,
          ),
          Hbox(24.0),
          _buildFeatureItem(
            title: 'Transparent like DeFi',
            description:
                'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed.',
            isDesktop: false,
            isTablet: false,
          ),
        ],
      ),
    );
  }
}

// Wavy pattern painter for card background
class _WavyPatternPainter extends CustomPainter {
  final Color color;

  _WavyPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();
    final waveHeight = 20.0;
    final waveLength = size.width / 3;

    path.moveTo(0, size.height * 0.7);
    for (double x = 0; x < size.width; x += waveLength) {
      path.quadraticBezierTo(
        x + waveLength / 2,
        size.height * 0.7 - waveHeight,
        x + waveLength,
        size.height * 0.7,
      );
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

