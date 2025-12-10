import 'package:flutter/material.dart';
import 'package:kapitor_website/widgets/ticket/ticket_hero_section.dart';
// import 'package:kapitor_website/widgets/ticket/ticket_categories_section.dart';
// import 'package:kapitor_website/widgets/ticket/ticket_form_section.dart';
// import 'package:kapitor_website/widgets/ticket/ticket_priority_section.dart';
// import 'package:kapitor_website/widgets/ticket/ticket_process_section.dart';
// import 'package:kapitor_website/widgets/ticket/ticket_security_section.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';

/// Submit a Ticket Page
/// Kapitor Priority Support Desk for advanced issue resolution
class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            TicketHeroSection(),
            // TicketCategoriesSection(),
            // TicketFormSection(),
            // TicketPrioritySection(),
            // TicketProcessSection(),
            // TicketSecuritySection(),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
