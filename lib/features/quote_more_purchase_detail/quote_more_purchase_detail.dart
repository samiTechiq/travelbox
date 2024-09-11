import 'package:flutter/material.dart';
import 'package:travelbox/features/quote_more_purchase_detail/view/desktop/quote_more_purchase_detail_desktop.dart';
import 'package:travelbox/features/quote_more_purchase_detail/view/mobile/quote_more_purchase_detail_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class QuoteMorePurchaseDetailsScreen extends StatelessWidget {
  const QuoteMorePurchaseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: QuoteMorePurchaseDetailMobile(),
      desktopLayout: QuoteMorePurchaseDetailDesktop(),
    );
  }
}
