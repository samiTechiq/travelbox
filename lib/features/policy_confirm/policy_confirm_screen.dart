import 'package:flutter/material.dart';
import 'package:travelbox/features/policy_confirm/views/desktop/policy_confirm_screen_desktop.dart';
import 'package:travelbox/features/policy_confirm/views/mobile/policy_confirm_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class PolicyConfirm extends StatelessWidget {
  const PolicyConfirm({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: PolicyConfirmMobile(),
      desktopLayout: PolicyConfirmDesktop(),
    );
  }
}
