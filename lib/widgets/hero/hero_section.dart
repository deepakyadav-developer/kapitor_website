import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/utils/app_button.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';
import 'package:kapitor_website/widgets/hero/hero_background_images.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 768;
//wrap with singlechild scroll veiw
    return SingleChildScrollView(
      child: SizedBox(
      width: double.infinity,
      height: isMobile ? screenHeight * 0.9 : screenHeight * 1.0,
      child: Stack(
        children: [
          // Background images
          const HeroBackgroundImages(),

          // Main content
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 80,
              vertical: isMobile ? 40 : 80,
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // "WHERE CRYPTO MEETS COMMODITIES" badge
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : 20,
                  vertical: isMobile ? 6 : 10,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border.all(color: AppColor.black, width: 1),
                  borderRadius: BorderRadius.circular(isMobile ? 40 : 40),
                ),
                child: AppText(
                  'WHERE CRYPTO MEETS COMMODITIES',
                  style: Ts.bold(
                    size: isMobile ? 10 : 12,
                    color: AppColor.black,
                  ),
                ),
              ),

              Hbox(isMobile ? 24 : 40),

              // Main headline
              AppText(
                'Your Money.\nSmarter. Faster.\nBorderless.',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isMobile ? 32 : 64,
                  color: AppColor.black,
                ),
              ),

              Hbox(isMobile ? 10 : 20),

              // Description paragraph
              SizedBox(
                width: isMobile ? double.infinity : 900,
                child: AppText(
                  'Kapitor is the world\'s first USDT-powered financial super-app bringing banking, investing, trading, tokenized assets, and private placement programs into one powerful mobile experience.',
                  textAlign: TextAlign.center,
                  style: Ts.regular(
                    size: isMobile ? 14 : 18,
                    color: AppColor.textcolor,
                  ),
                ),
              ),

              Hbox(isMobile ? 20 : 28),

              // Buttons
              isMobile
                  ? Column(
                      children: [
                        AppButton(
                          text: 'Explore Features',
                          onPressed: () {},
                          bgColor: AppColor.black,
                          textColor: AppColor.white,
                          isFullWidth: true,
                          height: 50,
                          borderRadius: 40,
                          textStyle: Ts.semiBold16(color: AppColor.white),
                        ),
                        const Hbox(16),
                        AppButton(
                          text: 'Download the App',
                          onPressed: () {},
                          bgColor: AppColor.white,
                          textColor: AppColor.primary,
                          borderColor: AppColor.primary,
                          borderWidth: 1,
                          isFullWidth: true,
                          height: 50,
                          borderRadius: 40,
                          icon: Icons.apple,
                          textStyle: Ts.semiBold16(color: AppColor.primary),
                        ),
                        const Hbox(16),
                        AppButton(
                          text: 'Watch Demo',
                          onPressed: () {},
                          bgColor: AppColor.black,
                          textColor: AppColor.white,
                          isFullWidth: true,
                          height: 50,
                          borderRadius: 40,
                          textStyle: Ts.semiBold16(color: AppColor.white),
                        ),
                      ],
                    )
                  : Padding(padding: EdgeInsets.symmetric(horizontal: 40), child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppButton(
                          text: 'Explore Features',
                          onPressed: () {},
                          bgColor: AppColor.black,
                          textColor: AppColor.white,
                          isFullWidth: false,
                          height: 56,
                          borderRadius: 40,
                          horizontalPadding: 40,
                          textStyle: Ts.semiBold16(color: AppColor.white),
                        ),
                        const Wbox(16),
                        AppButton(
                          text: 'Download the App',
                          onPressed: () {},
                          bgColor: AppColor.white,
                          textColor: AppColor.primary,
                          borderColor: AppColor.primary,
                          borderWidth: 1,
                          isFullWidth: false,
                          height: 56,
                          borderRadius: 40,
                          horizontalPadding: 32,
                          icon: Icons.apple,
                          textStyle: Ts.semiBold16(color: AppColor.primary),
                        ),
                        const Wbox(16),
                        AppButton(
                          text: 'Watch Demo',
                          onPressed: () {},
                          bgColor: AppColor.black,
                          textColor: AppColor.white,
                          isFullWidth: false,
                          height: 56,
                          borderRadius: 40,
                          horizontalPadding: 32,
                          textStyle: Ts.semiBold16(color: AppColor.white),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
        ],
      ),
    ),
    );
  }
}

