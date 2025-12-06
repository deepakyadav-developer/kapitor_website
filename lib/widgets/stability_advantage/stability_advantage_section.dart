import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';

class StabilityAdvantageSection extends StatelessWidget {
  const StabilityAdvantageSection({Key? key}) : super(key: key);

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
        
        if (isMobile) {
          return _buildMobileLayout(horizontalPadding, verticalPadding);
        }
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Side - Phone Illustration
              Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Phone image
                    Image.asset(
                      AppImage.kphone,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: isDesktop ? 500 : 400,
                          color: Colors.grey.shade200,
                          child: const Center(
                            child: Icon(Icons.phone_android, size: 100),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              
              SizedBox(width: isDesktop ? 60.0 : 40.0),
              
              // Right Side - Content
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Main Heading
                    Text(
                      'The Stability Advantage: Trade Without Fear',
                      style: TextStyle(
                        fontSize: isDesktop ? 42.0 : (isTablet ? 32.0 : 28.0),
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                        height: 1.2,
                      ),
                    ),
                    
                    SizedBox(height: isDesktop ? 24.0 : 16.0),
                    
                    // Description
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Feugiat nulla suspendisse tortor aene.',
                      style: TextStyle(
                        fontSize: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                        fontWeight: FontWeight.normal,
                        color: AppColor.textcolor,
                        height: 1.6,
                      ),
                    ),
                    
                    SizedBox(height: isDesktop ? 40.0 : 32.0),
                    
                    // Features List
                    Column(
                      children: [
                        _buildFeatureItem(
                          icon: Icons.attach_money,
                          title: 'Trade Everything',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                        ),
                        SizedBox(height: isDesktop ? 24.0 : 20.0),
                        _buildFeatureItem(
                          icon: Icons.bolt,
                          title: 'Fast and secure transactions',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                        ),
                        SizedBox(height: isDesktop ? 24.0 : 20.0),
                        _buildFeatureItem(
                          icon: Icons.lock,
                          title: 'Pay Bills with Crypto',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                        ),
                      ],
                    ),
                    
                    SizedBox(height: isDesktop ? 40.0 : 32.0),
                    
                    // Green Credit Card (positioned at bottom right)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: isDesktop ? 120.0 : 100.0,
                        height: isDesktop ? 75.0 : 62.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF4CAF50),
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'VISA',
                            style: TextStyle(
                              fontSize: isDesktop ? 18.0 : 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String title,
    required bool isDesktop,
    required bool isTablet,
  }) {
    final iconSize = isDesktop ? 48.0 : (isTablet ? 42.0 : 40.0);
    final titleSize = isDesktop ? 18.0 : (isTablet ? 17.0 : 16.0);
    
    return Row(
      children: [
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            color: const Color(0xFF81C784), // Light green
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(iconSize * 0.25),
          child: Icon(
            icon,
            color: Colors.white,
            size: iconSize * 0.5,
          ),
        ),
        SizedBox(width: isDesktop ? 16.0 : 12.0),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.w600,
              color: AppColor.black,
              height: 1.4,
            ),
          ),
        ),
      ],
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
          // Phone Illustration
          Image.asset(
            AppImage.kphone,
            fit: BoxFit.contain,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 300,
                color: Colors.grey.shade200,
                child: const Center(
                  child: Icon(Icons.phone_android, size: 100),
                ),
              );
            },
          ),
          
          const SizedBox(height: 40.0),
          
          // Main Heading
          Text(
            'The Stability Advantage: Trade Without Fear',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: AppColor.black,
              height: 1.2,
            ),
          ),
          
          const SizedBox(height: 16.0),
          
          // Description
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Feugiat nulla suspendisse tortor aene.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: AppColor.textcolor,
              height: 1.6,
            ),
          ),
          
          const SizedBox(height: 32.0),
          
          // Features List
          Column(
            children: [
              _buildFeatureItem(
                icon: Icons.trending_up,
                title: 'Trade Everything',
                isDesktop: false,
                isTablet: false,
              ),
              const SizedBox(height: 20.0),
              _buildFeatureItem(
                icon: Icons.bolt,
                title: 'Fast and secure transactions',
                isDesktop: false,
                isTablet: false,
              ),
              const SizedBox(height: 20.0),
              _buildFeatureItem(
                icon: Icons.lock,
                title: 'Pay Bills with Crypto',
                isDesktop: false,
                isTablet: false,
              ),
            ],
          ),
          
          const SizedBox(height: 32.0),
          
          // Green Credit Card
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 100.0,
              height: 62.0,
             
              child: Center(
                child: Image.asset(AppImage.boostCard, width: 100, height: 100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

