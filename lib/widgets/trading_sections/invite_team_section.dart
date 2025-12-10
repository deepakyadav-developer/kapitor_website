import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class InviteTeamSection extends StatelessWidget {
  const InviteTeamSection({Key? key}) : super(key: key);

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
          child: isMobile
              ? _buildMobileLayout()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left Section - Content
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'Invite team\nmembers & enlarge\nyour groups',
                            style: Ts.bold(
                              size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                              color: Colors.black,
                            ),
                          ),
                          Hbox(isDesktop ? 24.0 : 20.0),
                          AppText(
                            'Build trading teams, share strategies, and collaborate on investment decisions. Invite members to join your trading groups and grow together.',
                            style: Ts.regular(
                              size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                              color: Colors.grey.shade700,
                            ),
                          ),
                          Hbox(isDesktop ? 40.0 : 32.0),
                          AppText(
                            'Explore Now',
                            style: Ts.semiBold(
                              size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Wbox(isDesktop ? 80.0 : 60.0),
                    // Right Section - Image
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        AppImage.bro,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: isDesktop ? 400 : 300,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.people,
                                size: 100,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        AppText(
          'Invite team\nmembers & enlarge\nyour groups',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 28.0, color: Colors.black),
        ),
        Hbox(20.0),
        AppText(
          'Build trading teams, share strategies, and collaborate on investment decisions. Invite members to join your trading groups and grow together.',
          textAlign: TextAlign.center,
          style: Ts.regular(size: 14.0, color: Colors.grey.shade700),
        ),
        Hbox(32.0),
        Image.asset(
          AppImage.bro,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Center(
                child: Icon(Icons.people, size: 80, color: Colors.grey),
              ),
            );
          },
        ),
        Hbox(32.0),
        AppText(
          'Explore Now',
          style: Ts.semiBold(size: 14.0, color: Colors.black),
        ),
      ],
    );
  }
}
