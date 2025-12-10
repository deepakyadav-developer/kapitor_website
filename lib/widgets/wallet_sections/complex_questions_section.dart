import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class ComplexQuestionsSection extends StatelessWidget {
  const ComplexQuestionsSection({Key? key}) : super(key: key);

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
          color: const Color(0xFFF8F9FA),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Section - Content
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2196F3),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: AppText(
                        '1800 # 7788',
                        style: Ts.bold(
                          size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
                          color: Colors.white,
                        ),
                      ),
                    ),

                    Hbox(isDesktop ? 24.0 : 20.0),

                    // Main Heading
                    AppText(
                      'Complex Questions?',
                      style: Ts.bold(
                        size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                        color: const Color(0xFF1A1A1A),
                      ),
                    ),

                    Hbox(isDesktop ? 24.0 : 20.0),

                    // Description
                    AppText(
                      'Request for a personalized budget for your legal problem. We will send you a coupe options in 24 hours. You can have free consult, if a our first customer',
                      style: Ts.regular(
                        size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                        color: Colors.grey.shade600,
                      ),
                    ),

                    Hbox(isDesktop ? 32.0 : 24.0),

                    // Call Button
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      label: AppText(
                        'Call now',
                        style: Ts.semiBold(
                          size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: isDesktop
                              ? 32.0
                              : (isTablet ? 28.0 : 24.0),
                          vertical: isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              ),

              Wbox(isDesktop ? 80.0 : 60.0),

              // Right Section - Image with rounded corner
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  ),
                  child: Image.asset(
                    AppImage.cquestion,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: isDesktop ? 400 : 300,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.question_answer,
                            size: 100,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
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
      width: double.infinity,
      color: const Color(0xFFF8F9FA),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          // Badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF2196F3),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: AppText(
              '1800 # 7788',
              style: Ts.bold(size: 12.0, color: Colors.white),
            ),
          ),

          Hbox(20.0),

          // Main Heading
          AppText(
            'Complex Questions?',
            textAlign: TextAlign.center,
            style: Ts.bold(size: 28.0, color: const Color(0xFF1A1A1A)),
          ),

          Hbox(20.0),

          // Description
          AppText(
            'Request for a personalized budget for your legal problem. We will send you a coupe options in 24 hours. You can have free consult, if a our first customer',
            textAlign: TextAlign.center,
            style: Ts.regular(size: 14.0, color: Colors.grey.shade600),
          ),

          Hbox(32.0),

          // Image with rounded corner
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            child: Image.asset(
              AppImage.cquestion,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.question_answer,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),

          Hbox(32.0),

          // Call Button
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.phone, color: Colors.white, size: 20.0),
            label: AppText(
              'Call now',
              style: Ts.semiBold(size: 14.0, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E3A5F),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 12.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
