import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/size.dart';

class AllInOneAppSection extends StatelessWidget {
  const AllInOneAppSection({super.key});

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
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF26A69A), // Teal-green background
              borderRadius: BorderRadius.circular(24.0),
            ),
            padding: EdgeInsets.all(
              isDesktop ? 60.0 : (isTablet ? 40.0 : 24.0),
            ),
            child: isMobile
                ? _buildMobileLayout()
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left Side - Content
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Main Heading
                            Text(
                              'Get the Kapitor App',
                              style: TextStyle(
                                fontSize: isDesktop
                                    ? 42.0
                                    : (isTablet ? 32.0 : 28.0),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),

                            Hbox(isDesktop ? 24.0 : 16.0),

                            // Description
                            Text(
                              'Your global financial world starts here. Download Kapitor and access banking, investing, trading, and high-yield opportunities — all from one secure platform.',
                              style: TextStyle(
                                fontSize: isDesktop
                                    ? 16.0
                                    : (isTablet ? 15.0 : 14.0),
                                fontWeight: FontWeight.normal,
                                color: Colors.white.withValues(alpha: 0.95),
                                height: 1.6,
                              ),
                            ),

                            Hbox(isDesktop ? 40.0 : 32.0),

                            // Features List
                            Column(
                              children: [
                                _buildFeatureItem(
                                  title: 'Global payments & yields',
                                  isDesktop: isDesktop,
                                  isTablet: isTablet,
                                ),
                                Hbox(isDesktop ? 20.0 : 16.0),
                                _buildFeatureItem(
                                  title: 'Tokenized asset markets',
                                  isDesktop: isDesktop,
                                  isTablet: isTablet,
                                ),
                                Hbox(isDesktop ? 20.0 : 16.0),
                                _buildFeatureItem(
                                  title: 'Institutional-grade security',
                                  isDesktop: isDesktop,
                                  isTablet: isTablet,
                                ),
                                Hbox(isDesktop ? 20.0 : 16.0),
                                _buildFeatureItem(
                                  title: 'AI-driven wealth optimization',
                                  isDesktop: isDesktop,
                                  isTablet: isTablet,
                                ),
                              ],
                            ),

                            Hbox(isDesktop ? 40.0 : 32.0),

                            // App Store Buttons
                            Row(
                              children: [
                                _buildAppStoreButton(
                                  icon: Icons.apple,
                                  text: 'App Store',
                                  isDesktop: isDesktop,
                                ),
                                Wbox(isDesktop ? 16.0 : 12.0),
                                _buildGooglePlayButton(isDesktop: isDesktop),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Wbox(isDesktop ? 40.0 : 30.0),

                      // Right Side - App Image
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: FractionallySizedBox(
                            widthFactor: 0.7,
                            child: Image.asset(
                              'assets/images/app.png',
                              fit: BoxFit.contain,
                              alignment: Alignment.bottomCenter,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 350,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.phone_iphone,
                                      size: 100,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  Widget _buildFeatureItem({
    required String title,
    required bool isDesktop,
    required bool isTablet,
  }) {
    final iconSize = isDesktop ? 24.0 : (isTablet ? 22.0 : 20.0);
    final titleSize = isDesktop ? 18.0 : (isTablet ? 17.0 : 16.0);

    return Row(
      children: [
        Container(
          width: iconSize,
          height: iconSize,
          decoration: const BoxDecoration(
            color: Color(0xFF81C784), // Light green circle
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 16),
        ),
        Wbox(isDesktop ? 12.0 : 10.0),
        Text(
          title,
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildAppStoreButton({
    required IconData icon,
    required String text,
    required bool isDesktop,
  }) {
    return Container(
      height: isDesktop ? 50.0 : 44.0,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 20.0 : 16.0,
        vertical: isDesktop ? 12.0 : 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: isDesktop ? 24.0 : 20.0, color: Colors.black),
          Wbox(isDesktop ? 8.0 : 6.0),
          Text(
            text,
            style: TextStyle(
              fontSize: isDesktop ? 14.0 : 12.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGooglePlayButton({required bool isDesktop}) {
    return Container(
      height: isDesktop ? 50.0 : 44.0,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 20.0 : 16.0,
        vertical: isDesktop ? 12.0 : 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.play_arrow,
            size: isDesktop ? 24.0 : 20.0,
            color: Colors.black,
          ),
          Wbox(isDesktop ? 8.0 : 6.0),
          Text(
            'Google Play',
            style: TextStyle(
              fontSize: isDesktop ? 14.0 : 12.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneMockup(bool isDesktop, bool isTablet) {
    return Center(
      child: Container(
        width: isDesktop ? 300.0 : (isTablet ? 250.0 : 200.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              // Phone Screen Content
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Current Balance
                        Text(
                          'Current balance',
                          style: TextStyle(
                            fontSize: isDesktop ? 14.0 : 12.0,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Hbox(4.0),
                        Text(
                          '\$ 4.658,50',
                          style: TextStyle(
                            fontSize: isDesktop ? 28.0 : 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),

                        Hbox(20.0),

                        // Credit Card
                        Container(
                          height: isDesktop ? 180.0 : 160.0,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'banquee.',
                                    style: TextStyle(
                                      fontSize: isDesktop ? 16.0 : 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.wifi,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                '1234 5678 9000 0000',
                                style: TextStyle(
                                  fontSize: isDesktop ? 18.0 : 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                ),
                              ),
                              Hbox(12.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Card Holder',
                                        style: TextStyle(
                                          fontSize: isDesktop ? 10.0 : 9.0,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      Text(
                                        'John Doe',
                                        style: TextStyle(
                                          fontSize: isDesktop ? 12.0 : 11.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Expiry Date',
                                        style: TextStyle(
                                          fontSize: isDesktop ? 10.0 : 9.0,
                                          color: Colors.grey.shade400,
                                        ),
                                      ),
                                      Text(
                                        '09/28',
                                        style: TextStyle(
                                          fontSize: isDesktop ? 12.0 : 11.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      'VISA',
                                      style: TextStyle(
                                        fontSize: isDesktop ? 12.0 : 10.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Hbox(20.0),

                        // Send/Receive Money
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildActionButton(
                              Icons.person,
                              'Send Money',
                              isDesktop,
                            ),
                            _buildActionButton(
                              Icons.person_outline,
                              'Receive Money',
                              isDesktop,
                            ),
                          ],
                        ),

                        Hbox(20.0),

                        // Transactions
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transactions',
                              style: TextStyle(
                                fontSize: isDesktop ? 16.0 : 14.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'View all →',
                              style: TextStyle(
                                fontSize: isDesktop ? 14.0 : 12.0,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),

                        Hbox(12.0),

                        // Transaction Item
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.apple,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            Wbox(12.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Apple Electronic',
                                    style: TextStyle(
                                      fontSize: isDesktop ? 14.0 : 12.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              '-\$799',
                              style: TextStyle(
                                fontSize: isDesktop ? 14.0 : 12.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, bool isDesktop) {
    return Column(
      children: [
        Container(
          width: isDesktop ? 60.0 : 50.0,
          height: isDesktop ? 60.0 : 50.0,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.grey.shade700),
        ),
        Hbox(8.0),
        Text(
          label,
          style: TextStyle(
            fontSize: isDesktop ? 12.0 : 10.0,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Phone Mockup with fixed height
        SizedBox(height: 500.0, child: _buildPhoneMockup(false, false)),

        Hbox(40.0),

        // Main Heading
        Text(
          'Get the Kapitor App',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            height: 1.2,
          ),
        ),

        Hbox(16.0),

        // Description
        Text(
          'Your global financial world starts here. Download Kapitor and access banking, investing, trading, and high-yield opportunities — all from one secure platform.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.white.withValues(alpha: 0.95),
            height: 1.6,
          ),
        ),

        Hbox(32.0),

        // Features List
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildFeatureItem(
              title: 'Global payments & yields',
              isDesktop: false,
              isTablet: false,
            ),
            Hbox(16.0),
            _buildFeatureItem(
              title: 'Tokenized asset markets',
              isDesktop: false,
              isTablet: false,
            ),
            Hbox(16.0),
            _buildFeatureItem(
              title: 'Institutional-grade security',
              isDesktop: false,
              isTablet: false,
            ),
            Hbox(16.0),
            _buildFeatureItem(
              title: 'AI-driven wealth optimization',
              isDesktop: false,
              isTablet: false,
            ),
          ],
        ),

        Hbox(32.0),

        // App Store Buttons
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: _buildAppStoreButton(
                icon: Icons.apple,
                text: 'App Store',
                isDesktop: false,
              ),
            ),
            Hbox(12.0),
            SizedBox(
              width: double.infinity,
              child: _buildGooglePlayButton(isDesktop: false),
            ),
          ],
        ),
      ],
    );
  }
}
