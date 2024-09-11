import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/what_cover_widget.dart';
import 'package:travelbox/features/quote_more_purchase_detail/widget/add_on_item_widget.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class ExpansionCardTop extends StatelessWidget {
  const ExpansionCardTop({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: ExpansionCardMobile(),
      desktopLayout: ExpansionCardDesktop(),
    );
  }
}

class ExpansionCardMobile extends StatelessWidget {
  const ExpansionCardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class ExpansionCardDesktop extends StatelessWidget {
  const ExpansionCardDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: R.palette.transparent,
                  blurRadius: 15.0,
                  spreadRadius: 5.0,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                )
              ],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              color: R.palette.appWhiteColor,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  R.assets.graphics.coverImage.path,
                  width: 176,
                  height: 41,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SubHeading(
                  AppLocalizations.of(context).asia_superior_travel_insurance,
                  fontSize: 5,
                  fontWeight: FontWeight.w600,
                  color: R.palette.appHeadingTextBlackColor,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      SubHeading(
                        "Plan B",
                        fontSize: 5,
                        fontWeight: FontWeight.w600,
                        color: R.palette.appHeadingTextBlackColor,
                      ),
                      SizedBox(height: 10.h),
                      RichText(
                          text: TextSpan(
                              text: 'HK\$',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: R.palette.mediumBlack,
                                fontSize: 11,
                                fontFamily: R.theme.interRegular,
                                decoration: TextDecoration.lineThrough,
                              ),
                              children: [
                            TextSpan(
                                text: "280.00",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: R.palette.mediumBlack,
                                  fontSize: 15,
                                  fontFamily: R.theme.interRegular,
                                  decoration: TextDecoration.lineThrough,
                                ))
                          ])),
                      SizedBox(height: 3.h),
                      RichText(
                        text: TextSpan(
                          text: 'HK\$',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: R.palette.appPrimaryBlue,
                              fontSize: 16,
                              fontFamily: R.theme.interRegular),
                          children: [
                            TextSpan(
                              text: "200.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: R.palette.appPrimaryBlue,
                                  fontSize: 24,
                                  fontFamily: R.theme.interRegular),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 154,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: R.palette.disableButtonColor,
                        ),
                        child: Center(
                          child: SubHeading2(
                            AppLocalizations.of(context).select,
                            color: R.palette.mediumBlack,
                            fontFamily: R.theme.interRegular,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 50,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5.h, bottom: 10.h, left: 20.w),
                            child: SubHeading(
                              "What’s covered?",
                              fontSize: 7,
                              fontWeight: FontWeight.w400,
                              color: R.palette.appHeadingTextBlackColor,
                              fontFamily: R.theme.larkenLightFontFamily,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                    color: R.palette.textFieldHintGreyColor,
                                    width: 0.5),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 5.w, top: 5.h, bottom: 5.h),
                                  child: const Column(
                                    children: [
                                      WhatCoverItem(
                                        headTitle: "Your health",
                                        subTitle: "See all health coverage",
                                        contents: [
                                          {
                                            "name": "Emergency accident",
                                            "price": "1,500,000"
                                          },
                                          {
                                            "name":
                                                "Emergency medical expenses",
                                            "price": "500,000"
                                          },
                                          {
                                            "name":
                                                "Follow-up medical expenses",
                                            "price": "30,00,000"
                                          },
                                        ],
                                        icon: true,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 5.w, top: 5.h, bottom: 5.h),
                                  child: const Column(
                                    children: [
                                      WhatCoverItem(
                                        headTitle: "Your trip",
                                        subTitle: "See all trip coverage",
                                        contents: [
                                          {
                                            "name": "Trip Cancellation",
                                            "price": "1,500,000"
                                          },
                                          {
                                            "name": "Trip Delay",
                                            "price": "500,000"
                                          },
                                          {
                                            "name": "Trip interruption",
                                            "price": "30,00,000"
                                          },
                                        ],
                                        icon: true,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 5.w, top: 5.h, bottom: 5.h),
                                  child: const Column(
                                    children: [
                                      WhatCoverItem(
                                        headTitle: "Your stuff",
                                        subTitle:
                                            "See all personal belongings coverage",
                                        contents: [
                                          {
                                            "name":
                                                "Loss or damage to personal property",
                                            "price": "1,500,000"
                                          },
                                          {
                                            "name": "Loss of money",
                                            "price": "500,000"
                                          },
                                          {
                                            "name": "Home contents",
                                            "price": "30,00,000"
                                          },
                                        ],
                                        icon: true,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 5.w, top: 5.h, bottom: 5.h),
                                  child: const Column(
                                    children: [
                                      WhatCoverItem(
                                        headTitle: "Included extras",
                                        subTitle: "See all included extras",
                                        contents: [
                                          {
                                            "name": "Personal liability",
                                            "price": "1,500,000"
                                          },
                                          {
                                            "name": "Rental vehicle excess",
                                            "price": "500,000"
                                          },
                                        ],
                                        icon: true,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 5.h, bottom: 10.h, left: 5.w),
                        child: SizedBox(
                          width: double.infinity,
                          height: 0.8.sh,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 15.w),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: SubHeading(
                                    "What can you add on?",
                                    fontSize: 7,
                                    fontWeight: FontWeight.w400,
                                    color: R.palette.appHeadingTextBlackColor,
                                    fontFamily: R.theme.larkenLightFontFamily,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: quoteDetailAddOns.length,
                                  itemBuilder: (context, index) {
                                    final item = quoteDetailAddOns[index];
                                    return AddOnItemWidget(
                                      headTitle: item["name"].toString(),
                                      contents: item["description"].toString(),
                                      apply: item["isChosen"] as bool,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              R.assets.graphics.bkgQuoteMorePurchaseTop.path,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
