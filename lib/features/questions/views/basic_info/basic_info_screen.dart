import 'package:flutter/material.dart';
import 'package:travelbox/features/questions/views/basic_info/views/desktop/basic_info_desktop.dart';
import 'package:travelbox/features/questions/views/basic_info/views/mobile/basic_info_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class BasicInfoScreen extends StatelessWidget {
  const BasicInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: BasicInfoScreenMobile(),
        desktopLayout: BasicInfoScreenDesktop());
  }
}
