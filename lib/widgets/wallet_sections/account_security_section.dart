import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class AccountSecuritySection extends StatelessWidget {
  const AccountSecuritySection({Key? key}) : super(key: key);

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
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Section - Image
              Expanded(
                flex: 1,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: isDesktop ? 500.0 : (isTablet ? 400.0 : 350.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      AppImage.accountsecurity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: isDesktop ? 400 : 300,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: const Center(
                            child: Icon(Icons.security, size: 100, color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              
              Wbox(isDesktop ? 80.0 : 60.0),
              
              // Right Section - Content
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tag
                    AppText(
                      'TRANSACTION ANYWHERE, ANYTIME',
                      style: Ts.semiBold(
                        size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
                        color: Colors.grey.shade600,
                      ),
                    ),
                    
                    Hbox(isDesktop ? 16.0 : 12.0),
                    
                    // Main Heading
                    AppText(
                      'We Care About Your Account Security',
                      style: Ts.bold(
                        size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),
                    
                    Hbox(isDesktop ? 24.0 : 20.0),
                    
                    // Description
                    AppText(
                      'Trade worry-free with an armored security system.',
                      style: Ts.regular(
                        size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                        color: Colors.grey.shade700,
                      ),
                    ),
                    
                    Hbox(isDesktop ? 32.0 : 24.0),
                    
                    // Security Features
                    _SecurityFeature(
                      text: 'A definite and practical biometric login.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    Hbox(isDesktop ? 16.0 : 12.0),
                    _SecurityFeature(
                      text: 'Two-factor authentication for access and transaction security.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    Hbox(isDesktop ? 16.0 : 12.0),
                    _SecurityFeature(
                      text: 'Encryption system that protects data and information.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
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

  Widget _buildMobileLayout(double horizontalPadding, double verticalPadding) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          // Tag
          AppText(
            'TRANSACTION ANYWHERE, ANYTIME',
            textAlign: TextAlign.center,
            style: Ts.semiBold(
              size: 12.0,
              color: Colors.grey.shade600,
            ),
          ),
          
          Hbox(12.0),
          
          // Main Heading
          AppText(
            'We Care About Your Account Security',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: 28.0,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          
          Hbox(20.0),
          
          // Description
          AppText(
            'Trade worry-free with an armored security system.',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: 14.0,
              color: Colors.grey.shade700,
            ),
          ),
          
          Hbox(32.0),
          
          // Image
          Container(
            constraints: const BoxConstraints(maxHeight: 300.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                AppImage.accountsecurity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: const Center(
                      child: Icon(Icons.security, size: 80, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          
          Hbox(32.0),
          
          // Security Features
          _SecurityFeature(
            text: 'A definite and practical biometric login.',
            isDesktop: false,
            isTablet: false,
          ),
          Hbox(12.0),
          _SecurityFeature(
            text: 'Two-factor authentication for access and transaction security.',
            isDesktop: false,
            isTablet: false,
          ),
          Hbox(12.0),
          _SecurityFeature(
            text: 'Encryption system that protects data and information.',
            isDesktop: false,
            isTablet: false,
          ),
        ],
      ),
    );
  }
}

class _SecurityFeature extends StatelessWidget {
  final String text;
  final bool isDesktop;
  final bool isTablet;

  const _SecurityFeature({
    required this.text,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Check Icon
        Container(
          width: isDesktop ? 24.0 : (isTablet ? 22.0 : 20.0),
          height: isDesktop ? 24.0 : (isTablet ? 22.0 : 20.0),
          margin: EdgeInsets.only(
            top: 2.0,
            right: isDesktop ? 12.0 : 10.0,
          ),
          decoration: const BoxDecoration(
            color: Color(0xFF1A1A1A),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0),
          ),
        ),
        
        // Text
        Expanded(
          child: AppText(
            text,
            style: Ts.regular(
              size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}
