import 'package:flutter/material.dart';
import 'package:travelbox/features/quote_details/views/desktop/quote_detail_updated_desktop.dart';
import 'package:travelbox/features/quote_details/views/mobile/quote_detail_updated_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class QuoteDetails extends StatelessWidget {
  const QuoteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: QuoteDetailsUpdatedMobile(),
        desktopLayout: const QuoteDetailsUpdatedDesktop());
  }
}
