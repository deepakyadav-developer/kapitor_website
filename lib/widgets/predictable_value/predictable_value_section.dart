import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/size.dart';

class PredictableValueSection extends StatelessWidget {
  const PredictableValueSection({Key? key}) : super(key: key);

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
              // Left Side - Content
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Main Heading
                    Text(
                      'Beyond Volatility: Predictable Digital Value',
                      style: TextStyle(
                        fontSize: isDesktop ? 42.0 : (isTablet ? 32.0 : 28.0),
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                        height: 1.2,
                      ),
                    ),

                    Hbox(isDesktop ? 24.0 : 16.0),

                    // Description
                    Text(
                      'Kapitor operates with private-banking-grade security: Live Proof-of-Reserves, insurance on principal and custody, independent audit trails, and regulator-level transparency. Users see exactly where money sits, how it moves, and what backs it.',
                      style: TextStyle(
                        fontSize: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                        fontWeight: FontWeight.normal,
                        color: AppColor.textcolor,
                        height: 1.6,
                      ),
                    ),

                    Hbox(isDesktop ? 40.0 : 32.0),

                    // Features List
                    Column(
                      children: [
                        _buildFeatureItem(
                          icon: Icons.check_circle,
                          title: '100% Private data',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                        ),
                        Hbox(isDesktop ? 24.0 : 20.0),
                        _buildFeatureItemWithText(
                          text: '99%',
                          title: 'Earn Daily Yields',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                        ),
                        Hbox(isDesktop ? 24.0 : 20.0),
                        _buildFeatureItem(
                          icon: Icons.chat_bubble_outline,
                          title: '24/7 Dedicated support',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Wbox(isDesktop ? 60.0 : 40.0),

              // Right Side - Laptop Image
              Expanded(
                flex: 1,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: isDesktop ? 600.0 : (isTablet ? 500.0 : 400.0),
                  ),
                  child: Image.asset(
                    AppImage.appleComputers,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: isDesktop ? 500 : 400,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.laptop,
                            size: 100,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
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
            color: const Color(0xFF4CAF50), // Green icon color
            size: iconSize * 0.5,
          ),
        ),
        Wbox(isDesktop ? 16.0 : 12.0),
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

  Widget _buildFeatureItemWithText({
    required String text,
    required String title,
    required bool isDesktop,
    required bool isTablet,
  }) {
    final iconSize = isDesktop ? 48.0 : (isTablet ? 42.0 : 40.0);
    final titleSize = isDesktop ? 18.0 : (isTablet ? 17.0 : 16.0);
    final textSize = isDesktop ? 16.0 : (isTablet ? 14.0 : 13.0);

    return Row(
      children: [
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            color: const Color(0xFF81C784), // Light green
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(iconSize * 0.15),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: textSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4CAF50), // Green text color
              ),
            ),
          ),
        ),
        Wbox(isDesktop ? 16.0 : 12.0),
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
          // Laptop Image
          Image.asset(
            AppImage.appleComputers,
            fit: BoxFit.contain,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Center(
                  child: Icon(Icons.laptop, size: 100, color: Colors.grey),
                ),
              );
            },
          ),

          Hbox(40.0),

          // Main Heading
          Text(
            'Beyond Volatility: Predictable Digital Value',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: AppColor.black,
              height: 1.2,
            ),
          ),

          Hbox(16.0),

          // Description
          Text(
            'Kapitor operates with private-banking-grade security: Live Proof-of-Reserves, insurance on principal and custody, independent audit trails, and regulator-level transparency. Users see exactly where money sits, how it moves, and what backs it.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: AppColor.textcolor,
              height: 1.6,
            ),
          ),

          Hbox(32.0),

          // Features List
          Column(
            children: [
              _buildFeatureItem(
                icon: Icons.check_circle,
                title: '100% Private data',
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(20.0),
              _buildFeatureItemWithText(
                text: '99%',
                title: 'Earn Daily Yields',
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(20.0),
              _buildFeatureItem(
                icon: Icons.chat_bubble_outline,
                title: '24/7 Dedicated support',
                isDesktop: false,
                isTablet: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
