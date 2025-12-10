import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/widgets/explore_offering/explore_offering_section.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';

class OfferingPage extends StatelessWidget {
  const OfferingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      endDrawer: HeaderWidget.buildMobileDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeaderWidget(),
            ExploreOfferingSection(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
