import 'package:flutter/material.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/home/view/desktop/home_screen_desktop.dart';
import 'package:travelbox/features/home/view/mobile/home_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.backGroundColor,
      body: const ResponsiveLayout(
        mobileLayout: HomeScreenMobile(),
        desktopLayout: HomeScreenDesktop(),
      ),
    );
  }
}
