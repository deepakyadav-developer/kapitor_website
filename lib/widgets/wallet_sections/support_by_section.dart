import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';

class SupportBySection extends StatelessWidget {
  const SupportBySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;

        final horizontalPadding = isDesktop
            ? constraints.maxWidth * 0.08
            : (isTablet ? 24.0 : 16.0);
        final verticalPadding = isDesktop ? 60.0 : (isTablet ? 40.0 : 32.0);

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              AppText(
                'Support By',
                style: Ts.regular(
                  size: isDesktop ? 16.0 : 14.0,
                  color: Colors.grey.shade600,
                ),
              ),
              Hbox(isDesktop ? 32.0 : 24.0),
              // Company Logos
              Wrap(
                alignment: WrapAlignment.center,
                spacing: isDesktop ? 40.0 : 24.0,
                runSpacing: isDesktop ? 24.0 : 16.0,
                children: [
                  _CompanyLogo(imagePath: AppImage.google),
                    _CompanyLogo(imagePath: AppImage.afterpay),
                  _CompanyLogo(imagePath: AppImage.asana),
                  _CompanyLogo(imagePath: AppImage.dropbox),
                  _CompanyLogo(imagePath: AppImage.spotify),
                  _CompanyLogo(imagePath: AppImage.grammarly),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CompanyLogo extends StatelessWidget {
  final String imagePath;

  const _CompanyLogo({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Image.asset(
        imagePath,
        width: 100,
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }
}

