import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class WhyKapitorSection extends StatelessWidget {
  const WhyKapitorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 80,
        vertical: isMobile ? 40 : 80,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Decorative icons at bottom corners
          if (!isMobile) ...[
            // Left grid icon - positioned at bottom left
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                width: 60,
                height: 60,
                child: Image.asset(
                  AppImage.gridIcon,
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Right bulb icon - positioned at bottom right
            Positioned(
              right: 0,
              bottom: 0,
              child: _DecorativeIcon(
                child: Image.asset(
                  AppImage.heroCharacter,
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
          // Main content - centered
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Kapitor Logo
                Image.asset(
                  AppImage.securePaymentBadge,
                  width: isMobile ? 120 : 180,
                  height: isMobile ? 120 : 180,
                  fit: BoxFit.contain,
                ),
                Hbox(isMobile ? 24 : 32),
                // "Why Kapitor?" heading
                AppText(
                  'Why Kapitor?',
                  textAlign: TextAlign.center,
                  style: Ts.bold(
                    size: isMobile ? 32 : 48,
                    color: AppColor.black,
                  ),
                ),
                Hbox(isMobile ? 16 : 24),
                // Description text - centered
                SizedBox(
                  width: isMobile ? double.infinity : 900,
                  child: AppText(
                    'In a market of high volatility, our platform is your anchor. Powered by Stable Coin technology, we cut through the noise to offer you a secure, low-fee, and highly liquid gateway to the digital economy',
                    textAlign: TextAlign.center,
                    style: Ts.regular(
                      size: isMobile ? 14 : 18,
                      color: AppColor.textcolor,
                    ),
                  ),
                ),
                // Mobile decorative icons
                if (isMobile) ...[
                  Hbox(32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _DecorativeIcon(
                        child: _GridIcon(),
                      ),
                      _DecorativeIcon(
                        child: Image.asset(
                          AppImage.heroCharacter,
                          width: 50,
                          height: 50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DecorativeIcon extends StatelessWidget {
  const _DecorativeIcon({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: child,
    );
  }
}

class _GridIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.gray300, width: 1.5),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.blue200, // Light blue
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                      ),
                    ),
                  ),
                ),
                Container(width: 1.5, color: AppColor.gray300),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1.5, color: AppColor.gray300),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                      ),
                    ),
                  ),
                ),
                Container(width: 1.5, color: AppColor.gray300),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.blue200, // Light blue
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(6),
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
  }
}

