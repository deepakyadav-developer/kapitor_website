import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';
import 'package:kapitor_website/widgets/common/scroll_to_top_button.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';
import 'package:kapitor_website/widgets/wallet_sections/cross_chain_bridge_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/custody_modes_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/qr_scan_pay_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/support_by_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/wallet_faq_section.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF26CE92), // Bright green background
      endDrawer: HeaderWidget.buildMobileDrawer(context),
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;
              final isTablet =
                  constraints.maxWidth >= 600 && constraints.maxWidth < 900;
              final isMobile = constraints.maxWidth < 600;

              final horizontalPadding = isDesktop
                  ? constraints.maxWidth * 0.08
                  : (isTablet ? 24.0 : 16.0);
              final verticalPadding = isDesktop
                  ? 80.0
                  : (isTablet ? 60.0 : 40.0);

              return SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const HeaderWidget(),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: verticalPadding,
                      ),
                      child: isMobile
                          ? _buildMobileLayout()
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left Section - Text and CTA
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Welcome Banner
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: isDesktop ? 20.0 : 16.0,
                                          vertical: isDesktop ? 12.0 : 10.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(
                                            0xFF26CE92,
                                          ), // Light green
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: isDesktop ? 20.0 : 18.0,
                                            ),
                                            Wbox(8.0),
                                            AppText(
                                              'Welcome to a Modern Financial Experience',
                                              style: Ts.semiBold(
                                                size: isDesktop ? 14.0 : 12.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      Hbox(isDesktop ? 32.0 : 24.0),

                                      // Main Headline
                                      AppText(
                                        'Kapitor Wallet — The Institutional\nUSDT Core Banking Layer',
                                        style: Ts.bold(
                                          size: isDesktop
                                              ? 48.0
                                              : (isTablet ? 36.0 : 32.0),
                                          color: Colors.black,
                                        ),
                                      ),

                                      Hbox(isDesktop ? 24.0 : 16.0),

                                      // Sub-headline
                                      AppText(
                                        'A multi-chain, custody-grade digital banking engine engineered for global financial mobility.',
                                        style: Ts.regular(
                                          size: isDesktop
                                              ? 20.0
                                              : (isTablet ? 18.0 : 16.0),
                                          color: Colors.white,
                                        ),
                                      ),

                                      Hbox(isDesktop ? 32.0 : 24.0),

                                      // Description
                                      AppText(
                                        'Kapitor\'s Wallet is not a typical crypto wallet. It is a fully engineered institutional USDT banking infrastructure designed for global payments, secure asset holding, multi-chain mobility, and institutional-grade settlement.',
                                        style: Ts.regular(
                                          size: isDesktop
                                              ? 16.0
                                              : (isTablet ? 14.0 : 13.0),
                                          color: Colors.white, // Darker green
                                        ),
                                      ),

                                      Hbox(isDesktop ? 40.0 : 32.0),

                                      // App Download Buttons
                                      Row(
                                        children: [
                                          _AppDownloadButton(
                                            imagePath: AppImage.playstorelogo,
                                            text: 'GET IT ON\nGoogle Play',
                                            isDesktop: isDesktop,
                                            isTablet: isTablet,
                                          ),
                                          Wbox(16.0),
                                          _AppDownloadButton(
                                            imagePath: AppImage.applelogo,
                                            text: 'Download on the\nApp Store',
                                            isDesktop: isDesktop,
                                            isTablet: isTablet,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Wbox(isDesktop ? 60.0 : 40.0),

                                // Right Section - Wallet Illustration
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxHeight: isDesktop
                                          ? 600.0
                                          : (isTablet ? 500.0 : 400.0),
                                    ),
                                    child: Image.asset(
                                      AppImage.wallet,
                                      fit: BoxFit.contain,
                                      width: double.infinity,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              height: isDesktop ? 500 : 400,
                                              decoration: BoxDecoration(
                                                color: Colors.white.withValues(
                                                  alpha: 0.1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: const Center(
                                                child: Icon(
                                                  Icons.account_balance_wallet,
                                                  size: 100,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                    const SupportBySection(),
                    const CustodyModesSection(),
                    const QrScanPaySection(),
                    const CrossChainBridgeSection(),
                    const WalletFaqSection(),
                    const FooterWidget(),
                  ],
                ),
              );
            },
          ),
          ScrollToTopButton(
            scrollController: _scrollController,
            progressColor: AppColor.primary,
            showAfterScroll: 300,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Welcome Banner with Animation
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 800),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 20 * (1 - value)),
                child: child,
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF81C784), // Light green
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: Colors.white, size: 18.0),
                Wbox(8.0),
                AppText(
                  'Welcome to a Modern Financial Experience',
                  style: Ts.semiBold(size: 12.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        Hbox(24.0),

        // Main Headline with Animation
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 1000),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(scale: 0.8 + (0.2 * value), child: child),
            );
          },
          child: AppText(
            'Kapitor Wallet — The Institutional\nUSDT Core Banking Layer',
            textAlign: TextAlign.center,
            style: Ts.bold(size: 28.0, color: Colors.black),
          ),
        ),

        Hbox(16.0),

        // Sub-headline with Animation
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 1200),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 15 * (1 - value)),
                child: child,
              ),
            );
          },
          child: AppText(
            'A multi-chain, custody-grade digital banking engine engineered for global financial mobility.',
            textAlign: TextAlign.center,
            style: Ts.regular(size: 15.0, color: Colors.white),
          ),
        ),

        Hbox(24.0),

        // Wallet Illustration with Animation
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 1400),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.scale(scale: 0.9 + (0.1 * value), child: child),
            );
          },
          child: Container(
            constraints: const BoxConstraints(maxHeight: 400.0),
            child: Image.asset(
              AppImage.wallet,
              fit: BoxFit.contain,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.account_balance_wallet,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        Hbox(32.0),

        // Description with Animation - WHITE COLOR
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 1600),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 10 * (1 - value)),
                child: child,
              ),
            );
          },
          child: AppText(
            'Kapitor\'s Wallet is not a typical crypto wallet. It is a fully engineered institutional USDT banking infrastructure designed for global payments, secure asset holding, multi-chain mobility, and institutional-grade settlement.',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: 14.0,
              color: Colors.white, // Changed to white
            ),
          ),
        ),

        Hbox(32.0),

        // App Download Buttons with Animation
        TweenAnimationBuilder<double>(
          duration: const Duration(milliseconds: 1800),
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, value, child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, 20 * (1 - value)),
                child: child,
              ),
            );
          },
          child: Column(
            children: [
              _AppDownloadButton(
                imagePath: AppImage.playstorelogo,
                text: 'GET IT ON\nGoogle Play',
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(16.0),
              _AppDownloadButton(
                imagePath: AppImage.applelogo,
                text: 'Download on the\nApp Store',
                isDesktop: false,
                isTablet: false,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AppDownloadButton extends StatelessWidget {
  final String? imagePath;
  final String text;
  final bool isDesktop;
  final bool isTablet;

  const _AppDownloadButton({
    this.imagePath,
    required this.text,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 20.0 : (isTablet ? 16.0 : 14.0),
        vertical: isDesktop ? 14.0 : (isTablet ? 12.0 : 10.0),
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imagePath != null)
            Image.asset(
              imagePath!,
              width: isDesktop ? 24.0 : (isTablet ? 20.0 : 18.0),
              height: isDesktop ? 24.0 : (isTablet ? 20.0 : 18.0),
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.shop,
                  color: Colors.white,
                  size: isDesktop ? 24.0 : (isTablet ? 20.0 : 18.0),
                );
              },
            )
          else
            Icon(
              Icons.shop,
              color: Colors.white,
              size: isDesktop ? 24.0 : (isTablet ? 20.0 : 18.0),
            ),
          Wbox(12.0),
          AppText(
            text,
            style: Ts.semiBold(
              size: isDesktop ? 14.0 : (isTablet ? 12.0 : 11.0),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
