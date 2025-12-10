import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/widgets/common/scroll_to_top_button.dart';
import 'package:kapitor_website/widgets/ppp/ppp_hero_section.dart';
import 'package:kapitor_website/widgets/ppp/ppp_crypto_section.dart';
import 'package:kapitor_website/widgets/ppp/ppp_financial_innovation_section.dart';
import 'package:kapitor_website/widgets/ppp/ppp_eligibility_section.dart';
import 'package:kapitor_website/widgets/ppp/ppp_one_banking_section.dart';
import 'package:kapitor_website/widgets/ppp/ppp_crypto_coins_section.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';

/// Public-Private Partnerships Page
class PppPage extends StatefulWidget {
  const PppPage({super.key});

  @override
  State<PppPage> createState() => _PppPageState();
}

class _PppPageState extends State<PppPage> {
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
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: const Column(
              children: [
                HeaderWidget(),
                PppHeroSection(),
                PppCryptoSection(),
                PppCryptoCoinsSection(),
                PppFinancialInnovationSection(),
                PppEligibilitySection(),
                PppOneBankingSection(),
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
