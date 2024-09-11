import 'package:flutter/material.dart';
import 'package:travelbox/features/profile/view/desktop/profile_desktop.dart';
import 'package:travelbox/features/profile/view/mobile/profile_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: ProfileMobile(),
      desktopLayout: ProfileDesktop(),
    );
  }
}
