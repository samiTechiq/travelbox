import 'package:flutter/material.dart';
import 'package:travelbox/features/questions/views/family_group_cover_details/views/desktop/family_grroup_cover_details_desktop.dart';
import 'package:travelbox/features/questions/views/family_group_cover_details/views/mobile/family_group_cover_details_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class FamilyGroupCoveredDetails extends StatelessWidget {
  const FamilyGroupCoveredDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: FamilyGroupCoveredDetailsMobile(),
      desktopLayout: FamilyGroupCoveredDetailsDesktop(),
    );
  }
}
