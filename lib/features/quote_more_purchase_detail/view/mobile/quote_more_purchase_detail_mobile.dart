import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/quote_purchase_details/viewmodel/quote_purchase_details_viewmodel.dart';

class QuoteMorePurchaseDetailMobile extends StatelessWidget {
  const QuoteMorePurchaseDetailMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sl<QuotePurchaseDetailsViewmodel>(),
        builder: (context, index) {
          return const QuoteMorePurchaseDetailContent();
        });
  }
}

class QuoteMorePurchaseDetailContent extends StatelessWidget {
  const QuoteMorePurchaseDetailContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
