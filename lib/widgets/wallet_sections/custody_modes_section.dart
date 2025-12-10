import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class CustodyModesSection extends StatelessWidget {
  const CustodyModesSection({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              // Heading with quotation marks
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    '"',
                    style: Ts.bold(
                      size: isDesktop ? 48.0 : 36.0,
                      color: const Color(0xFF4CAF50),
                    ),
                  ),
                  Wbox(8.0),
                  AppText(
                    'CUSTODIAL OR SELF-CUSTODY MODES',
                    style: Ts.bold(
                      size: isDesktop ? 32.0 : (isTablet ? 28.0 : 24.0),
                      color: Colors.black,
                    ),
                  ),
                  Wbox(8.0),
                  AppText(
                    '"',
                    style: Ts.bold(
                      size: isDesktop ? 48.0 : 36.0,
                      color: const Color(0xFF4CAF50),
                    ),
                  ),
                ],
              ),

              Hbox(isDesktop ? 24.0 : 16.0),

              // Introductory Text
              AppText(
                'Kapitor gives users full control over the security model, allowing them to choose between.',
                textAlign: TextAlign.center,
                style: Ts.regular(
                  size: isDesktop ? 18.0 : (isTablet ? 16.0 : 14.0),
                  color: Colors.grey.shade700,
                ),
              ),

              Hbox(isDesktop ? 60.0 : 40.0),

              // Step 1: Custodial Mode
              _CustodyStep(
                stepNumber: 'Step 1',
                stepLetter: 'A',
                title:
                    'Custodial Mode - Fireblocks/ BitGo-Grade Institutional Protection',
                description:
                    'Join the Boosty Affiliate Program today and receive your affiliate link.',
                ctaText: 'Get Started',
                ctaColor: Colors.red,
                imagePath:
                    AppImage.wallet2, // Using people image as placeholder
                isDesktop: isDesktop,
                isTablet: isTablet,
                isMobile: isMobile,
                imageOnLeft: true,
                noBorder: true,
              ),

              Hbox(isDesktop ? 60.0 : 40.0),

              // Step 2: Self-Custody Mode
              _CustodyStep(
                stepNumber: 'Step 2',
                stepLetter: 'B',
                title: 'Self-Custody Mode - Complete Personal Control',
                description:
                    'Spread the word about your affiliate link! When folks click on your link, they\'ve got a whole 30 days to sign, and that\'s when you start earning commissions.',
                ctaText: 'Get Started',
                ctaColor: const Color(0xFF4CAF50),
                imagePath: AppImage.wallet3, // Using wallet image
                isDesktop: isDesktop,
                isTablet: isTablet,
                isMobile: isMobile,
                imageOnLeft: false,
                noBorder: true,
              ),

              Hbox(isDesktop ? 60.0 : 40.0),

              // Step 3: Why Dual Custody Matters
              _CustodyStep(
                stepNumber: 'Step 3',
                stepLetter: 'C',
                title: 'Why Dual Custody Matters',
                description:
                    'With our tiered model, you can score commissions of 20% each sale from customers you bring in. So, the more folks you bring on board, the more money you\'ll earn!',
                ctaText: "Get Started",
                ctaColor: null,
                imagePath:
                    AppImage.wallet4, // Using people image as placeholder
                isDesktop: isDesktop,
                isTablet: isTablet,
                isMobile: isMobile,
                imageOnLeft: true,
                noBorder: true,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CustodyStep extends StatelessWidget {
  final String stepNumber;
  final String stepLetter;
  final String title;
  final String description;
  final String? ctaText;
  final Color? ctaColor;
  final String imagePath;
  final bool isDesktop;
  final bool isTablet;
  final bool isMobile;
  final bool imageOnLeft;
  final bool noBorder;

  const _CustodyStep({
    required this.stepNumber,
    required this.stepLetter,
    required this.title,
    required this.description,
    this.ctaText,
    this.ctaColor,
    required this.imagePath,
    required this.isDesktop,
    required this.isTablet,
    required this.isMobile,
    required this.imageOnLeft,
    this.noBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        children: [
          // Image
          Container(
            constraints: const BoxConstraints(maxHeight: 300.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, size: 80, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Hbox(24.0),
          // Content
          _buildContent(),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (imageOnLeft) ...[
          Expanded(
            flex: 1,
            child: Container(
              constraints: BoxConstraints(maxHeight: isDesktop ? 400.0 : 300.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: isDesktop ? 350 : 250,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Center(
                      child: Icon(Icons.image, size: 100, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          Wbox(isDesktop ? 40.0 : 24.0),
        ],
        Expanded(flex: 1, child: _buildContent()),
        if (!imageOnLeft) ...[
          Wbox(isDesktop ? 40.0 : 24.0),
          Expanded(
            flex: 1,
            child: Container(
              constraints: BoxConstraints(maxHeight: isDesktop ? 400.0 : 300.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: isDesktop ? 350 : 250,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Center(
                      child: Icon(Icons.image, size: 100, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step Number
        AppText(
          stepLetter.isNotEmpty ? '$stepNumber $stepLetter' : stepNumber,
          style: Ts.bold(
            size: isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0),
            color: const Color(0xFF4CAF50),
          ),
        ),

        Hbox(isDesktop ? 16.0 : 12.0),

        // Title
        AppText(
          title,
          style: Ts.bold(
            size: isDesktop ? 24.0 : (isTablet ? 20.0 : 18.0),
            color: Colors.black,
          ),
        ),

        Hbox(isDesktop ? 16.0 : 12.0),

        // Description
        AppText(
          description,
          style: Ts.regular(
            size: isDesktop ? 16.0 : (isTablet ? 14.0 : 13.0),
            color: Colors.grey.shade700,
          ),
        ),

        if (ctaText != null) ...[
          Hbox(isDesktop ? 24.0 : 16.0),
          _AnimatedGetStartedButton(
            text: ctaText!,
            color: ctaColor ?? const Color(0xFF4CAF50),
            isDesktop: isDesktop,
            noBorder: noBorder,
          ),
        ],
      ],
    );
  }
}

class _AnimatedGetStartedButton extends StatefulWidget {
  final String text;
  final Color color;
  final bool isDesktop;
  final bool noBorder;

  const _AnimatedGetStartedButton({
    required this.text,
    required this.color,
    required this.isDesktop,
    this.noBorder = false,
  });

  @override
  State<_AnimatedGetStartedButton> createState() =>
      _AnimatedGetStartedButtonState();
}

class _AnimatedGetStartedButtonState extends State<_AnimatedGetStartedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    if (widget.noBorder) {
      // Text-only button with arrow on hover (no border)
      return MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            // Add navigation or action here
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                widget.text,
                style: Ts.semiBold(
                  size: widget.isDesktop ? 16.0 : 14.0,
                  color: widget.color,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _isHovered ? 28.0 : 0,
                child: _isHovered
                    ? Row(
                        children: [
                          Wbox(8.0),
                          Icon(
                            Icons.arrow_forward,
                            size: widget.isDesktop ? 18.0 : 16.0,
                            color: widget.color,
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      );
    }

    // Bordered button with fill on hover
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Add navigation or action here
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(
            horizontal: widget.isDesktop ? 24.0 : 20.0,
            vertical: widget.isDesktop ? 14.0 : 12.0,
          ),
          decoration: BoxDecoration(
            color: _isHovered ? widget.color : Colors.transparent,
            border: Border.all(color: widget.color, width: 2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                widget.text,
                style: Ts.semiBold(
                  size: widget.isDesktop ? 16.0 : 14.0,
                  color: _isHovered ? Colors.white : widget.color,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _isHovered ? 8.0 : 0,
                child: _isHovered
                    ? Row(
                        children: [
                          Wbox(8.0),
                          Icon(
                            Icons.arrow_forward,
                            size: widget.isDesktop ? 18.0 : 16.0,
                            color: Colors.white,
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
