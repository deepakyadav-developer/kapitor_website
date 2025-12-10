import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class SecuritySection extends StatelessWidget {
  const SecuritySection({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              // Security measures badge
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 20.0 : 16.0,
                  vertical: isDesktop ? 10.0 : 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: AppText(
                  'Security measures',
                  style: Ts.medium(
                    size: isDesktop ? 14.0 : 12.0,
                    color: AppColor.textcolor,
                  ),
                ),
              ),
              
              Hbox(isDesktop ? 24.0 : 16.0),
              
              // Main Title
              AppText(
                'We Secure Your Wealth with Institutional-Grade Protection',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 48.0 : (isTablet ? 36.0 : 32.0),
                  color: AppColor.textcolor,
                ),
              ),
              
              Hbox(isDesktop ? 60.0 : 40.0),
              
              // Main Content with Image and Security Measures
              Stack(
                children: [
                  // Central Image
                  Center(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: isDesktop ? 600.0 : (isTablet ? 500.0 : 400.0),
                        maxHeight: isDesktop ? 500.0 : (isTablet ? 400.0 : 300.0),
                      ),
                      child: Image.asset(
                        AppImage.security1,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: isDesktop ? 500 : 400,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: const Center(
                              child: Icon(Icons.security, size: 100, color: Colors.grey),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  
                  // Security Measures - Left Side
                  Positioned(
                    left: 0,
                    top: isDesktop ? 80.0 : 60.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SecurityMeasureItem(
                          icon: Icons.verified_user,
                          title: 'Chainalysis AML screening',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                        ),
                        Hbox(isDesktop ? 32.0 : 24.0),
                        _SecurityMeasureItem(
                          icon: Icons.lock,
                          title: 'Withdrawal whitelisting',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                        ),
                        Hbox(isDesktop ? 32.0 : 24.0),
                        _SecurityMeasureItem(
                          icon: Icons.vpn_key,
                          title: 'Multi-sig cold wallets',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                        ),
                      ],
                    ),
                  ),
                  
                  // Security Measures - Right Side
                  Positioned(
                    right: 0,
                    top: isDesktop ? 80.0 : 60.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _SecurityMeasureItem(
                          icon: Icons.verified_user,
                          title: 'Fireblocks / BitGo custody',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                          alignRight: true,
                        ),
                        Hbox(isDesktop ? 32.0 : 24.0),
                        _SecurityMeasureItem(
                          icon: Icons.fingerprint,
                          title: '2FA & biometrics',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                          alignRight: true,
                        ),
                        Hbox(isDesktop ? 32.0 : 24.0),
                        _SecurityMeasureItem(
                          icon: Icons.vpn_key,
                          title: 'HSM key protection',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                          alignRight: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              Hbox(isDesktop ? 60.0 : 40.0),
              
              // Bottom Description
              Container(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 800.0 : (isTablet ? 600.0 : double.infinity),
                ),
                child: AppText(
                  'We prioritize the safety of your information and our infrastructure through strict, verified access controls for both physical and digital assets. Sensitive data is secured using modern encryption standards and protected by comprehensive network defenses and continuous system monitoring.',
                  textAlign: TextAlign.center,
                  style: Ts.regular(
                    size: isDesktop ? 18.0 : (isTablet ? 16.0 : 14.0),
                    color: Colors.grey.shade700,
                  ),
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
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          // Security measures badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: AppText(
              'Security measures',
              style: Ts.medium(
                size: 12.0,
                color: AppColor.textcolor,
              ),
            ),
          ),
          
          Hbox(16.0),
          
          // Main Title
          AppText(
            'We Secure Your Wealth with Institutional-Grade Protection',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: 32.0,
              color: AppColor.textcolor,
            ),
          ),
          
          Hbox(40.0),
          
          // Central Image
          Container(
            constraints: const BoxConstraints(
              maxWidth: 400.0,
              maxHeight: 300.0,
            ),
            child: Image.asset(
              AppImage.security1,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Center(
                    child: Icon(Icons.security, size: 100, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          
          Hbox(40.0),
          
          // Security Measures
          Column(
            children: [
              _SecurityMeasureItem(
                icon: Icons.verified_user,
                title: 'Chainalysis AML screening',
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(24.0),
              _SecurityMeasureItem(
                icon: Icons.lock,
                title: 'Withdrawal whitelisting',
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(24.0),
              _SecurityMeasureItem(
                icon: Icons.vpn_key,
                title: 'Multi-sig cold wallets',
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(24.0),
              _SecurityMeasureItem(
                icon: Icons.verified_user,
                title: 'Fireblocks / BitGo custody',
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(24.0),
              _SecurityMeasureItem(
                icon: Icons.fingerprint,
                title: '2FA & biometrics',
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(24.0),
              _SecurityMeasureItem(
                icon: Icons.vpn_key,
                title: 'HSM key protection',
                isDesktop: false,
                isTablet: false,
              ),
            ],
          ),
          
          Hbox(40.0),
          
          // Bottom Description
          AppText(
            'We prioritize the safety of your information and our infrastructure through strict, verified access controls for both physical and digital assets. Sensitive data is secured using modern encryption standards and protected by comprehensive network defenses and continuous system monitoring.',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: 14.0,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

class _SecurityMeasureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isDesktop;
  final bool isTablet;
  final bool alignRight;

  const _SecurityMeasureItem({
    required this.icon,
    required this.title,
    required this.isDesktop,
    required this.isTablet,
    this.alignRight = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = isDesktop ? 24.0 : (isTablet ? 20.0 : 18.0);
    final titleSize = isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0);

    return Row(
      mainAxisAlignment: alignRight ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (alignRight) ...[
          AppText(
            title,
            style: Ts.medium(
              size: titleSize,
              color: AppColor.textcolor,
            ),
          ),
          Wbox(12.0),
        ],
        Container(
          width: iconSize + 8,
          height: iconSize + 8,
          decoration: BoxDecoration(
            color: const Color(0xFF4CAF50), // Green
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: iconSize,
          ),
        ),
        if (!alignRight) ...[
          Wbox(12.0),
          AppText(
            title,
            style: Ts.medium(
              size: titleSize,
              color: AppColor.textcolor,
            ),
          ),
        ],
      ],
    );
  }
}

