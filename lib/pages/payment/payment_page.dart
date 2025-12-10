import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/widgets/common/scroll_to_top_button.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';
import 'package:kapitor_website/widgets/wallet_sections/account_security_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/complex_questions_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/current_offers_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/keep_control_black_carousel_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/keep_control_white_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/open_account_steps_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/payment_discovery_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/products_services_section.dart';
import 'package:kapitor_website/widgets/wallet_sections/stats_counter_section.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
                PaymentDiscoverySection(),
                ProductsServicesSection(),
                OpenAccountStepsSection(),
                CurrentOffersSection(),
                AccountSecuritySection(),
                StatsCounterSection(),
                KeepControlWhiteSection(),
                KeepControlBlackCarouselSection(),
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
