import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/add_on_item_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/adventure_extreme_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/cancel_reason_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/car_hire_excess_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/cruise_cover_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/gadget_cover_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/golf_cover_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/personal_liability_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/pet_care_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/rental_car_care.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/vacation_rental_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/winter_sport_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/what_cover_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/your_health_popup.dart';
import 'package:travelbox/features/quote_purchase_details/viewmodel/quote_purchase_details_viewmodel.dart';
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

  Future<void> _showDialog(BuildContext context, Widget dialog) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuotePurchaseDetailsViewmodel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
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
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
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
                  fontSize: 22,
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
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: R.palette.appHeadingTextBlackColor,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50.r,
                            width: 50.r,
                          ),
                          Column(
                            children: [
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
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ))
                                  ])),
                              SizedBox(
                                height: 3.h,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'HK\$',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: R.palette.appPrimaryBlue,
                                    fontSize: 16,
                                    fontFamily: R.theme.interRegular,
                                  ),
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
                            ],
                          ),
                          InkWell(
                            key: const Key("expand_button"),
                            onTap: () {
                              viewModel.setSelected();
                            },
                            child: Container(
                              height: 50.r,
                              width: 50.r,
                              decoration: BoxDecoration(
                                  color: R.palette.appPrimaryBlue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Icon(
                                  viewModel.isSelected
                                      ? Icons.keyboard_arrow_up_rounded
                                      : Icons.keyboard_arrow_down_rounded,
                                  color: R.palette.appWhiteColor,
                                  size: 35.r,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                if (viewModel.isSelected)
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).whats_covered,
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          fontFamily: R.theme.larkenLightFontFamily,
                          color: R.palette.appHeadingTextBlackColor,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        WhatCoverItem(
                          headTitle: "Your health",
                          icon: true,
                          apply: true,
                          subTitle: "See all health coverage",
                          contents: const [
                            {"name": "Emergency accident", "price": "15,0000"},
                            {
                              "name": "Emergency medical expenses",
                              "price": "15,0000"
                            },
                            {
                              "name": "Follow-up medical expenses",
                              "price": "15,0000"
                            },
                          ],
                          onClickSubTitle: () => _showDialog(
                            context,
                            const YourHealthPopup(
                              heading: "Your health",
                              widgets: [
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Personal accident",
                                  contents: [
                                    {
                                      "name": "Accident on public transport",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name": "Other type of accident",
                                      "price": "1,000,000"
                                    },
                                  ],
                                ),
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Medical expenses",
                                  contents: [
                                    {
                                      "name": "Medical expenses",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name": "Follow up medical expe0nses",
                                      "price": "1,000,000"
                                    },
                                    {
                                      "name": "Major burns",
                                      "price": "1,000,000"
                                    },
                                  ],
                                ),
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Chinese medicine ",
                                  contents: [
                                    {
                                      "name": "Chinese medicine practitioner",
                                      "price": "3,000"
                                    },
                                    {
                                      "name":
                                          "Chinese medicine practitioner (daily limit)",
                                      "price": "1,000,000/day"
                                    },
                                  ],
                                ),
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Trauma counselling ",
                                  contents: [
                                    {
                                      "name": "Trauma counselling",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name":
                                          "Trauma counselling (daily limit)",
                                      "price": "1,000,000/day"
                                    },
                                  ],
                                ),
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Worldwide emergency assistance",
                                  contents: [
                                    {
                                      "name": "Medical evacuation",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name":
                                          "Repatriation after local treatment",
                                      "price": "1,000,000/day"
                                    },
                                    {
                                      "name": "Hospital deposit",
                                      "price": "1,000,000"
                                    },
                                    {
                                      "name":
                                          "Repatriation of unattended children",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name": "Compassionate visit",
                                      "price": "1,000,000/day"
                                    },
                                    {
                                      "name":
                                          "Compassionate visit (daily limit)",
                                      "price":
                                          "1,200/per day for 5 days accommodation"
                                    },
                                    {
                                      "name": "Repatriation of remains",
                                      "price": "1,000,000"
                                    },
                                    {
                                      "name":
                                          "24-Hour Worldwide emergency assistance hotline",
                                      "price": ""
                                    },
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        WhatCoverItem(
                          headTitle: "Your trip",
                          icon: true,
                          apply: true,
                          subTitle: "See all trip coverage",
                          contents: const [
                            {"name": "Trip Cancellation", "price": "15,0000"},
                            {"name": "Trip Delay", "price": "500,000"},
                            {"name": "Trip interruption", "price": "15,0000"},
                          ],
                          onClickSubTitle: () => _showDialog(
                            context,
                            const YourHealthPopup(
                              heading: "Your trip",
                              widgets: [
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Trip cancellation",
                                  contents: [
                                    {
                                      "name": "Trip cancellation (Option A)",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name":
                                          "Trip cancellation -Single occupancy reimbursement  (Option B)",
                                      "price": "1,000,000"
                                    },
                                  ],
                                ),
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Trip interruption ",
                                  contents: [
                                    {
                                      "name": "Trip interruption",
                                      "price": "1,500,000"
                                    },
                                  ],
                                ),
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Trip re-routing",
                                  contents: [
                                    {
                                      "name": "Trip re-routing (accommodation)",
                                      "price": "300/per day for accommodation"
                                    },
                                  ],
                                ),
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Travel delay",
                                  contents: [
                                    {
                                      "name":
                                          "Cash allowance - Option A - Cash allowance",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name":
                                          "Cash allowance - Option A - Cash allowance (daily rate)",
                                      "price":
                                          "300/per each\nfull 6-hour delay "
                                    },
                                    {
                                      "name":
                                          "Cash allowance - Option B - Expenses rebate",
                                      "price":
                                          "300/per each\nfull 6-hour delay "
                                    },
                                    {
                                      "name":
                                          "Cash allowance - Option B - Expenses rebate (daily rate)",
                                      "price": "300/per day\nfor accommodation"
                                    },
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        WhatCoverItem(
                          headTitle: "Your stuff",
                          icon: true,
                          apply: true,
                          subTitle: "See all personal belongings coverage",
                          contents: const [
                            {
                              "name": "Loss or damage to personal property",
                              "price": "150,0000"
                            },
                            {"name": "Loss of money", "price": "150,00000"},
                            {"name": "Home contents", "price": "15,0000"},
                          ],
                          onClickSubTitle: () => _showDialog(
                            context,
                            const YourHealthPopup(
                              heading: "Your stuff",
                              widgets: [
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Personal property",
                                  contents: [
                                    {
                                      "name": "Personal property",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name":
                                          "Personal property (per item limit)",
                                      "price": "1,000,000"
                                    },
                                    {"name": "Laptop", "price": "1,000,000"},
                                    {
                                      "name": "Mobile Phone",
                                      "price": "1,000,000"
                                    },
                                  ],
                                ),
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Travel documents ",
                                  contents: [
                                    {
                                      "name": "Travel documents ",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name":
                                          "Loss of travel documents (accommodation expenses)",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name": "Personal money ",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name": "Unauthorized use of Credit Card",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name": "Baggage delay",
                                      "price": "1,500,000"
                                    },
                                  ],
                                ),
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Home contents protection",
                                  contents: [
                                    {
                                      "name": "Home contents protection",
                                      "price": "300,000"
                                    },
                                    {
                                      "name":
                                          "Home contents protection (each item)",
                                      "price": "300,000"
                                    },
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        WhatCoverItem(
                          headTitle: "Included extras",
                          icon: true,
                          apply: true,
                          subTitle: "See all included extras",
                          contents: const [
                            {"name": "Personal liability", "price": "15,0000"},
                            {
                              "name": "Rental vehicle excess",
                              "price": "15,0000"
                            },
                          ],
                          onClickSubTitle: () => _showDialog(
                            context,
                            const YourHealthPopup(
                              heading: "Included extras",
                              widgets: [
                                WhatCoverItem(
                                  isPopup: true,
                                  icon: true,
                                  apply: true,
                                  headTitle: "Extras",
                                  contents: [
                                    {
                                      "name": "Rental vehicle excess",
                                      "price": "1,500,000"
                                    },
                                    {
                                      "name": "Personal liability",
                                      "price": "1,000"
                                    },
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        const WhatCoverItem(
                          headTitle: "Extras and other bits",
                          icon: true,
                          contents: [
                            {
                              "name": "No extras added",
                            },
                          ],
                          apply: false,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Image.asset(
          //     R.assets.graphics.bkgQuotePurchaseTopMb.path,
          //     fit: BoxFit.contain,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ExpansionCardDesktop extends StatelessWidget {
  const ExpansionCardDesktop({super.key});

  Future<void> _showDialog(BuildContext context, Widget dialog) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuotePurchaseDetailsViewmodel>();
    final ScrollController scrollController = ScrollController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: R.palette.lightGray.withOpacity(0.1),
                        blurRadius: 5.0,
                        spreadRadius: 5.0,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    color: R.palette.appWhiteColor,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, top: 25.h),
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
                          AppLocalizations.of(context)
                              .asia_superior_travel_insurance,
                          fontSize: 6,
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
                                fontSize: 6,
                                fontWeight: FontWeight.w600,
                                color: R.palette.appHeadingTextBlackColor,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
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
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ))
                                  ])),
                              SizedBox(
                                height: 3.h,
                              ),
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
                                          fontWeight: FontWeight.w600,
                                          color: R.palette.appPrimaryBlue,
                                          fontSize: 24,
                                          fontFamily: R.theme.interRegular),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        if (viewModel.isSelected)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 50,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.h, bottom: 10.h),
                                      child: SubHeading(
                                        "What’s covered?",
                                        fontSize: 7,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            R.palette.appHeadingTextBlackColor,
                                        fontFamily:
                                            R.theme.larkenLightFontFamily,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                              color: R.palette
                                                  .textFieldHintGreyColor,
                                              width: 0.5),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 5.w,
                                                top: 5.h,
                                                bottom: 5.h),
                                            child: Column(
                                              children: [
                                                WhatCoverItem(
                                                  headTitle: "Your health",
                                                  icon: true,
                                                  apply: true,
                                                  subTitle:
                                                      "See all health coverage",
                                                  contents: const [
                                                    {
                                                      "name":
                                                          "Emergency accident",
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
                                                  onClickSubTitle: () =>
                                                      _showDialog(
                                                    context,
                                                    const YourHealthPopup(
                                                      heading: "Your health",
                                                      widgets: [
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle:
                                                              "Personal accident",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Accident on public transport",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Other type of accident",
                                                              "price":
                                                                  "1,000,000"
                                                            },
                                                          ],
                                                        ),
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle:
                                                              "Medical expenses",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Medical expenses",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Follow up medical expe0nses",
                                                              "price":
                                                                  "1,000,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Major burns",
                                                              "price":
                                                                  "1,000,000"
                                                            },
                                                          ],
                                                        ),
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle:
                                                              "Chinese medicine ",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Chinese medicine practitioner",
                                                              "price": "3,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Chinese medicine practitioner (daily limit)",
                                                              "price":
                                                                  "1,000,000/day"
                                                            },
                                                          ],
                                                        ),
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle:
                                                              "Trauma counselling ",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Trauma counselling",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Trauma counselling (daily limit)",
                                                              "price":
                                                                  "1,000,000/day"
                                                            },
                                                          ],
                                                        ),
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle:
                                                              "Worldwide emergency assistance",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Medical evacuation",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Repatriation after local treatment",
                                                              "price":
                                                                  "1,000,000/day"
                                                            },
                                                            {
                                                              "name":
                                                                  "Hospital deposit",
                                                              "price":
                                                                  "1,000,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Repatriation of unattended children",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Compassionate visit",
                                                              "price":
                                                                  "1,000,000/day"
                                                            },
                                                            {
                                                              "name":
                                                                  "Compassionate visit (daily limit)",
                                                              "price":
                                                                  "1,200/per day for 5 days accommodation"
                                                            },
                                                            {
                                                              "name":
                                                                  "Repatriation of remains",
                                                              "price":
                                                                  "1,000,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "24-Hour Worldwide emergency assistance hotline",
                                                              "price": ""
                                                            },
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 5.w,
                                                top: 5.h,
                                                bottom: 5.h),
                                            child: Column(
                                              children: [
                                                WhatCoverItem(
                                                  headTitle: "Your trip",
                                                  icon: true,
                                                  apply: true,
                                                  subTitle:
                                                      "See all trip coverage",
                                                  contents: const [
                                                    {
                                                      "name":
                                                          "Trip Cancellation",
                                                      "price": "1,500,000"
                                                    },
                                                    {
                                                      "name": "Trip Delay",
                                                      "price": "500,000"
                                                    },
                                                    {
                                                      "name":
                                                          "Trip interruption",
                                                      "price": "30,00,000"
                                                    },
                                                  ],
                                                  onClickSubTitle: () =>
                                                      _showDialog(
                                                    context,
                                                    const YourHealthPopup(
                                                      heading: "Your trip",
                                                      widgets: [
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle:
                                                              "Trip cancellation",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Trip cancellation (Option A)",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Trip cancellation -Single occupancy reimbursement  (Option B)",
                                                              "price":
                                                                  "1,000,000"
                                                            },
                                                          ],
                                                        ),
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle:
                                                              "Trip interruption ",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Trip interruption",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                          ],
                                                        ),
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle:
                                                              "Trip re-routing",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Trip re-routing (accommodation)",
                                                              "price":
                                                                  "300/per day for accommodation"
                                                            },
                                                          ],
                                                        ),
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle:
                                                              "Travel delay",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Cash allowance - Option A - Cash allowance",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Cash allowance - Option A - Cash allowance (daily rate)",
                                                              "price":
                                                                  "300/per each\nfull 6-hour delay "
                                                            },
                                                            {
                                                              "name":
                                                                  "Cash allowance - Option B - Expenses rebate",
                                                              "price":
                                                                  "300/per each\nfull 6-hour delay "
                                                            },
                                                            {
                                                              "name":
                                                                  "Cash allowance - Option B - Expenses rebate (daily rate)",
                                                              "price":
                                                                  "300/per day\nfor accommodation"
                                                            },
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 5.w,
                                                top: 5.h,
                                                bottom: 5.h),
                                            child: Column(
                                              children: [
                                                WhatCoverItem(
                                                  headTitle: "Your stuff",
                                                  icon: true,
                                                  apply: true,
                                                  subTitle:
                                                      "See all personal belongings coverage",
                                                  contents: const [
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
                                                  onClickSubTitle: () =>
                                                      _showDialog(
                                                    context,
                                                    const YourHealthPopup(
                                                      heading: "Your stuff",
                                                      widgets: [
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle:
                                                              "Personal property",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Personal property",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Personal property (per item limit)",
                                                              "price":
                                                                  "1,000,000"
                                                            },
                                                            {
                                                              "name": "Laptop",
                                                              "price":
                                                                  "1,000,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Mobile Phone",
                                                              "price":
                                                                  "1,000,000"
                                                            },
                                                          ],
                                                        ),
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle:
                                                              "Travel documents ",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Travel documents ",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Loss of travel documents (accommodation expenses)",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Personal money ",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Unauthorized use of Credit Card",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Baggage delay",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                          ],
                                                        ),
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle:
                                                              "Home contents protection",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Home contents protection",
                                                              "price": "300,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Home contents protection (each item)",
                                                              "price": "300,000"
                                                            },
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: 5.w,
                                                top: 5.h,
                                                bottom: 5.h),
                                            child: Column(
                                              children: [
                                                WhatCoverItem(
                                                  headTitle: "Included extras",
                                                  icon: true,
                                                  apply: true,
                                                  subTitle:
                                                      "See all included extras",
                                                  contents: const [
                                                    {
                                                      "name":
                                                          "Personal liability",
                                                      "price": "1,500,000"
                                                    },
                                                    {
                                                      "name":
                                                          "Rental vehicle excess",
                                                      "price": "500,000"
                                                    },
                                                  ],
                                                  onClickSubTitle: () =>
                                                      _showDialog(
                                                    context,
                                                    const YourHealthPopup(
                                                      heading:
                                                          "Included extras",
                                                      widgets: [
                                                        WhatCoverItem(
                                                          isPopup: true,
                                                          icon: true,
                                                          apply: true,
                                                          headTitle: "Extras",
                                                          contents: [
                                                            {
                                                              "name":
                                                                  "Rental vehicle excess",
                                                              "price":
                                                                  "1,500,000"
                                                            },
                                                            {
                                                              "name":
                                                                  "Personal liability",
                                                              "price": "1,000"
                                                            },
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
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
                                  padding: EdgeInsets.only(
                                      top: 5.h, bottom: 10.h, left: 5.w),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 0.9.sh,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 15.w),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: SubHeading(
                                              "What can you add on?",
                                              fontSize: 7,
                                              fontWeight: FontWeight.w400,
                                              color: R.palette
                                                  .appHeadingTextBlackColor,
                                              fontFamily:
                                                  R.theme.larkenLightFontFamily,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        Expanded(
                                          child: RawScrollbar(
                                            mainAxisMargin: 5,
                                            trackVisibility: false,
                                            thickness: 0.5,
                                            thumbVisibility: true,
                                            interactive: false,
                                            child: ListView.builder(
                                              primary: false,
                                              shrinkWrap: true,
                                              controller: scrollController,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  quoteDetailAddOns.length,
                                              itemBuilder: (context, index) {
                                                final item =
                                                    quoteDetailAddOns[index];
                                                return AddOnItemWidget(
                                                  headTitle:
                                                      item["name"].toString(),
                                                  contents: item["description"]
                                                      .toString(),
                                                  price:
                                                      item["price"].toString(),
                                                  subTitle: item["subTitle"]
                                                      .toString(),
                                                  onPressed: () =>
                                                      getDetailItemById(
                                                          item["id"].toString(),
                                                          context),
                                                  isFromConfirmPurchased: true,
                                                  isIncluded:
                                                      item["isChosen"] as bool,
                                                  icon: true,
                                                  // isAdded: viewModel
                                                  //     .isAddOnSelected(
                                                  //     item["id"]
                                                  //         .toString()),
                                                  // onSelectAdd: () => {
                                                  //   onAddOnSelected(
                                                  //       item["id"]
                                                  //           .toString(),
                                                  //       double.parse(item[
                                                  //       "price"]
                                                  //           .toString())),
                                                  // },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  R.assets.graphics.bgQuoteBottom.path,
                  height: 20.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Positioned(
              top: 130.h,
              right: 20,
              child: InkWell(
                key: const Key("expand_button"),
                onTap: () {
                  viewModel.setSelected();
                },
                child: Container(
                  height: 40.r,
                  width: 40.r,
                  decoration: BoxDecoration(
                      color: R.palette.appPrimaryBlue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Icon(
                      viewModel.isSelected
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: R.palette.appWhiteColor,
                      size: 35.r,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getDetailItemById(String id, BuildContext context) {
    switch (id) {
      case "1":
        _showDialog(context, const CruiseCoverPopup());
        break;
      case "2":
        _showDialog(context, const VacationRentalPopup());
        break;
      case "3":
        _showDialog(context, const PersonalLiabilityPopup());
        break;
      case "4":
        _showDialog(context, const AdventureExtremePopup());
        break;
      case "5":
        _showDialog(context, const WinterSportPopup());
        break;
      case "6":
        _showDialog(context, const GadgetCoverPopup());
        break;
      case "7":
        _showDialog(context, const GolfCoverPopup());
        break;
      case "8":
        _showDialog(context, const CarHireExcessPopup());
        break;
      case "9":
        _showDialog(context, const CancelReasonPopup());
        break;
      case "10":
        _showDialog(context, const RentalCarCare());
        break;
      case "11":
        _showDialog(context, const PetCarePopup());
        break;
      default:
        break;
    }
  }
}
