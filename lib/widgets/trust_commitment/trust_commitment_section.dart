import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';

class TrustCard extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String description;

  const TrustCard({
    Key? key,
    required this.iconData,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<TrustCard> createState() => _TrustCardState();
}

class _TrustCardState extends State<TrustCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 350;
        final isMedium = constraints.maxWidth >= 350 && constraints.maxWidth < 500;
        
        final iconSize = isSmall ? 36.0 : (isMedium ? 42.0 : 48.0);
        final borderRadius = isSmall ? 12.0 : (isMedium ? 16.0 : 20.0);
        final padding = isSmall ? 12.0 : (isMedium ? 16.0 : 20.0);
        final titleSize = isSmall ? 16.0 : (isMedium ? 18.0 : 20.0);
        final descSize = isSmall ? 12.0 : (isMedium ? 13.0 : 14.0);
        final spacing1 = isSmall ? 12.0 : (isMedium ? 16.0 : 20.0);
        final spacing2 = isSmall ? 8.0 : (isMedium ? 12.0 : 16.0);

        return MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20,
                        spreadRadius: 0,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : [],
            ),
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: iconSize,
                  height: iconSize,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDD835),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(iconSize * 0.25),
                  child: Icon(
                    widget.iconData,
                    color: Colors.white,
                    size: iconSize * 0.5,
                  ),
                ),
                SizedBox(height: spacing1),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.w600,
                    color: AppColor.black,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: spacing2),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: descSize,
                    color: AppColor.textcolor.withOpacity(0.8),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TrustCommitmentSection extends StatelessWidget {
  const TrustCommitmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;
        
        final horizontalPadding = isDesktop 
            ? constraints.maxWidth * 0.08 
            : (isTablet ? 24.0 : 16.0);
        final verticalPadding = isDesktop ? 80.0 : (isTablet ? 60.0 : 40.0);
        
        if (isMobile) {
          return _buildMobileLayout(horizontalPadding, verticalPadding);
        }
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Our strategies button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.blue.shade300,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Our strategies',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: isDesktop ? 32.0 : 24.0),
              
              // Main Heading
              Text(
                'Our Commitment to Your Trust',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isDesktop ? 48.0 : (isTablet ? 36.0 : 32.0),
                  fontWeight: FontWeight.bold,
                  color: AppColor.black,
                  height: 1.2,
                ),
              ),
              
              SizedBox(height: isDesktop ? 24.0 : 16.0),
              
              // Description
              SizedBox(
                width: isDesktop ? 900 : double.infinity,
                child: Text(
                  'Trust is not earned through promises—it is earned through performance and verifiable data. We believe you deserve complete visibility into the security, solvency, and operational health of our platform.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: isDesktop ? 18.0 : (isTablet ? 16.0 : 14.0),
                    fontWeight: FontWeight.normal,
                    color: AppColor.textcolor,
                    height: 1.6,
                  ),
                ),
              ),
              
              SizedBox(height: isDesktop ? 60.0 : 40.0),
              
              // Top Row - Two cards side by side
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Live Reserves Card
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: isDesktop ? 12.0 : 8.0),
                      child: TrustCard(
                        iconData: Icons.description,
                        title: 'Live Reserves',
                        description:
                            'Harness the unmatched power of artificial intelligence with Neuros. Dive deep into predictive analytics, anticipate market trend...',
                      ),
                    ),
                  ),
                  
                  // Insurance Protection Card
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: isDesktop ? 12.0 : 8.0),
                      child: TrustCard(
                        iconData: Icons.link,
                        title: 'Insurance Protection',
                        description:
                            'Neuros seamlessly integrates with your favorite business tools, CRMs, and platforms. Experience a unified analytics platform that...',
                      ),
                    ),
                  ),
                 Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: isDesktop ? 12.0 : 8.0),
                      child:  
                  TrustCard(
                iconData: Icons.verified_user,
                title: 'Global KYC Compliant',
                description:
                    'In the fast-paced world of business, every second counts. Neuros processes data in real-time, ensuring you\'re always working w...',
              ),
              ),
                 ),
                ],
              ),
              
              SizedBox(height: isDesktop ? 24.0 : 16.0),
              
              // Bottom Row - Full width card
              
            
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileLayout(double horizontalPadding, double verticalPadding) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          // Our strategies button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.blue.shade300,
                ),
                const SizedBox(width: 6),
                Text(
                  'Our strategies',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24.0),
          
          // Main Heading
          Text(
            'Our Commitment to Your Trust',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: AppColor.black,
              height: 1.2,
            ),
          ),
          
          const SizedBox(height: 16.0),
          
          // Description
          Text(
            'Trust is not earned through promises—it is earned through performance and verifiable data. We believe you deserve complete visibility into the security, solvency, and operational health of our platform.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: AppColor.textcolor,
              height: 1.6,
            ),
          ),
          
          const SizedBox(height: 40.0),
          
          // Live Reserves Card
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TrustCard(
              iconData: Icons.description,
              title: 'Live Reserves',
              description:
                  'Harness the unmatched power of artificial intelligence with Neuros. Dive deep into predictive analytics, anticipate market trend...',
            ),
          ),
          
          // Insurance Protection Card
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TrustCard(
              iconData: Icons.link,
              title: 'Insurance Protection',
              description:
                  'Neuros seamlessly integrates with your favorite business tools, CRMs, and platforms. Experience a unified analytics platform that...',
            ),
          ),
          
          // Global KYC Compliant Card
          TrustCard(
            iconData: Icons.verified_user,
            title: 'Global KYC Compliant',
            description:
                'In the fast-paced world of business, every second counts. Neuros processes data in real-time, ensuring you\'re always working w...',
          ),
        ],
      ),
    );
  }
}