import 'package:flutter/material.dart';
import 'package:travelbox/features/quote_purchase_details/view/desktop/quote_purchase_details_desktop.dart';
import 'package:travelbox/features/quote_purchase_details/view/mobile/quote_purchase_details_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class QuotePurchaseDetailsScreen extends StatelessWidget {
  const QuotePurchaseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: QuotePurchaseDetailsMobile(),
      desktopLayout: QuotePurchaseDetailsDesktop(),
    );
  }
}
