import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_purchase_detail/widget/expansion_card_top.dart';
import 'package:travelbox/features/quote_purchase_details/viewmodel/quote_purchase_details_viewmodel.dart';
import 'package:travelbox/features/quote_purchase_details/widget/content_bot.dart';
import 'package:travelbox/features/quote_purchase_details/widget/content_top.dart';
import 'package:travelbox/features/quote_purchase_details/widget/expansion_card_bot.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class QuoteMorePurchaseDetailDesktop extends StatelessWidget {
  const QuoteMorePurchaseDetailDesktop({super.key});

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
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      appBar: GenericAppBarDesktop(
        leading: InkWell(
          onTap: () {
            sl<Navigation>().goBack(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: R.palette.mediumBlack,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ContentTop(),
                const ExpansionCardTop(),
                SizedBox(height: 10.h),
                const ExpansionCardBot(),
                ContentBot(onPressed: () {
                  sl<Navigation>().push(context, Routes.detailsPolicyConfirmRoute);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
