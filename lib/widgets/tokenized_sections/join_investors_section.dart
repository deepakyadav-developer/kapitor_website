import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class JoinInvestorsSection extends StatelessWidget {
  const JoinInvestorsSection({super.key});

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

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF26CE92), Color(0xFF1DB87A)],
              ),
              borderRadius: BorderRadius.circular(isDesktop ? 24.0 : 16.0),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 60.0 : (isTablet ? 40.0 : 24.0),
              vertical: isDesktop ? 60.0 : (isTablet ? 50.0 : 40.0),
            ),
            child: isMobile
                ? _buildMobileLayout(isDesktop, isTablet)
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left content
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              'Join a new generation\nof investors',
                              style: Ts.bold(
                                size: isDesktop
                                    ? 36.0
                                    : (isTablet ? 30.0 : 24.0),
                                color: Colors.white,
                              ),
                            ),
                            Hbox(isDesktop ? 32.0 : 24.0),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF26CE92),
                                padding: EdgeInsets.symmetric(
                                  horizontal: isDesktop
                                      ? 40.0
                                      : (isTablet ? 32.0 : 28.0),
                                  vertical: isDesktop
                                      ? 16.0
                                      : (isTablet ? 14.0 : 12.0),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                elevation: 0,
                              ),
                              child: AppText(
                                'Get started',
                                style: Ts.semiBold(
                                  size: isDesktop
                                      ? 16.0
                                      : (isTablet ? 15.0 : 14.0),
                                  color: const Color(0xFF26CE92),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Wbox(isDesktop ? 60.0 : 40.0),
                      // Right crypto icons
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _buildCryptoIcon(
                              AppImage.btc,
                              isDesktop ? 100.0 : 80.0,
                              Colors.white,
                            ),
                            Wbox(isDesktop ? 16.0 : 12.0),
                            _buildCryptoIcon(
                              AppImage.eth,
                              isDesktop ? 90.0 : 70.0,
                              Colors.white,
                            ),
                            Wbox(isDesktop ? 16.0 : 12.0),
                            _buildCryptoIcon(
                              AppImage.luna,
                              isDesktop ? 95.0 : 75.0,
                              const Color(0xFF1E2A47),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  Widget _buildCryptoIcon(String imagePath, double size, Color bgColor) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: EdgeInsets.all(size * 0.2),
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }

  Widget _buildMobileLayout(bool isDesktop, bool isTablet) {
    return Column(
      children: [
        AppText(
          'Join a new generation\nof investors',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 24.0, color: Colors.white),
        ),
        Hbox(24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCryptoIcon(AppImage.btc, 70.0, Colors.white),
            Wbox(12.0),
            _buildCryptoIcon(AppImage.eth, 60.0, Colors.white),
            Wbox(12.0),
            _buildCryptoIcon(AppImage.luna, 65.0, const Color(0xFF1E2A47)),
          ],
        ),
        Hbox(32.0),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF26CE92),
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 14.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 0,
          ),
          child: AppText(
            'Get started',
            style: Ts.semiBold(size: 14.0, color: const Color(0xFF26CE92)),
          ),
        ),
      ],
    );
  }
}
