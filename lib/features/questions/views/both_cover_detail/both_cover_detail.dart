import 'package:flutter/material.dart';
import 'package:travelbox/features/questions/views/both_cover_detail/views/desktop/both_cover_detail_desktop.dart';
import 'package:travelbox/features/questions/views/both_cover_detail/views/mobile/both_cover_detail_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class BothCoveredDetails extends StatelessWidget {
  const BothCoveredDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: BothCoveredDetailsMobile(),
      desktopLayout: BothCoveredDetailsDesktop(),
    );
  }
}
