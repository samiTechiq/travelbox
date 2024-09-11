import 'package:flutter/material.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/views/desktop/start_end_picker_screen_desktop.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/views/mobile/start_end_picker_scren_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';




class PickerScreen extends StatelessWidget {
  const PickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(mobileLayout: PickerScreenMobile(), desktopLayout: PickerScreenDesktop());
  }
}
