import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class SecurityLayersSection extends StatelessWidget {
  const SecurityLayersSection({Key? key}) : super(key: key);

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

        return Stack(
          children: [
            // Decorative circular shapes - Extending beyond edges
            Positioned(
              top: verticalPadding,
              left: isDesktop ? -50.0 : -30.0,
              child: SizedBox(
                width: isDesktop ? 250.0 : 180.0,
                height: isDesktop ? 250.0 : 180.0,
                child: Image.asset(
                  AppImage.green,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50).withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: verticalPadding,
              right: isDesktop ? -50.0 : -30.0,
              child: SizedBox(
                width: isDesktop ? 250.0 : 180.0,
                height: isDesktop ? 250.0 : 180.0,
                child: Image.asset(
                  AppImage.yellow,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFEB3B).withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
            ),

            // Main Content with padding
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Column(
                children: [
                  // Top illustration placeholder (hand illustration)
                  Container(
                    height: isDesktop ? 80.0 : 60.0,
                    margin: EdgeInsets.only(bottom: isDesktop ? 40.0 : 32.0),
                    child: Icon(
                      Icons.handshake,
                      size: isDesktop ? 60.0 : 40.0,
                      color: Colors.grey.shade400,
                    ),
                  ),

                  // Heading
                  Column(
                    children: [
                      AppText(
                        'KAPITOR — SECURITY & TRANSPARENCY',
                        textAlign: TextAlign.center,
                        style: Ts.regular(
                          size: isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0),
                          color: AppColor.textcolor,
                        ),
                      ),
                      Hbox(8.0),
                      AppText(
                        'Multi-Layered, Regulator-Grade Protection',
                        textAlign: TextAlign.center,
                        style: Ts.bold(
                          size: isDesktop ? 36.0 : (isTablet ? 28.0 : 24.0),
                          color: AppColor.textcolor,
                        ),
                      ),
                    ],
                  ),

                  Hbox(isDesktop ? 60.0 : 40.0),

                  // Four Sections Grid (removed wavy line)
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: _SecurityLayerCard(
                              iconImage: AppImage.binarycode,
                              title: 'Real-Time Proof-Of-Reserves',
                              description:
                                  'Kapitor displays live, public reserve data for user funds, KapVault reserves, PPP allocations, and insured buffers. Every number is traceable, verifiable, and linked to on-chain addresses. No fractional reserves. Ever.',
                              isDesktop: isDesktop,
                              isTablet: isTablet,
                            ),
                          ),
                          Wbox(isDesktop ? 32.0 : 24.0),
                          Expanded(
                            child: _SecurityLayerCard(
                              iconImage: AppImage.router,
                              title: 'On-Chain Verification',
                              description:
                                  'Kapitor reveals on-chain cold wallet addresses, reserve backing, PPP pool allocations, and deposit contracts. Any user, auditor, or regulator can independently confirm how funds are stored, moved, and insured. No trust needed.',
                              isDesktop: isDesktop,
                              isTablet: isTablet,
                            ),
                          ),
                        ],
                      ),
                      Hbox(isDesktop ? 32.0 : 24.0),
                      Row(
                        children: [
                          Expanded(
                            child: _SecurityLayerCard(
                              iconImage: AppImage.server,
                              title: 'Smart Contract Audits',
                              description:
                                  'Every Kapitor contract undergoes external third-party audits, static & dynamic analysis, penetration testing, and logic correctness validation. Audits are published publicly, hash-verifiable, and linked directly inside the app.',
                              isDesktop: isDesktop,
                              isTablet: isTablet,
                            ),
                          ),
                          Wbox(isDesktop ? 32.0 : 24.0),
                          Expanded(
                            child: _SecurityLayerCard(
                              iconImage: AppImage.cloudprivacy,
                              title: 'Insurance-Backed Coverage',
                              description:
                                  'Kapitor integrates insurance for PPP principal allocations, custodial assets, yield vault deposits, smart contract failures, exchange counterparties, and stablecoin depeg risks. Fully insured operating environment.',
                              isDesktop: isDesktop,
                              isTablet: isTablet,
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
          // Decorative circular shapes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 80.0,
                height: 80.0,
                child: Image.asset(
                  AppImage.green,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50).withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: 80.0,
                height: 80.0,
                child: Image.asset(
                  AppImage.yellow,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFEB3B).withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          Hbox(32.0),

          // Top illustration
          Container(
            height: 60.0,
            margin: const EdgeInsets.only(bottom: 32.0),
            child: Icon(
              Icons.handshake,
              size: 40.0,
              color: Colors.grey.shade400,
            ),
          ),

          // Heading
          Column(
            children: [
              AppText(
                'Transparency Of Our Security Layers',
                textAlign: TextAlign.center,
                style: Ts.regular(size: 16.0, color: AppColor.textcolor),
              ),
              Hbox(8.0),
              AppText(
                'With Quality Services For You',
                textAlign: TextAlign.center,
                style: Ts.bold(size: 24.0, color: AppColor.textcolor),
              ),
            ],
          ),

          Hbox(40.0),

          // Four Sections
          Column(
            children: [
              _SecurityLayerCard(
                iconImage: AppImage.binarycode,
                title: 'Real-Time Proof-Of-Reserves',
                description:
                    'Kapitor displays live, public reserve data for user funds, KapVault reserves, PPP allocations, and insured buffers. Every number is traceable, verifiable, and linked to on-chain addresses. No fractional reserves. Ever.',
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(24.0),
              _SecurityLayerCard(
                iconImage: AppImage.router,
                title: 'On-Chain Verification',
                description:
                    'Kapitor reveals on-chain cold wallet addresses, reserve backing, PPP pool allocations, and deposit contracts. Any user, auditor, or regulator can independently confirm how funds are stored, moved, and insured. No trust needed.',
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(24.0),
              _SecurityLayerCard(
                iconImage: AppImage.server,
                title: 'Smart Contract Audits',
                description:
                    'Every Kapitor contract undergoes external third-party audits, static & dynamic analysis, penetration testing, and logic correctness validation. Audits are published publicly, hash-verifiable, and linked directly inside the app.',
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(24.0),
              _SecurityLayerCard(
                iconImage: AppImage.cloudprivacy,
                title: 'Insurance-Backed Coverage',
                description:
                    'Kapitor integrates insurance for PPP principal allocations, custodial assets, yield vault deposits, smart contract failures, exchange counterparties, and stablecoin depeg risks. Fully insured operating environment.',
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

class _SecurityLayerCard extends StatelessWidget {
  final String iconImage;
  final String title;
  final String description;
  final bool isDesktop;
  final bool isTablet;

  const _SecurityLayerCard({
    required this.iconImage,
    required this.title,
    required this.description,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 32.0 : (isTablet ? 24.0 : 20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          SizedBox(
            width: isDesktop ? 80.0 : (isTablet ? 70.0 : 60.0),
            height: isDesktop ? 80.0 : (isTablet ? 70.0 : 60.0),
            child: Image.asset(
              iconImage,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(
                    Icons.security,
                    size: 40,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),

          SizedBox(height: isDesktop ? 24.0 : 16.0),

          // Title
          AppText(
            title,
            style: Ts.bold(
              size: isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0),
              color: const Color(0xFF4CAF50), // Green
            ),
          ),

          SizedBox(height: isDesktop ? 16.0 : 12.0),

          // Description
          AppText(
            description,
            style: Ts.regular(
              size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
              color: AppColor.textcolor.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

// Wavy line painter connecting the sections
class _WavyLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF9800)
          .withOpacity(0.3) // Light orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();

    // Start from top left
    path.moveTo(size.width * 0.15, size.height * 0.1);

    // Down to bottom left
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.5,
      size.width * 0.15,
      size.height * 0.9,
    );

    // Across to bottom right
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.95,
      size.width * 0.85,
      size.height * 0.9,
    );

    // Up to top right
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.5,
      size.width * 0.85,
      size.height * 0.1,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
