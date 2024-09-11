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
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class QuotePurchaseDetailsMobile extends StatelessWidget {
  const QuotePurchaseDetailsMobile({super.key});

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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: GenericAppBarMobile(
                        leading: Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: R.palette.mediumBlack,
                          ),
                        ),
                        trailing: Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: SubHeading(
                            'Skip',
                            fontSize: 16,
                            color: R.palette.mediumBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onLeadingPressed: () {
                          sl<Navigation>().goBack(context);
                        },
                        onTrailingPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const ContentTop(),
                    const ExpansionCardTop(),
                    SizedBox(height: 30.h),
                    const ExpansionCardBot(),
                    ContentBot(
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
