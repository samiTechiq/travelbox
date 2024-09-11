import 'package:flutter/material.dart';
import 'package:travelbox/features/personal_detail/view/desktop/personal_detail_screen_desktop.dart';
import 'package:travelbox/features/personal_detail/view/mobile/personal_detail_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class PersonalDetailScreen extends StatelessWidget {
  const PersonalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: PersonalDetailScreenMobile(),
        desktopLayout: PersonalDetailScreenDesktop());
  }
}
