import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Terms and Conditions Content Section
class TermsContentSection extends StatelessWidget {
  const TermsContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: isDesktop || isTablet
          ? _buildDesktopLayout(isDesktop)
          : _buildMobileLayout(),
    );
  }

  Widget _buildDesktopLayout(bool isLarge) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: _buildLeftColumn(isLarge)),
        Wbox(isLarge ? 80 : 60),
        Expanded(flex: 1, child: _buildRightColumn(isLarge)),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildLeftColumn(false), Hbox(40), _buildRightColumn(false)],
    );
  }

  Widget _buildLeftColumn(bool isLarge) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Title
        AppText(
          'Terms and Conditions.',
          style: Ts.bold(size: isLarge ? 48 : 32, color: Colors.black),
        ),
        Hbox(isLarge ? 24 : 20),
        // Introduction
        AppText(
          'Welcome to [Your Company Name]. Before using our logo design service, please carefully review the following Terms and Conditions, as they govern the contractual relationship between you (the "Client") and [Your Company Name] (the "Service Provider"). By using our logo design service, you acknowledge that you have read, understood, and agreed to these Terms and Conditions in their entirety.',
          style: Ts.regular(
            size: isLarge ? 14 : 13,
            color: Colors.black.withValues(alpha: 0.6),
          ).copyWith(height: 1.8),
        ),
        Hbox(isLarge ? 48 : 40),
        // Scope of Service
        _buildSection(
          title: 'Scope of Service',
          content: [
            'a. [Your Company Name] will provide custom logo design services to the Client based on the specifications provided by the Client.',
            '',
            'b. The Service Provider will deliver the final logo design in the agreed-upon format upon completion and full payment of the service fee.',
          ],
          isLarge: isLarge,
        ),
        Hbox(isLarge ? 48 : 40),
        // Copyright and Ownership
        _buildSection(
          title: 'Copyright and Ownership',
          content: [
            'a. The Client acknowledges that all rights, title, and ownership of the final logo design will belong solely to the Client after full payment has been received by the Service Provider.',
            '',
            'b. Final payment ensures that only the agreed design becomes the client\'s property. Any previous ideas/concepts remain the property of The Service Provider, unless any prior agreement has been made.',
            '',
            'c. The Service Provider reserves the right to showcase the completed logo design in their portfolio or promotional materials.',
          ],
          isLarge: isLarge,
        ),
      ],
    );
  }

  Widget _buildRightColumn(bool isLarge) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Design Process
        _buildSection(
          title: 'Design Process',
          content: [
            'a. The Client will provide clear and detailed design brief and specifications for the logo design.',
            '',
            'b. The Service Provider will create initial logo concepts based on the provided brief.',
            '',
            'c. The Client may request revisions to the chosen logo concept, within the limits specified in the service package.',
            '',
            'd. Additional revisions beyond the specified limit may incur extra charges, subject to mutual agreement.',
          ],
          isLarge: isLarge,
        ),
        Hbox(isLarge ? 48 : 40),
        // Delivery
        _buildSection(
          title: 'Delivery',
          content: [
            'a. The final logo design will be delivered to the Client in a digital format as specified in the service package.',
            '',
            'b. The Service Provider will make reasonable efforts to meet agreed-upon delivery deadlines. However, delays may occur due to unforeseen circumstances, and the Service Provider shall not be held liable for such delays.',
          ],
          isLarge: isLarge,
        ),
        Hbox(isLarge ? 48 : 40),
        // Payment and Fees
        _buildSection(
          title: 'Payment and Fees',
          content: [
            'a. The Client shall pay the agreed-upon service fee as specified in the service package before the commencement of the logo design process.',
            '',
            'b. Payments shall be made through the designated payment methods provided by the Service Provider.',
            '',
            'c. If additional services or revisions are requested beyond the original scope, the Service Provider will communicate any additional fees before proceeding.',
          ],
          isLarge: isLarge,
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required List<String> content,
    required bool isLarge,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_forward,
              size: isLarge ? 20 : 18,
              color: Colors.black,
            ),
            Wbox(12),
            Expanded(
              child: AppText(
                title,
                style: Ts.bold(size: isLarge ? 20 : 18, color: Colors.black),
              ),
            ),
          ],
        ),
        Hbox(isLarge ? 16 : 14),
        ...content.map((text) {
          if (text.isEmpty) {
            return Hbox(8);
          }
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AppText(
              text,
              style: Ts.regular(
                size: isLarge ? 13 : 12,
                color: Colors.black.withValues(alpha: 0.7),
              ).copyWith(height: 1.7),
            ),
          );
        }),
      ],
    );
  }
}
