import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class OpenAccountStepsSection extends StatelessWidget {
  const OpenAccountStepsSection({super.key});

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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF00D9A3), Color(0xFF00C896)],
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Section Title
              AppText(
                'Open Kapitor Account',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 48.0 : (isTablet ? 38.0 : 32.0),
                  color: Colors.white,
                ),
              ),

              Hbox(isDesktop ? 60.0 : (isTablet ? 50.0 : 40.0)),

              // Steps Grid
              if (isMobile)
                _buildMobileSteps()
              else
                _buildDesktopSteps(isDesktop, isTablet),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopSteps(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _StepCard(
            imagePath: AppImage.scan1,
            stepNumber: 'Step 1',
            title: 'Download Kapitor App',
            description:
                'Get the app from Google Play or App Store and install on your device.',
            isDesktop: isDesktop,
            isTablet: isTablet,
          ),
        ),
        Wbox(isDesktop ? 24.0 : 16.0),
        Expanded(
          child: _StepCard(
            imagePath: AppImage.scan2,
            stepNumber: 'Step 2',
            title: 'Complete KYC Verification',
            description:
                'Submit your identity documents for instant verification and account activation.',
            isDesktop: isDesktop,
            isTablet: isTablet,
          ),
        ),
        Wbox(isDesktop ? 24.0 : 16.0),
        Expanded(
          child: _StepCard(
            imagePath: AppImage.scan3,
            stepNumber: 'Step 3',
            title: 'Start Using Kapitor',
            description:
                'Deposit USDT, access vaults, trade assets, and manage your global finances.',
            isDesktop: isDesktop,
            isTablet: isTablet,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileSteps() {
    return Column(
      children: [
        _StepCard(
          imagePath: AppImage.scan1,
          stepNumber: 'Step 1',
          title: 'Download Kapitor App',
          description:
              'Get the app from Google Play or App Store and install on your device.',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(24.0),
        _StepCard(
          imagePath: AppImage.scan2,
          stepNumber: 'Step 2',
          title: 'Complete KYC Verification',
          description:
              'Submit your identity documents for instant verification and account activation.',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(24.0),
        _StepCard(
          imagePath: AppImage.scan3,
          stepNumber: 'Step 3',
          title: 'Start Using Kapitor',
          description:
              'Deposit USDT, access vaults, trade assets, and manage your global finances.',
          isDesktop: false,
          isTablet: false,
        ),
      ],
    );
  }
}

class _StepCard extends StatelessWidget {
  final String imagePath;
  final String stepNumber;
  final String title;
  final String description;
  final bool isDesktop;
  final bool isTablet;

  const _StepCard({
    required this.imagePath,
    required this.stepNumber,
    required this.title,
    required this.description,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 24.0 : (isTablet ? 20.0 : 16.0)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image
          Container(
            height: isDesktop ? 180.0 : (isTablet ? 160.0 : 140.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Icon(
                    Icons.image,
                    size: isDesktop ? 60.0 : 50.0,
                    color: Colors.grey.shade400,
                  ),
                );
              },
            ),
          ),

          Hbox(isDesktop ? 24.0 : (isTablet ? 20.0 : 16.0)),

          // Step Number
          AppText(
            stepNumber,
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0),
              color: const Color(0xFF00D9A3),
            ),
          ),

          Hbox(8.0),

          // Title
          AppText(
            title,
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 18.0 : (isTablet ? 16.0 : 15.0),
              color: const Color(0xFF1A1A1A),
            ),
          ),

          Hbox(12.0),

          // Description
          AppText(
            description,
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
              color: Colors.grey.shade700,
            ),
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
