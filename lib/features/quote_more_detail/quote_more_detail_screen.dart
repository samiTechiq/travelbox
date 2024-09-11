import 'package:flutter/material.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/features/quote_more_detail/view/desktop/quote_more_detail_screen_desktop.dart';
import 'package:travelbox/features/quote_more_detail/view/mobile/quote_more_detail_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class QuoteMoreDetailScreen extends StatelessWidget {
  final Quote? quote;

  const QuoteMoreDetailScreen({
    super.key,
    this.quote,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: QuoteMoreDetailScreenMobile(quote: quote),
        desktopLayout: QuoteMoreDetailScreenDesktop(quote: quote));
  }
}
