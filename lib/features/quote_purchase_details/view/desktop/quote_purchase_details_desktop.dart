import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_purchase_details/viewmodel/quote_purchase_details_viewmodel.dart';
import 'package:travelbox/features/quote_purchase_details/widget/content_bot.dart';
import 'package:travelbox/features/quote_purchase_details/widget/content_top.dart';
import 'package:travelbox/features/quote_purchase_details/widget/expansion_card_bot.dart';
import 'package:travelbox/features/quote_purchase_details/widget/expansion_card_top.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class QuotePurchaseDetailsDesktop extends StatelessWidget {
  const QuotePurchaseDetailsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sl<QuotePurchaseDetailsViewmodel>(),
        builder: (context, index) {
          return const QuotePurchaseDetailsContent();
        });
  }
}

class QuotePurchaseDetailsContent extends StatelessWidget {
  const QuotePurchaseDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: GenericAppBarDesktop(
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
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ContentTop(),
                    SizedBox(height: 5.h),
                    const ExpansionCardTop(),
                    SizedBox(height: 20.h),
                    const ExpansionCardBot(),
                    ContentBot(
                      onPressed: () {
                        sl<Navigation>()
                            .push(context, Routes.detailsPolicyConfirmRoute);
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
