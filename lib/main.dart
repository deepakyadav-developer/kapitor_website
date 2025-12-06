import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/utils/ts.dart';
import 'package:kapitor_website/pages/about/about_page.dart';
import 'package:kapitor_website/pages/home/home_page.dart';
import 'package:kapitor_website/pages/offering/offering_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary,secondary: AppColor.secondary),
        textTheme: Ts.textTheme(),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/about': (context) => const AboutPage(),
        '/offering': (context) => const OfferingPage(),
      },
    );
  }
}

