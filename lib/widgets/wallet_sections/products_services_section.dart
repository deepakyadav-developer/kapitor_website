import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class ProductsServicesSection extends StatelessWidget {
  const ProductsServicesSection({Key? key}) : super(key: key);

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
              // Section Title
              AppText(
                'Products & Services On Kapitor Payments',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                  color: const Color(0xFF1A1A1A),
                ),
              ),

              Hbox(isDesktop ? 60.0 : (isTablet ? 50.0 : 40.0)),

              // Services Grid
              if (isMobile)
                _buildMobileGrid()
              else
                _buildDesktopGrid(isDesktop, isTablet),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopGrid(bool isDesktop, bool isTablet) {
    return Column(
      children: [
        // Row 1
        Row(
          children: [
            Expanded(
              child: _ServiceCard(
                icon: FontAwesomeIcons.moneyBillTransfer,
                iconColor: const Color(0xFFFFC107),
                iconBgColor: const Color(0xFFFFF8E1),
                title: 'Send Money',
                description:
                    'Instant USDT transfers globally without SWIFT delays or banking intermediaries. Send money anywhere, anytime.',
                isDesktop: isDesktop,
                isTablet: isTablet,
              ),
            ),
            Wbox(isDesktop ? 24.0 : 16.0),
            Expanded(
              child: _ServiceCard(
                icon: FontAwesomeIcons.wallet,
                iconColor: const Color(0xFFFF5722),
                iconBgColor: const Color(0xFFFFE5DB),
                title: 'Cash Out',
                description:
                    'Crypto-to-fiat off-ramping with instant settlement to bank accounts. Convert USDT to local currency seamlessly.',
                isDesktop: isDesktop,
                isTablet: isTablet,
              ),
            ),
            Wbox(isDesktop ? 24.0 : 16.0),
            Expanded(
              child: _ServiceCard(
                icon: FontAwesomeIcons.creditCard,
                iconColor: const Color(0xFF00ACC1),
                iconBgColor: const Color(0xFFE0F7FA),
                title: 'Make Payment',
                description:
                    'Universal QR payments accepted by merchants worldwide using USDT. Pay instantly with zero friction.',
                isDesktop: isDesktop,
                isTablet: isTablet,
              ),
            ),
          ],
        ),

        Hbox(isDesktop ? 24.0 : 16.0),

        // Row 2
        Row(
          children: [
            Expanded(
              child: _ServiceCard(
                icon: FontAwesomeIcons.fileInvoiceDollar,
                iconColor: const Color(0xFF8BC34A),
                iconBgColor: const Color(0xFFF1F8E9),
                title: 'Pay Bill',
                description:
                    'Settle electricity, water, gas, mobile, broadband, FASTag, and EMIs using USDT. All bills, one platform.',
                isDesktop: isDesktop,
                isTablet: isTablet,
              ),
            ),
            Wbox(isDesktop ? 24.0 : 16.0),
            Expanded(
              child: _ServiceCard(
                icon: FontAwesomeIcons.mobileScreen,
                iconColor: const Color(0xFF2196F3),
                iconBgColor: const Color(0xFFE3F2FD),
                title: 'Mobile Recharge',
                description:
                    'Instant mobile prepaid/postpaid recharges with USDT settlement. Top up any carrier, anywhere in the world.',
                isDesktop: isDesktop,
                isTablet: isTablet,
              ),
            ),
            Wbox(isDesktop ? 24.0 : 16.0),
            Expanded(
              child: _ServiceCard(
                icon: FontAwesomeIcons.circlePlus,
                iconColor: const Color(0xFF673AB7),
                iconBgColor: const Color(0xFFEDE7F6),
                title: 'Add Money',
                description:
                    'Deposit USDT from any wallet or exchange instantly. Fund your Kapitor account with zero delays.',
                isDesktop: isDesktop,
                isTablet: isTablet,
              ),
            ),
          ],
        ),

        Hbox(isDesktop ? 24.0 : 16.0),

        // Row 3
        Row(
          children: [
            Expanded(
              child: _ServiceCard(
                icon: FontAwesomeIcons.moneyBillTransfer,
                iconColor: const Color(0xFFC62828),
                iconBgColor: const Color(0xFFFFEBEE),
                title: 'Transfer Money',
                description:
                    'Cross-border P2P transfers without currency restrictions. Move money globally with complete freedom.',
                isDesktop: isDesktop,
                isTablet: isTablet,
              ),
            ),
            Wbox(isDesktop ? 24.0 : 16.0),
            Expanded(
              child: _ServiceCard(
                icon: FontAwesomeIcons.shieldHalved,
                iconColor: const Color(0xFFE91E63),
                iconBgColor: const Color(0xFFFCE4EC),
                title: 'Insurance',
                description:
                    'Pay insurance premiums directly using stablecoins. Life, health, vehicle - all covered with USDT.',
                isDesktop: isDesktop,
                isTablet: isTablet,
              ),
            ),
            Wbox(isDesktop ? 24.0 : 16.0),
            Expanded(
              child: _ServiceCard(
                icon: FontAwesomeIcons.piggyBank,
                iconColor: const Color(0xFF03A9F4),
                iconBgColor: const Color(0xFFE1F5FE),
                title: 'Savings',
                description:
                    'Earn daily APY on USDT deposits in insured vaults. Your money works for you 24/7 with guaranteed returns.',
                isDesktop: isDesktop,
                isTablet: isTablet,
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
        _ServiceCard(
          icon: FontAwesomeIcons.moneyBillTransfer,
          iconColor: const Color(0xFFFFC107),
          iconBgColor: const Color(0xFFFFF8E1),
          title: 'Send Money',
          description:
              'Instant USDT transfers globally without SWIFT delays or banking intermediaries. Send money anywhere, anytime.',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _ServiceCard(
          icon: FontAwesomeIcons.wallet,
          iconColor: const Color(0xFFFF5722),
          iconBgColor: const Color(0xFFFFE5DB),
          title: 'Cash Out',
          description:
              'Crypto-to-fiat off-ramping with instant settlement to bank accounts. Convert USDT to local currency seamlessly.',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _ServiceCard(
          icon: FontAwesomeIcons.creditCard,
          iconColor: const Color(0xFF00ACC1),
          iconBgColor: const Color(0xFFE0F7FA),
          title: 'Make Payment',
          description:
              'Universal QR payments accepted by merchants worldwide using USDT. Pay instantly with zero friction.',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _ServiceCard(
          icon: FontAwesomeIcons.fileInvoiceDollar,
          iconColor: const Color(0xFF8BC34A),
          iconBgColor: const Color(0xFFF1F8E9),
          title: 'Pay Bill',
          description:
              'Settle electricity, water, gas, mobile, broadband, FASTag, and EMIs using USDT. All bills, one platform.',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _ServiceCard(
          icon: FontAwesomeIcons.mobileScreen,
          iconColor: const Color(0xFF2196F3),
          iconBgColor: const Color(0xFFE3F2FD),
          title: 'Mobile Recharge',
          description:
              'Instant mobile prepaid/postpaid recharges with USDT settlement. Top up any carrier, anywhere in the world.',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _ServiceCard(
          icon: FontAwesomeIcons.circlePlus,
          iconColor: const Color(0xFF673AB7),
          iconBgColor: const Color(0xFFEDE7F6),
          title: 'Add Money',
          description:
              'Deposit USDT from any wallet or exchange instantly. Fund your Kapitor account with zero delays.',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _ServiceCard(
          icon: FontAwesomeIcons.moneyBillTransfer,
          iconColor: const Color(0xFFC62828),
          iconBgColor: const Color(0xFFFFEBEE),
          title: 'Transfer Money',
          description:
              'Cross-border P2P transfers without currency restrictions. Move money globally with complete freedom.',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _ServiceCard(
          icon: FontAwesomeIcons.shieldHalved,
          iconColor: const Color(0xFFE91E63),
          iconBgColor: const Color(0xFFFCE4EC),
          title: 'Insurance',
          description:
              'Pay insurance premiums directly using stablecoins. Life, health, vehicle - all covered with USDT.',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _ServiceCard(
          icon: FontAwesomeIcons.piggyBank,
          iconColor: const Color(0xFF03A9F4),
          iconBgColor: const Color(0xFFE1F5FE),
          title: 'Savings',
          description:
              'Earn daily APY on USDT deposits in insured vaults. Your money works for you 24/7 with guaranteed returns.',
          isDesktop: false,
          isTablet: false,
        ),
      ],
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String description;
  final bool isDesktop;
  final bool isTablet;

  const _ServiceCard({
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.description,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 24.0 : (isTablet ? 20.0 : 16.0)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Container
          Container(
            width: isDesktop ? 56.0 : (isTablet ? 50.0 : 48.0),
            height: isDesktop ? 56.0 : (isTablet ? 50.0 : 48.0),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: FaIcon(
                icon,
                color: iconColor,
                size: isDesktop ? 28.0 : (isTablet ? 24.0 : 22.0),
              ),
            ),
          ),

          Wbox(isDesktop ? 16.0 : 12.0),

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  style: Ts.bold(
                    size: isDesktop ? 18.0 : (isTablet ? 16.0 : 15.0),
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
                Hbox(8.0),
                AppText(
                  description,
                  style: Ts.regular(
                    size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
                    color: Colors.grey.shade600,
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
