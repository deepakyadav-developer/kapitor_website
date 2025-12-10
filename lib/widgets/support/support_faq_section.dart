import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Support FAQ Section - Recreated to match exact UI
class SupportFaqSection extends StatefulWidget {
  const SupportFaqSection({super.key});

  @override
  State<SupportFaqSection> createState() => _SupportFaqSectionState();
}

class _SupportFaqSectionState extends State<SupportFaqSection> {
  String _selectedCategory = 'Cards';
  int? _expandedIndex;

  final Map<String, List<Map<String, String>>> _faqData = {
    'Cards': [
      {
        'question': 'How to setup my card?',
        'answer':
            'To setup your Kapitor card, go to the Cards section in your app, select "Add Card", complete the verification process, and your virtual card will be instantly activated. For physical cards, follow the activation instructions sent with your card.',
      },
      {
        'question': 'How do I create a virtual card?',
        'answer':
            'Creating a virtual card is simple. Navigate to Cards > Create Virtual Card, choose your card design, set spending limits if needed, and your virtual card will be ready to use immediately for online purchases.',
      },
      {
        'question': 'How to order an extra card?',
        'answer':
            'You can order additional cards from the Cards section. Click "Order New Card", select physical or virtual, customize your preferences, and complete the order. Physical cards are delivered within 5-7 business days.',
      },
      {
        'question': 'My card will exprise soon. What to do?',
        'answer':
            'When your card is nearing expiration, we automatically send you a replacement card 30 days before expiry. You can also request a new card anytime from the Cards section. Your card number remains the same, only the expiry date and CVV change.',
      },
      {
        'question': 'How do I freeze my card?',
        'answer':
            'To freeze your card instantly, go to Cards, select the card you want to freeze, and tap the "Freeze Card" button. This temporarily blocks all transactions. You can unfreeze it anytime from the same menu.',
      },
    ],
    'Account': [
      {
        'question': 'How do I verify my account?',
        'answer':
            'Account verification requires completing KYC (Know Your Customer). Upload a government-issued ID, take a selfie for facial verification, and provide proof of address. Verification typically completes within 24 hours.',
      },
      {
        'question': 'How to upgrade my account?',
        'answer':
            'To upgrade your account tier, go to Settings > Account > Upgrade. Higher tiers offer increased transaction limits, lower fees, and premium features. Upgrade requirements vary by tier and may require additional verification.',
      },
      {
        'question': 'Can I have multiple accounts?',
        'answer':
            'Kapitor allows one primary account per user for regulatory compliance. However, you can create multiple sub-accounts or wallets within your main account for different purposes like savings, trading, or business expenses.',
      },
      {
        'question': 'How do I change my account details?',
        'answer':
            'Update your account details in Settings > Profile. You can change your email, phone number, and address. Some changes may require re-verification for security purposes.',
      },
      {
        'question': 'What if I forget my password?',
        'answer':
            'Click "Forgot Password" on the login screen, enter your registered email or phone number, and follow the reset instructions sent to you. For added security, you may need to verify your identity through 2FA.',
      },
    ],
    'Personal Details': [
      {
        'question': 'How do I update my personal information?',
        'answer':
            'Navigate to Settings > Personal Details to update your name, date of birth, address, and contact information. Changes to sensitive information may require document verification.',
      },
      {
        'question': 'Is my personal data secure?',
        'answer':
            'Yes, Kapitor uses bank-grade encryption to protect your personal data. We comply with GDPR and other data protection regulations. Your information is never shared with third parties without your consent.',
      },
      {
        'question': 'Can I delete my personal data?',
        'answer':
            'You have the right to request deletion of your personal data. Go to Settings > Privacy > Delete My Data. Note that some information may be retained for regulatory compliance even after account closure.',
      },
      {
        'question': 'How do I change my profile picture?',
        'answer':
            'Go to Settings > Profile > Edit Profile Picture. You can upload a new photo from your device or take a new one. Profile pictures help personalize your account and are visible in transaction receipts.',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      color: const Color(0xFFFAFAFA),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: isMobile
          ? _buildMobileLayout()
          : _buildDesktopLayout(isDesktop, isTablet),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildCategorySelector(false),
        Hbox(32),
        _buildQuestionsList(false),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: isDesktop ? 230 : 200,
          child: _buildCategories(isDesktop),
        ),
        Wbox(isDesktop ? 80 : 60),
        Expanded(child: _buildQuestionsList(isDesktop)),
      ],
    );
  }

  Widget _buildCategories(bool isLarge) {
    return Container(
      padding: EdgeInsets.all(isLarge ? 24 : 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'Categories',
            style: Ts.bold(
              size: isLarge ? 20 : 18,
              color: const Color(0xFF2C3E50),
            ),
          ),
          Hbox(32),
          ..._faqData.keys.map((category) {
            final isSelected = _selectedCategory == category;
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                      _expandedIndex = null;
                    });
                  },
                  child: AppText(
                    category,
                    style: Ts.medium(
                      size: isLarge ? 16 : 15,
                      color: isSelected
                          ? const Color(0xFF2C3E50)
                          : const Color(0xFFB0B0B0),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildCategorySelector(bool isLarge) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: DropdownButton<String>(
        value: _selectedCategory,
        isExpanded: true,
        underline: const SizedBox(),
        icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF2C3E50)),
        items: _faqData.keys.map((category) {
          return DropdownMenuItem(
            value: category,
            child: AppText(
              category,
              style: Ts.medium(size: 15, color: const Color(0xFF2C3E50)),
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedCategory = value;
              _expandedIndex = null;
            });
          }
        },
      ),
    );
  }

  Widget _buildQuestionsList(bool isLarge) {
    final questions = _faqData[_selectedCategory] ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Header with Icon
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF4DB8A4).withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getCategoryIcon(_selectedCategory),
                size: isLarge ? 28 : 24,
                color: const Color(0xFF4DB8A4),
              ),
            ),
            Wbox(16),
            Expanded(
              child: AppText(
                _selectedCategory,
                style: Ts.bold(
                  size: isLarge ? 28 : 24,
                  color: const Color(0xFF2C3E50),
                ),
              ),
            ),
          ],
        ),
        Hbox(40),
        // Questions List
        ...List.generate(questions.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildQuestionItem(
              questions[index]['question']!,
              questions[index]['answer']!,
              index,
              isLarge,
            ),
          );
        }),
      ],
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Cards':
        return Icons.credit_card;
      case 'Account':
        return Icons.account_circle_outlined;
      case 'Personal Details':
        return Icons.person_outline;
      default:
        return Icons.help_outline;
    }
  }

  Widget _buildQuestionItem(
    String question,
    String answer,
    int index,
    bool isLarge,
  ) {
    final isExpanded = _expandedIndex == index;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE8E8E8), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _expandedIndex = isExpanded ? null : index;
              });
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: EdgeInsets.all(isLarge ? 24 : 20),
              child: Row(
                children: [
                  Expanded(
                    child: AppText(
                      question,
                      style: Ts.semiBold(
                        size: isLarge ? 17 : 16,
                        color: const Color(0xFF2C3E50),
                      ),
                    ),
                  ),
                  Wbox(16),
                  Container(
                    width: isLarge ? 32 : 28,
                    height: isLarge ? 32 : 28,
                    decoration: BoxDecoration(
                      color: isExpanded
                          ? const Color(0xFF4DB8A4).withValues(alpha: 0.1)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isExpanded ? Icons.close : Icons.add,
                      size: isLarge ? 20 : 18,
                      color: isExpanded
                          ? const Color(0xFF4DB8A4)
                          : const Color(0xFFB0B0B0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isExpanded
                ? Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(
                      isLarge ? 24 : 20,
                      0,
                      isLarge ? 24 : 20,
                      isLarge ? 24 : 20,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xFFF0F0F0), width: 1),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AppText(
                        answer,
                        style: Ts.regular(
                          size: isLarge ? 15 : 14,
                          color: const Color(0xFF6B7280),
                        ).copyWith(height: 1.7),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
