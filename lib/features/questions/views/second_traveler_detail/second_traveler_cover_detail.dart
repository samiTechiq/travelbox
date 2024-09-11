import 'package:flutter/material.dart';
import 'package:travelbox/features/questions/views/second_traveler_detail/views/desktop/second_traveler_cover_detail_desktop.dart';
import 'package:travelbox/features/questions/views/second_traveler_detail/views/mobile/second_traveler_cover_details_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class SecondCoveredDetailed extends StatelessWidget {
  const SecondCoveredDetailed({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: SecondCoveredDetailedMobile(),
      desktopLayout: SecondCoveredDetailedDesktop(),
    );
  }
}
