import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/widgets/common/scroll_to_top_button.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';
import 'package:kapitor_website/widgets/trading_sections/agriculture_points_section.dart';
import 'package:kapitor_website/widgets/trading_sections/crypto_premium_section.dart';
import 'package:kapitor_website/widgets/trading_sections/forecast_viewing_section.dart';
import 'package:kapitor_website/widgets/trading_sections/invite_team_section.dart';
import 'package:kapitor_website/widgets/trading_sections/portfolio_tracking_section.dart';
import 'package:kapitor_website/widgets/trading_sections/trading_hero_section.dart';
import 'package:kapitor_website/widgets/trading_sections/user_centric_features_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/complex_questions_section.dart';

class TradingPage extends StatefulWidget {
  const TradingPage({super.key});

  @override
  State<TradingPage> createState() => _TradingPageState();
}

class _TradingPageState extends State<TradingPage> {
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
                TradingHeroSection(),
                PortfolioTrackingSection(),
                CryptoPremiumSection(),
                InviteTeamSection(),
                UserCentricFeaturesSection(),
                ForecastViewingSection(),
                AgriculturePointsSection(),
                ComplexQuestionsSection(),
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
