import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/utils/ts.dart';
import 'package:kapitor_website/pages/about/about_page.dart';
import 'package:kapitor_website/pages/home/home_page.dart';
import 'package:kapitor_website/pages/kapai/kapai_page.dart';
import 'package:kapitor_website/pages/offering/offering_page.dart';
import 'package:kapitor_website/pages/payment/payment_page.dart';
import 'package:kapitor_website/pages/security/security_page.dart';
import 'package:kapitor_website/pages/insurance/insurance_page.dart';
import 'package:kapitor_website/pages/tokenized/tokenized_page.dart';
import 'package:kapitor_website/pages/trading/trading_page.dart';
import 'package:kapitor_website/pages/travel/travel_page.dart';
import 'package:kapitor_website/pages/wallet/wallet_page.dart';
import 'package:kapitor_website/pages/feature/feature_showcase_page.dart';
import 'package:kapitor_website/pages/examples/download_buttons_example_page.dart';
import 'package:kapitor_website/pages/feature/interactive_feature_showcase_page.dart';
import 'package:kapitor_website/pages/customer_care/customer_care_page.dart';
import 'package:kapitor_website/pages/support/support_page.dart';
import 'package:kapitor_website/pages/terms/terms_page.dart';
import 'package:kapitor_website/pages/ppp/ppp_page.dart';
import 'package:kapitor_website/pages/api/api_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kapitor Website',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primary,
          secondary: AppColor.secondary,
        ),
        textTheme: Ts.textTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/offering': (context) => const OfferingPage(),
        '/security': (context) => const SecurityPage(),
        '/wallet': (context) => const WalletPage(),
        '/payment': (context) => const PaymentPage(),
        '/trading': (context) => const TradingPage(),
        '/tokenized': (context) => const TokenizedPage(),
        '/insurance': (context) => const InsurancePage(),
        '/travel': (context) => const TravelPage(),
        '/kapai': (context) => const KapAiPage(),
        '/feature-showcase': (context) => const FeatureShowcasePage(),
        '/customer-care': (context) => const CustomerCarePage(),
        '/support': (context) => const SupportPage(),
        '/terms': (context) => const TermsPage(),
        '/ppp': (context) => const PppPage(),
        '/api': (context) => const ApiPage(),
        '/download-buttons-example': (context) =>
            const DownloadButtonsExamplePage(),
        '/interactive-feature': (context) =>
            const InteractiveFeatureShowcasePage(),
      },
    );
  }
}
