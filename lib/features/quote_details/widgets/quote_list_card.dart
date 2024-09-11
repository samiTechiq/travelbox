import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/features/quote_details/widgets/add_on_updated.dart';
import 'package:travelbox/features/quote_details/widgets/quote_expansion_row.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

import 'expansion_card_page_view_data_widget.dart';
import 'expansion_card_page_view_widget.dart';

class QuoteCard extends StatelessWidget {
  final String? heading;
  final String? subHeading;
  final bool isRecommended;
  final String? destinationHeading;

  final Quote quote;

  final VoidCallback? onPressMoreDetail;
  final VoidCallback? onPressOptionalExtras;

  const QuoteCard({
    super.key,
    this.heading,
    this.subHeading,
    this.isRecommended = false,
    this.destinationHeading,
    required this.quote,
    this.onPressMoreDetail,
    this.onPressOptionalExtras,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: QuoteCardMobile(
          quote: quote,
          heading: heading,
          subHeading: subHeading,
          isRecommended: isRecommended,
          destinationHeading: destinationHeading,
          onPressMoreDetail: onPressMoreDetail,
          onPressOptionalExtras: onPressOptionalExtras),
      desktopLayout: QuoteCardDesktop(
          quote: quote,
          heading: heading,
          subHeading: subHeading,
          isRecommended: isRecommended,
          destinationHeading: destinationHeading,
          onPressMoreDetail: onPressMoreDetail,
          onPressOptionalExtras: onPressOptionalExtras),
    );
  }
}

class QuoteCardMobile extends StatefulWidget {
  final String? heading;
  final String? subHeading;
  final bool isRecommended;
  final String? destinationHeading;

  final Quote quote;

  final VoidCallback? onPressMoreDetail;
  final VoidCallback? onPressOptionalExtras;

  const QuoteCardMobile({
    Key? key,
    this.heading,
    this.subHeading,
    this.isRecommended = false,
    this.destinationHeading,
    required this.quote,
    this.onPressMoreDetail,
    this.onPressOptionalExtras,
  }) : super(key: key);

  @override
  State<QuoteCardMobile> createState() => _QuoteCardMobileState();
}

class _QuoteCardMobileState extends State<QuoteCardMobile> {
  bool isExpanded = false;
  TextEditingController controller = TextEditingController();
  ScrollController itemScroll = ScrollController();

  // List<dynamic> dataList = [
  //   R.stringRes.quoteDetailScreen.rowExpandDetail1,
  //   R.stringRes.quoteDetailScreen.rowExpandDetail2,
  //   R.stringRes.quoteDetailScreen.rowExpandDetail3,
  // ];

  PageController pageController = PageController();
  List<PagesData> listOfAvailableQuotes = [];
  List<PagesData> coverItemsIncludedInQuote = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          decoration: R.theme.genericCardDecoration,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  R.assets.graphics.coverImage.path,
                  width: 176.w,
                  height: 41.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SubHeading(
                  widget.quote.name ?? 'TravelJoy Go Worlwide',
                  color: R.palette.appHeadingTextBlackColor,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SubHeading(
                    AppLocalizations.of(context).txt_plan_b,
                    color: R.palette.appHeadingTextBlackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         if (isExpanded) {
                //           setState(() {
                //             isExpanded = false;
                //           });
                //         } else {
                //           setState(() {
                //             isExpanded = true;
                //           });
                //         }
                //       },
                //       child: Padding(
                //         padding: EdgeInsets.only(top: 26.h),
                //         child: Container(
                //           height: 42.h,
                //           width: 42.h,
                //           decoration: BoxDecoration(
                //               color: R.palette.appPrimaryBlue,
                //               boxShadow: [
                //                 BoxShadow(
                //                   color: R.palette.appPrimaryBlue.withOpacity(0.3),
                //                   blurRadius: 10.0, // soften the shadow
                //                   spreadRadius: 1, //extend the shadow
                //                   offset: const Offset(
                //                     0.2, // Move to right 5  horizontally
                //                     0.1, // Move to bottom 5 Vertically
                //                   ),
                //                 ),
                //               ],
                //               borderRadius: BorderRadius.circular(8)),
                //           child: Center(
                //             child: Icon(
                //               isExpanded
                //                   ? Icons.keyboard_arrow_up_rounded
                //                   : Icons.keyboard_arrow_down_rounded,
                //               size: 22.sp,
                //               color: R.palette.appWhiteColor,
                //             ),
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddOnUpdated(
                            title: "Medical".hardcoded, price: "1,500,000".hardcoded),
                        SizedBox(
                          height: 15.h,
                        ),
                        AddOnUpdated(
                            title: "Cancellation".hardcoded, price: "30,000".hardcoded),
                        SizedBox(
                          height: 15.h,
                        ),
                        AddOnUpdated(title: "Property".hardcoded, price: "90,000".hardcoded)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // width: 124.w,
                          // height: 61.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: R.palette.lighterBlue,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 18.h, horizontal: 15.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SubHeading(
                                  'HK\$280.00',
                                  color: R.palette.appHeadingTextBlackColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.lineThrough,
                                ),
                                SubHeading(
                                  'HK\$${widget.quote.quotePrice?.amount?.toStringAsFixed(2) ?? '200'}',
                                  color: R.palette.appPrimaryBlue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                          onTap: widget.onPressOptionalExtras,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: R.palette.textFieldBorderGreyColor),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 15.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    R.assets.graphics.extra.path,
                                    height: 20.h,
                                    width: 20.w,
                                    fit: BoxFit.fitWidth,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SubHeading(
                                    AppLocalizations.of(context)
                                        .optional_extras,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: R.palette.appHeadingTextBlackColor,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: GenericButton(
                    width: 0.45.sw,
                    onPressed: () async {
                      sl<Navigation>()
                          .push(context, Routes.quoteMoreDetailRoute);
                    },
                    text: AppLocalizations.of(context).more_details,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Expanded(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           SizedBox(
                //             height: 10.h,
                //           ),
                //           Center(
                //             child: SubHeading(
                //               "${widget.quote.quotePrice?.currency ?? 'PKR'} ${widget.quote.quotePrice?.amount?.toStringAsFixed(2) ?? '100'}",
                //               color: R.palette.appPrimaryBlue,
                //               fontSize: 22,
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //           SizedBox(
                //             height: 20.h,
                //           ),
                //           Center(
                //             child: GenericButton(
                //               enableShadow: viewModel.selectedQuote == widget.quote,
                //               height: 36,
                //               allowClickWhenDisabled: true,
                //               width: 170,
                //               radius: 8,
                //               fontSize: 14,
                //               fontWeightT: FontWeight.w600,
                //               isEnable: viewModel.selectedQuote == widget.quote,
                //               onPressed: () {
                //                 viewModel.setQuote(widget.quote);
                //               },
                //               text: R.stringRes.quoteDetailScreen.select,
                //             ),
                //           ),
                //           widget.isRecommended
                //               ? SizedBox(height: 33.h)
                //               : SizedBox(
                //                   height: 30.h,
                //                 )
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                Visibility(
                  visible: isExpanded,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 27.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SubHeading(
                            AppLocalizations.of(context).whats_covered,
                            color: R.palette.mediumBlack,
                            fontSize: 24.sp,
                            maxLines: 2,
                            fontWeight: FontWeight.normal,
                            fontFamily: R.theme.larkenLightFontFamily,
                          ),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        if (widget.quote.coverGroups != null) ...[
                          ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.quote.coverGroups!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final cover = widget.quote.coverGroups![index];
                              return ExpansionRow(
                                tileTitle: cover.name ?? '',
                                data: cover.coverItems,
                                subTile: "",
                                subTileData:
                                    AppLocalizations.of(context).txt_hong_kong_money('5000'.hardcoded),
                                linkText: AppLocalizations.of(context).txt_see_all,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20.h,
                              );
                            },
                          ),
                        ],
                        if (coverItemsIncludedInQuote.isNotEmpty) ...[
                          PageViewWidget(
                            list: coverItemsIncludedInQuote,
                          ),
                        ],
                        SizedBox(
                          height: 33.h,
                        ),
                        if (listOfAvailableQuotes.isNotEmpty) ...[
                          PageViewWidget(
                            list: listOfAvailableQuotes,
                          ),
                        ],
                        SizedBox(
                          height: 34.h,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
      ],
    );
  }

  @override
  void initState() {
    getAddOnCoverItemsAvailable();
    getCoverItemsIncludeInQuote();

    super.initState();
  }

  void getAddOnCoverItemsAvailable() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.quote.addOnCoverItemsAvailable == null) return;
      for (var element in widget.quote.addOnCoverItemsAvailable!) {
        var page = PagesData(
          name: element.name ?? '',
          shortDescription: element.shortDescription ?? '',
          text: element.name ?? "",
          longDescription: element.longDescription,
          subText: element.shortDescription ?? '',
          amountText:
              "${element.price?.amount ?? ''}${element.price?.currency ?? ''}",
          linkText: AppLocalizations.of(context).txt_see_more,
          actionAdd: true,
        );
        listOfAvailableQuotes.add(page);
        setState(() {});
      }
    });
  }

  void getCoverItemsIncludeInQuote() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.quote.coverItemsIncludedInQuote == null) return;
      for (var element in widget.quote.coverItemsIncludedInQuote!) {
        var page = PagesData(
          name: element.name ?? '',
          shortDescription: element.shortDescription ?? '',
          text: element.name ?? "",
          longDescription: element.longDescription,
          subText: element.shortDescription ?? '',
          amountText:
              "${element.price?.amount ?? ''}${element.price?.currency ?? ''}",
          linkText: AppLocalizations.of(context).txt_see_more,
        );
        coverItemsIncludedInQuote.add(page);
        setState(() {});
      }
    });
  }
}

class QuoteCardDesktop extends StatefulWidget {
  final String? heading;
  final String? subHeading;
  final bool isRecommended;
  final String? destinationHeading;

  final Quote quote;

  final VoidCallback? onPressMoreDetail;
  final VoidCallback? onPressOptionalExtras;

  const QuoteCardDesktop({
    Key? key,
    this.heading,
    this.subHeading,
    this.isRecommended = false,
    this.destinationHeading,
    required this.quote,
    this.onPressMoreDetail,
    this.onPressOptionalExtras,
  }) : super(key: key);

  @override
  State<QuoteCardDesktop> createState() => _QuoteCardDesktopState();
}

class _QuoteCardDesktopState extends State<QuoteCardDesktop> {
  bool isExpanded = false;
  TextEditingController controller = TextEditingController();
  ScrollController itemScroll = ScrollController();

  // List<dynamic> dataList = [
  //   R.stringRes.quoteDetailScreen.rowExpandDetail1,
  //   R.stringRes.quoteDetailScreen.rowExpandDetail2,
  //   R.stringRes.quoteDetailScreen.rowExpandDetail3,
  // ];

  PageController pageController = PageController();
  List<PagesData> listOfAvailableQuotes = [];
  List<PagesData> coverItemsIncludedInQuote = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: R.theme.genericCardDecoration,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 15.w, top: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SubHeading(
                  widget.quote.name ?? "Basic Cover",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: R.palette.appHeadingTextBlackColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                SubHeading(
                  "|",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: R.palette.appHeadingTextBlackColor,
                ),
                SizedBox(
                  width: 10.w,
                ),
                SubHeading(
                  "Plan B",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: R.palette.appHeadingTextBlackColor,
                ),
              ],
            ),
            SizedBox(
              height: 17.h,
            ),
            Row(
              children: [
                Image.asset(
                  R.assets.graphics.coverImage.path,
                  width: 0.142.sw,
                  height: 47.h,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  width: 65.w,
                ),
                Container(
                  width: 0.086.sw,
                  height: 61.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: R.palette.lighterBlue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SubHeading(
                        'HK\$280.00',
                        color: R.palette.appHeadingTextBlackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                      ),
                      SubHeading(
                        'HK\$${widget.quote.quotePrice?.amount?.toStringAsFixed(2) ?? '100.00'}',
                        color: R.palette.appPrimaryBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 33.w,
                ),
                const AddOnUpdated(title: "Medical", price: "1,500,000"),
                SizedBox(
                  width: 25.w,
                ),
                const AddOnUpdated(title: "Cancellation", price: "300,000"),
                SizedBox(
                  width: 25.w,
                ),
                const AddOnUpdated(title: "Property", price: "20,000"),
                SizedBox(
                  width: 30.w,
                ),
                InkWell(
                  onTap: widget.onPressOptionalExtras,
                  child: Container(
                    width: 0.122.sw,
                    height: 41.h,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: R.palette.textFieldHintGreyColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          R.assets.graphics.extra.path,
                          height: 20.h,
                          width: 20.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).optional_extras,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: R.palette.appHeadingTextBlackColor,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 11.w,
                ),
                GenericButton(
                  width: 0.106.sw,
                  height: 41.h,
                  onPressed: () async {
                    widget.onPressMoreDetail!();
                  },
                  text: AppLocalizations.of(context).more_details,
                  fontSize: 18,
                ),
              ],
            ),
            SizedBox(
              height: 14.h,
            ),
            // widget.isRecommended
            //     ? Container(
            //         height: 46.h,
            //         width: double.maxFinite,
            //         decoration: BoxDecoration(
            //           color: R.palette.accentOrangeColor,
            //           borderRadius: const BorderRadius.only(
            //             topLeft: Radius.circular(05),
            //             topRight: Radius.circular(
            //               05,
            //             ),
            //           ),
            //         ),
            //         child: Row(
            //           children: [
            //             SizedBox(width: 30.w),
            //             Icon(
            //               Icons.star,
            //               color: R.palette.appWhiteColor,
            //             ),
            //             SizedBox(width: 11.w),
            //             SubHeading(
            //               R.stringRes.quoteDetailScreen.recommended,
            //               fontSize: 6,
            //             ),
            //           ],
            //         ),
            //       )
            //     : const SizedBox(),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       SubHeading(
            //         widget.quote.name ?? 'Basic Cover',
            //         color: R.palette.appHeadingTextBlackColor,
            //         fontSize: 5,
            //         fontWeight: FontWeight.w600,
            //       ),
            //       InkWell(
            //         onTap: () {
            //           if (isExpanded) {
            //             setState(() {
            //               isExpanded = false;
            //             });
            //           } else {
            //             setState(() {
            //               isExpanded = true;
            //             });
            //           }
            //         },
            //         child: Padding(
            //           padding: EdgeInsets.only(top: 26.h),
            //           child: Container(
            //             height: 60.h,
            //             width: 60.h,
            //             decoration: BoxDecoration(
            //                 color: R.palette.appPrimaryBlue,
            //                 boxShadow: [
            //                   BoxShadow(
            //                     color: R.palette.appPrimaryBlue.withOpacity(0.3),
            //                     blurRadius: 10.0, // soften the shadow
            //                     spreadRadius: 1, //extend the shadow
            //                     offset: const Offset(
            //                       0.2, // Move to right 5  horizontally
            //                       0.1, // Move to bottom 5 Vertically
            //                     ),
            //                   ),
            //                 ],
            //                 borderRadius: BorderRadius.circular(12)),
            //             child: Center(
            //               child: Icon(
            //                 isExpanded
            //                     ? Icons.keyboard_arrow_up_rounded
            //                     : Icons.keyboard_arrow_down_rounded,
            //                 size: 50,
            //                 color: R.palette.appWhiteColor,
            //               ),
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Expanded(
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           SizedBox(
            //             height: 10.h,
            //           ),
            //           Center(
            //             child: SubHeading(
            //               "${widget.quote.quotePrice?.currency ?? 'PKR'} ${widget.quote.quotePrice?.amount?.toStringAsFixed(2) ?? '100'}",
            //               color: R.palette.appPrimaryBlue,
            //               fontSize: 10,
            //               fontWeight: FontWeight.w600,
            //             ),
            //           ),
            //           SizedBox(
            //             height: 20.h,
            //           ),
            //           Center(
            //             child: GenericButton(
            //               enableShadow: viewModel.selectedQuote == widget.quote,
            //               height: 40,
            //               allowClickWhenDisabled: true,
            //               width: 50,
            //               radius: 8,
            //               fontSize: 4,
            //               fontWeightT: FontWeight.w600,
            //               isEnable: viewModel.selectedQuote == widget.quote,
            //               onPressed: () {
            //                 viewModel.setQuote(widget.quote);
            //               },
            //               text: R.stringRes.quoteDetailScreen.select,
            //             ),
            //           ),
            //           widget.isRecommended
            //               ? SizedBox(height: 33.h)
            //               : SizedBox(
            //                   height: 30.h,
            //                 )
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // Visibility(
            //   visible: isExpanded,
            //   child: Padding(
            //     padding: EdgeInsets.only(left: 20.w, right: 27.w),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             if (widget.quote.coverGroups != null) ...[
            //               Expanded(
            //                 child: ListView.separated(
            //                   physics: const NeverScrollableScrollPhysics(),
            //                   itemCount: 2,
            //                   scrollDirection: Axis.vertical,
            //                   shrinkWrap: true,
            //                   itemBuilder: (context, index) {
            //                     final cover = widget.quote.coverGroups?[index];
            //                     return ExpansionRow(
            //                       tileTitle: cover?.name ?? '',
            //                       data: cover?.coverItems,
            //                       subTile: "",
            //                       subTileData:
            //                           R.stringRes.quoteDetailScreen.amount,
            //                       linkText: R.stringRes.quoteDetailScreen.seeAll,
            //                     );
            //                   },
            //                   separatorBuilder: (context, index) {
            //                     return SizedBox(
            //                       height: 20.h,
            //                     );
            //                   },
            //                 ),
            //               ),
            //             ],
            //             const VerticalDivider(
            //               color: Colors.black,
            //               thickness: 3,
            //             ),
            //             if (widget.quote.addOnCoverItemsAvailable != null) ...[
            //               Expanded(
            //                 child: ListView.separated(
            //                   physics: const NeverScrollableScrollPhysics(),
            //                   itemCount: 2,
            //                   scrollDirection: Axis.vertical,
            //                   shrinkWrap: true,
            //                   itemBuilder: (context, index) {
            //                     final cover =
            //                         widget.quote.addOnCoverItemsAvailable?[index];
            //                     return AddOnWidget(
            //                       tileTitle: cover?.name ?? '',
            //                       desription: cover?.shortDescription ?? '',
            //                       price:
            //                           "${cover?.price?.amount ?? ''}${cover?.price?.currency ?? ''}",
            //                     );
            //                   },
            //                   separatorBuilder: (context, index) {
            //                     return SizedBox(
            //                       height: 20.h,
            //                     );
            //                   },
            //                 ),
            //               ),
            //             ]
            //           ],
            //         ),
            //         SizedBox(
            //           height: 34.h,
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getAddOnCoverItemsAvailable();
    getCoverItemsIncludeInQuote();

    super.initState();
  }

  void getAddOnCoverItemsAvailable() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.quote.addOnCoverItemsAvailable == null) return;
      for (var element in widget.quote.addOnCoverItemsAvailable!) {
        var page = PagesData(
          name: element.name ?? '',
          shortDescription: element.shortDescription ?? '',
          text: element.name ?? "",
          longDescription: element.longDescription,
          subText: element.shortDescription ?? '',
          amountText:
              "${element.price?.amount ?? ''}${element.price?.currency ?? ''}",
          linkText: AppLocalizations.of(context).txt_see_more,
          actionAdd: true,
        );
        listOfAvailableQuotes.add(page);
        setState(() {});
      }
    });
  }

  void getCoverItemsIncludeInQuote() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.quote.coverItemsIncludedInQuote == null) return;
      for (var element in widget.quote.coverItemsIncludedInQuote!) {
        var page = PagesData(
          name: element.name ?? '',
          shortDescription: element.shortDescription ?? '',
          text: element.name ?? "",
          longDescription: element.longDescription,
          subText: element.shortDescription ?? '',
          amountText:
              "${element.price?.amount ?? ''}${element.price?.currency ?? ''}",
          linkText: AppLocalizations.of(context).txt_see_more,
        );
        coverItemsIncludedInQuote.add(page);
        setState(() {});
      }
    });
  }
}
