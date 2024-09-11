import 'package:flutter/material.dart';
import 'package:travelbox/features/questions/views/cover_details/views/desktop/cover_details_desktop.dart';
import 'package:travelbox/features/questions/views/cover_details/views/mobile/cover_details_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class CoveredDetails extends StatelessWidget {
  const CoveredDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: CoveredDetailsMobile(),
      desktopLayout: CoveredDetailsDesktop(),
    );
  }
}
