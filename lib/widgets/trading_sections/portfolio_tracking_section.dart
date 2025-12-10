import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class PortfolioTrackingSection extends StatelessWidget {
  const PortfolioTrackingSection({Key? key}) : super(key: key);

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

        return Column(
          children: [
            // Company Logos Section
            Container(
              width: double.infinity,
              color: const Color(0xFF1E3A5F),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isDesktop ? 32.0 : (isTablet ? 28.0 : 24.0),
              ),
              child: _buildCompanyLogos(isDesktop, isTablet, isMobile),
            ),

            // Portfolio Tracking Section
            Container(
              width: double.infinity,
              color: const Color(0xFFF8F9FA),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: isDesktop ? 80.0 : (isTablet ? 60.0 : 40.0),
              ),
              child: Column(
                children: [
                  // Title
                  AppText(
                    'Automated portfolio tracking',
                    textAlign: TextAlign.center,
                    style: Ts.bold(
                      size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                      color: Colors.black,
                    ),
                  ),

                  Hbox(isDesktop ? 16.0 : 12.0),

                  // Description
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: isDesktop ? 800 : double.infinity,
                    ),
                    child: AppText(
                      'Connect all your wallets and exchanges to track your entire crypto portfolio in real-time. Get comprehensive analytics, performance insights, and tax reports automatically.',
                      textAlign: TextAlign.center,
                      style: Ts.regular(
                        size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),

                  Hbox(isDesktop ? 60.0 : (isTablet ? 50.0 : 40.0)),

                  // Feature Cards
                  if (isMobile)
                    _buildMobileCards()
                  else
                    _buildDesktopCards(isDesktop, isTablet),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCompanyLogos(bool isDesktop, bool isTablet, bool isMobile) {
    final companies = [
      CompanyData(name: 'Waverio', icon: FontAwesomeIcons.water),
      CompanyData(name: 'LOGOIPSUM', icon: FontAwesomeIcons.cube),
      CompanyData(name: 'Alterbone', icon: FontAwesomeIcons.chartLine),
      CompanyData(name: 'Ridoria', icon: FontAwesomeIcons.gear),
      CompanyData(name: 'Tinygone', icon: FontAwesomeIcons.plane),
    ];

    if (isMobile) {
      return Wrap(
        alignment: WrapAlignment.center,
        spacing: 24.0,
        runSpacing: 24.0,
        children: companies.map((company) {
          return _CompanyLogo(
            company: company,
            isDesktop: false,
            isTablet: false,
          );
        }).toList(),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: companies.map((company) {
        return _CompanyLogo(
          company: company,
          isDesktop: isDesktop,
          isTablet: isTablet,
        );
      }).toList(),
    );
  }

  Widget _buildDesktopCards(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _FeatureCard(
            number: '01',
            icon: FontAwesomeIcons.wallet,
            title: 'Connect wallet &\nexchanges',
            description: '',
            isDesktop: isDesktop,
            isTablet: isTablet,
          ),
        ),
        Wbox(isDesktop ? 24.0 : 16.0),
        Expanded(
          child: _FeatureCard(
            number: '02',
            icon: FontAwesomeIcons.eye,
            title: 'Track portfolio\nperformance',
            description: '',
            isDesktop: isDesktop,
            isTablet: isTablet,
          ),
        ),
        Wbox(isDesktop ? 24.0 : 16.0),
        Expanded(
          child: _FeatureCard(
            number: '03',
            icon: FontAwesomeIcons.fileLines,
            title: 'Generate tax\nreports',
            description: '',
            isDesktop: isDesktop,
            isTablet: isTablet,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileCards() {
    return Column(
      children: [
        _FeatureCard(
          number: '01',
          icon: FontAwesomeIcons.wallet,
          title: 'Connect wallet &\nexchanges',
          description: '',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _FeatureCard(
          number: '02',
          icon: FontAwesomeIcons.eye,
          title: 'Track portfolio\nperformance',
          description: '',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _FeatureCard(
          number: '03',
          icon: FontAwesomeIcons.fileLines,
          title: 'Generate tax\nreports',
          description: '',
          isDesktop: false,
          isTablet: false,
        ),
      ],
    );
  }
}

class _CompanyLogo extends StatelessWidget {
  final CompanyData company;
  final bool isDesktop;
  final bool isTablet;

  const _CompanyLogo({
    required this.company,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          company.icon,
          color: Colors.white.withOpacity(0.8),
          size: isDesktop ? 28.0 : (isTablet ? 24.0 : 20.0),
        ),
        Wbox(12.0),
        AppText(
          company.name,
          style: Ts.semiBold(
            size: isDesktop ? 18.0 : (isTablet ? 16.0 : 14.0),
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String number;
  final IconData icon;
  final String title;
  final String description;
  final bool isDesktop;
  final bool isTablet;

  const _FeatureCard({
    required this.number,
    required this.icon,
    required this.title,
    required this.description,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 32.0 : (isTablet ? 28.0 : 24.0)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: const Color(0xFF26CE92).withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Number
          AppText(
            number,
            style: Ts.bold(
              size: isDesktop ? 32.0 : (isTablet ? 28.0 : 24.0),
              color: Colors.grey.shade400,
            ),
          ),

          Hbox(isDesktop ? 32.0 : 24.0),

          // Icon
          Container(
            width: isDesktop ? 80.0 : (isTablet ? 70.0 : 60.0),
            height: isDesktop ? 80.0 : (isTablet ? 70.0 : 60.0),
            decoration: BoxDecoration(
              color: const Color(0xFF26CE92).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: FaIcon(
                icon,
                color: const Color(0xFF26CE92),
                size: isDesktop ? 40.0 : (isTablet ? 35.0 : 30.0),
              ),
            ),
          ),

          Hbox(isDesktop ? 32.0 : 24.0),

          // Title
          AppText(
            title,
            style: Ts.bold(
              size: isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0),
              color: Colors.black,
            ),
          ),

          if (description.isNotEmpty) ...[
            Hbox(12.0),
            AppText(
              description,
              style: Ts.regular(
                size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class CompanyData {
  final String name;
  final IconData icon;

  CompanyData({required this.name, required this.icon});
}
