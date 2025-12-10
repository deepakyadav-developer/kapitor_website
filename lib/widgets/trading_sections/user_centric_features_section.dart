import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class UserCentricFeaturesSection extends StatelessWidget {
  const UserCentricFeaturesSection({Key? key}) : super(key: key);

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

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Title
              AppText(
                'Make every step user-centric',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                  color: Colors.black,
                ),
              ),

              Hbox(isDesktop ? 16.0 : 12.0),

              // Subtitle
              Container(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 600 : double.infinity,
                ),
                child: AppText(
                  'Comprehensive trading features designed for traders of all levels',
                  textAlign: TextAlign.center,
                  style: Ts.regular(
                    size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                    color: Colors.grey.shade600,
                  ),
                ),
              ),

              Hbox(isDesktop ? 60.0 : (isTablet ? 50.0 : 40.0)),

              // Feature Grid
              if (isMobile)
                _buildMobileGrid()
              else if (isTablet)
                _buildTabletGrid(isTablet)
              else
                _buildDesktopGrid(isDesktop),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopGrid(bool isDesktop) {
    return Column(
      children: [
        // Row 1
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _FeatureCard(
                icon: FontAwesomeIcons.headset,
                title: 'Support',
                description:
                    '24/7 customer support with dedicated trading specialists ready to assist with any questions or issues.',
                isDesktop: isDesktop,
                isTablet: false,
                showRightBorder: true,
                showBottomBorder: true,
              ),
            ),
            Expanded(
              child: _FeatureCard(
                icon: FontAwesomeIcons.chartColumn,
                title: 'Sales',
                description:
                    'Instant buy and sell orders with competitive pricing and zero hidden fees across all trading pairs.',
                isDesktop: isDesktop,
                isTablet: false,
                showRightBorder: true,
                showBottomBorder: true,
              ),
            ),
            Expanded(
              child: _FeatureCard(
                icon: FontAwesomeIcons.addressCard,
                title: 'Onboarding',
                description:
                    'Quick and easy account setup with guided tutorials to help you start trading in minutes.',
                isDesktop: isDesktop,
                isTablet: false,
                showRightBorder: false,
                showBottomBorder: true,
              ),
            ),
          ],
        ),
        // Row 2
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _FeatureCard(
                icon: FontAwesomeIcons.boxesStacked,
                title: 'Product',
                description:
                    'Trade crypto, tokenized stocks, commodities, and indices all from one unified platform.',
                isDesktop: isDesktop,
                isTablet: false,
                showRightBorder: true,
                showBottomBorder: false,
              ),
            ),
            Expanded(
              child: _FeatureCard(
                icon: FontAwesomeIcons.bagShopping,
                title: 'Quality',
                description:
                    'Institutional-grade execution with real-time data feeds and advanced order types for precision trading.',
                isDesktop: isDesktop,
                isTablet: false,
                showRightBorder: true,
                showBottomBorder: false,
              ),
            ),
            Expanded(
              child: _FeatureCard(
                icon: FontAwesomeIcons.chartPie,
                title: 'Result',
                description:
                    'Track your trading performance with detailed analytics, profit/loss reports, and portfolio insights.',
                isDesktop: isDesktop,
                isTablet: false,
                showRightBorder: false,
                showBottomBorder: false,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabletGrid(bool isTablet) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _FeatureCard(
                icon: FontAwesomeIcons.headset,
                title: 'Support',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipis elit. Sit enim nec, proin faucibus nibh et sagittis a. Lacinia purus ac amet.',
                isDesktop: false,
                isTablet: isTablet,
                showRightBorder: true,
                showBottomBorder: true,
              ),
            ),
            Expanded(
              child: _FeatureCard(
                icon: FontAwesomeIcons.chartColumn,
                title: 'Sales',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipis elit. Sit enim nec, proin faucibus nibh et sagittis a. Lacinia purus ac amet.',
                isDesktop: false,
                isTablet: isTablet,
                showRightBorder: false,
                showBottomBorder: true,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _FeatureCard(
                icon: FontAwesomeIcons.addressCard,
                title: 'Onboarding',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipis elit. Sit enim nec, proin faucibus nibh et sagittis a. Lacinia purus ac amet.',
                isDesktop: false,
                isTablet: isTablet,
                showRightBorder: true,
                showBottomBorder: true,
              ),
            ),
            Expanded(
              child: _FeatureCard(
                icon: FontAwesomeIcons.boxesStacked,
                title: 'Product',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipis elit. Sit enim nec, proin faucibus nibh et sagittis a. Lacinia purus ac amet.',
                isDesktop: false,
                isTablet: isTablet,
                showRightBorder: false,
                showBottomBorder: true,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _FeatureCard(
                icon: FontAwesomeIcons.bagShopping,
                title: 'Quality',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipis elit. Sit enim nec, proin faucibus nibh et sagittis a. Lacinia purus ac amet.',
                isDesktop: false,
                isTablet: isTablet,
                showRightBorder: true,
                showBottomBorder: false,
              ),
            ),
            Expanded(
              child: _FeatureCard(
                icon: FontAwesomeIcons.chartPie,
                title: 'Result',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipis elit. Sit enim nec, proin faucibus nibh et sagittis a. Lacinia purus ac amet.',
                isDesktop: false,
                isTablet: isTablet,
                showRightBorder: false,
                showBottomBorder: false,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileGrid() {
    return Column(
      children: [
        _FeatureCard(
          icon: FontAwesomeIcons.headset,
          title: 'Support',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipis elit. Sit enim nec, proin faucibus nibh et sagittis a. Lacinia purus ac amet.',
          isDesktop: false,
          isTablet: false,
          showRightBorder: false,
          showBottomBorder: true,
        ),
        _FeatureCard(
          icon: FontAwesomeIcons.chartColumn,
          title: 'Sales',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipis elit. Sit enim nec, proin faucibus nibh et sagittis a. Lacinia purus ac amet.',
          isDesktop: false,
          isTablet: false,
          showRightBorder: false,
          showBottomBorder: true,
        ),
        _FeatureCard(
          icon: FontAwesomeIcons.addressCard,
          title: 'Onboarding',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipis elit. Sit enim nec, proin faucibus nibh et sagittis a. Lacinia purus ac amet.',
          isDesktop: false,
          isTablet: false,
          showRightBorder: false,
          showBottomBorder: true,
        ),
        _FeatureCard(
          icon: FontAwesomeIcons.boxesStacked,
          title: 'Product',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipis elit. Sit enim nec, proin faucibus nibh et sagittis a. Lacinia purus ac amet.',
          isDesktop: false,
          isTablet: false,
          showRightBorder: false,
          showBottomBorder: true,
        ),
        _FeatureCard(
          icon: FontAwesomeIcons.bagShopping,
          title: 'Quality',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipis elit. Sit enim nec, proin faucibus nibh et sagittis a. Lacinia purus ac amet.',
          isDesktop: false,
          isTablet: false,
          showRightBorder: false,
          showBottomBorder: true,
        ),
        _FeatureCard(
          icon: FontAwesomeIcons.chartPie,
          title: 'Result',
          description:
              'Lorem ipsum dolor sit amet, consectetur adipis elit. Sit enim nec, proin faucibus nibh et sagittis a. Lacinia purus ac amet.',
          isDesktop: false,
          isTablet: false,
          showRightBorder: false,
          showBottomBorder: false,
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isDesktop;
  final bool isTablet;
  final bool showRightBorder;
  final bool showBottomBorder;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isDesktop,
    required this.isTablet,
    required this.showRightBorder,
    required this.showBottomBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 40.0 : (isTablet ? 32.0 : 24.0)),
      decoration: BoxDecoration(
        border: Border(
          right: showRightBorder
              ? BorderSide(
                  color: const Color(0xFF26CE92).withOpacity(0.3),
                  width: 1,
                )
              : BorderSide.none,
          bottom: showBottomBorder
              ? BorderSide(
                  color: const Color(0xFF26CE92).withOpacity(0.3),
                  width: 1,
                )
              : BorderSide.none,
        ),
      ),
      child: Column(
        children: [
          // Icon
          FaIcon(
            icon,
            color: const Color(0xFF26CE92),
            size: isDesktop ? 48.0 : (isTablet ? 42.0 : 38.0),
          ),

          Hbox(isDesktop ? 24.0 : 20.0),

          // Title
          AppText(
            title,
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0),
              color: Colors.black,
            ),
          ),

          Hbox(isDesktop ? 16.0 : 12.0),

          // Description
          AppText(
            description,
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
