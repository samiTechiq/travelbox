import 'package:flutter/material.dart';
import 'package:travelbox/features/contact_us/views/desktop/contact_us_screen_desktop.dart';
import 'package:travelbox/features/contact_us/views/mobile/contact_us_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: ContactUsScreenMobile(),
      desktopLayout: ContactUsScreenDesktop(),
    );
  }
}
