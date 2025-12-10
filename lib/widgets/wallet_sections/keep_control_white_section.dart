import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KeepControlWhiteSection extends StatelessWidget {
  const KeepControlWhiteSection({Key? key}) : super(key: key);

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
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: _buildContent(
                  Colors.black,
                  Colors.grey.shade700,
                  const Color(0xFF26CE92),
                  isDesktop,
                  isTablet,
                  false,
                ),
              ),
              Wbox(isDesktop ? 80.0 : 60.0),
              Expanded(flex: 1, child: _buildImage(isDesktop, isTablet)),
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
          _buildContent(
            Colors.black,
            Colors.grey.shade700,
            const Color(0xFF26CE92),
            false,
            false,
            true,
          ),
          Hbox(40.0),
          _buildImage(false, false),
        ],
      ),
    );
  }

  Widget _buildContent(
    Color titleColor,
    Color textColor,
    Color checkColor,
    bool isDesktop,
    bool isTablet,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        AppText(
          'Real-Time Payment Tracking',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.semiBold(
            size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
            color: Colors.grey.shade600,
          ),
        ),
        Hbox(isDesktop ? 16.0 : 12.0),
        AppText(
          'Complete Visibility\nOver Every Transaction',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.bold(
            size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
            color: titleColor,
          ),
        ),
        Hbox(isDesktop ? 24.0 : 20.0),
        AppText(
          'Track every USDT payment in real-time with complete transparency. View transaction history, payment status, and detailed analytics all in one dashboard.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.regular(
            size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
            color: textColor,
          ),
        ),
        Hbox(isDesktop ? 32.0 : 24.0),
        _buildFeature(
          'Instant Transaction Confirmations',
          checkColor,
          textColor,
          isDesktop,
          isTablet,
          isMobile,
        ),
        Hbox(12.0),
        _buildFeature(
          'Detailed Payment Analytics',
          checkColor,
          textColor,
          isDesktop,
          isTablet,
          isMobile,
        ),
        Hbox(12.0),
        _buildFeature(
          'Export Transaction Reports',
          checkColor,
          textColor,
          isDesktop,
          isTablet,
          isMobile,
        ),
      ],
    );
  }

  Widget _buildFeature(
    String text,
    Color checkColor,
    Color textColor,
    bool isDesktop,
    bool isTablet,
    bool isMobile,
  ) {
    return Row(
      mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
      children: [
        Icon(
          Icons.check_circle,
          color: checkColor,
          size: isDesktop ? 20.0 : 18.0,
        ),
        Wbox(8.0),
        AppText(
          text,
          style: Ts.regular(
            size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
            color: textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildImage(bool isDesktop, bool isTablet) {
    return Image.asset(
      AppImage.amico,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: isDesktop ? 400 : (isTablet ? 300 : 250),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Center(
            child: Icon(Icons.analytics, size: 100, color: Colors.grey),
          ),
        );
      },
    );
  }
}
