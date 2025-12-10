import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/widgets/common/scroll_to_top_button.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';
import 'package:kapitor_website/widgets/tokenized_sections/crypto_easy_section.dart';
import 'package:kapitor_website/widgets/tokenized_sections/market_portfolio_section.dart';
import 'package:kapitor_website/widgets/tokenized_sections/more_about_crypto_section.dart';
import 'package:kapitor_website/widgets/tokenized_sections/tokenized_hero_section.dart';
import 'package:kapitor_website/widgets/tokenized_sections/sell_buy_crypto_section.dart';
import 'package:kapitor_website/widgets/tokenized_sections/trusted_platform_section.dart';
import 'package:kapitor_website/widgets/tokenized_sections/agriculture_caption_section.dart';
import 'package:kapitor_website/widgets/tokenized_sections/crypto_saving_base_section.dart';
import 'package:kapitor_website/widgets/tokenized_sections/join_investors_section.dart';

class TokenizedPage extends StatefulWidget {
  const TokenizedPage({super.key});

  @override
  State<TokenizedPage> createState() => _TokenizedPageState();
}

class _TokenizedPageState extends State<TokenizedPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: HeaderWidget.buildMobileDrawer(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: const Column(
              children: [
                HeaderWidget(),
                TokenizedHeroSection(),
                CryptoEasySection(),
                MoreAboutCryptoSection(),
                MarketPortfolioSection(),
                SellBuyCryptoSection(),
                TrustedPlatformSection(),
                AgricultureCaptionSection(),
                CryptoSavingBaseSection(),
                JoinInvestorsSection(),
                FooterWidget(),
              ],
            ),
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
}
