import 'package:flutter/material.dart';
import 'package:travelbox/features/detail_policy/views/desktop/detail_policy_screen_desktop.dart';
import 'package:travelbox/features/detail_policy/views/mobile/detail_policy_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class DetailPolicyScreen extends StatelessWidget {
  const DetailPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: DetailPolicyScreenMobile(),
      desktopLayout: DetailPolicyScreenDesktop(),
    );
  }
}
