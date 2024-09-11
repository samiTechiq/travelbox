import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/features/quote_details/widgets/quote_expansion_row.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

import '../viewmodel/quote_detail_viewmodel.dart';
import 'add_on_widget.dart';
import 'expansion_card_page_view_data_widget.dart';
import 'expansion_card_page_view_widget.dart';

class QuoteExpansionCard extends StatelessWidget {
  final String? heading;
  final String? subHeading;
  final bool isRecommended;
  final String? destinationHeading;

  final Quote quote;

  const QuoteExpansionCard({
    super.key,
    this.heading,
    this.subHeading,
    this.isRecommended = false,
    this.destinationHeading,
    required this.quote,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: QuoteExpansionCardMobile(
        quote: quote,
        heading: heading,
        subHeading: subHeading,
        isRecommended: isRecommended,
        destinationHeading: destinationHeading,
      ),
      desktopLayout: QuoteExpansionCardDesktop(
        quote: quote,
        heading: heading,
        subHeading: subHeading,
        isRecommended: isRecommended,
        destinationHeading: destinationHeading,
      ),
    );
  }
}

class QuoteExpansionCardMobile extends StatefulWidget {
  final String? heading;
  final String? subHeading;
  final bool isRecommended;
  final String? destinationHeading;

  final Quote quote;

  const QuoteExpansionCardMobile({
    Key? key,
    this.heading,
    this.subHeading,
    this.isRecommended = false,
    this.destinationHeading,
    required this.quote,
  }) : super(key: key);

  @override
  State<QuoteExpansionCardMobile> createState() =>
      _QuoteExpansionCardMobileState();
}

class _QuoteExpansionCardMobileState extends State<QuoteExpansionCardMobile> {
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
    final viewModel = context.watch<QuoteDetailViewModel>();
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: R.palette.disableButtonColor)),
      child: Column(
        children: [
          widget.isRecommended
              ? Container(
                  height: 46.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: R.palette.accentOrangeColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(05),
                      topRight: Radius.circular(
                        05,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 30.w),
                      Icon(
                        Icons.star,
                        color: R.palette.appWhiteColor,
                      ),
                      SizedBox(width: 11.w),
                      SubHeading(
                        AppLocalizations.of(context).txt_recommended,
                        fontSize: 18,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SubHeading(
                  widget.quote.name ?? 'Basic Cover',
                  color: R.palette.appHeadingTextBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                InkWell(
                  onTap: () {
                    if (isExpanded) {
                      setState(() {
                        isExpanded = false;
                      });
                    } else {
                      setState(() {
                        isExpanded = true;
                      });
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 26.h),
                    child: Container(
                      height: 42.h,
                      width: 42.h,
                      decoration: BoxDecoration(
                          color: R.palette.appPrimaryBlue,
                          boxShadow: [
                            BoxShadow(
                              color: R.palette.appPrimaryBlue.withOpacity(0.3),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 1, //extend the shadow
                              offset: const Offset(
                                0.2, // Move to right 5  horizontally
                                0.1, // Move to bottom 5 Vertically
                              ),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          size: 22.sp,
                          color: R.palette.appWhiteColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: SubHeading(
                        "${widget.quote.quotePrice?.currency ?? 'PKR'} ${widget.quote.quotePrice?.amount?.toStringAsFixed(2) ?? '100'}",
                        color: R.palette.appPrimaryBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: GenericButton(
                        enableShadow: viewModel.selectedQuote == widget.quote,
                        height: 36,
                        allowClickWhenDisabled: true,
                        width: 170,
                        radius: 8,
                        fontSize: 14,
                        fontWeightT: FontWeight.w600,
                        isEnable: viewModel.selectedQuote == widget.quote,
                        onPressed: () {
                          viewModel.setQuote(widget.quote);
                        },
                        text: AppLocalizations.of(context).select,
                      ),
                    ),
                    widget.isRecommended
                        ? SizedBox(height: 33.h)
                        : SizedBox(
                            height: 30.h,
                          )
                  ],
                ),
              ),
            ],
          ),
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
                          subTileData: AppLocalizations.of(context).txt_hong_kong_money('5000'.hardcoded),
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

class QuoteExpansionCardDesktop extends StatefulWidget {
  final String? heading;
  final String? subHeading;
  final bool isRecommended;
  final String? destinationHeading;

  final Quote quote;

  const QuoteExpansionCardDesktop({
    Key? key,
    this.heading,
    this.subHeading,
    this.isRecommended = false,
    this.destinationHeading,
    required this.quote,
  }) : super(key: key);

  @override
  State<QuoteExpansionCardDesktop> createState() =>
      _QuoteExpansionCardDesktopState();
}

class _QuoteExpansionCardDesktopState extends State<QuoteExpansionCardDesktop> {
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
    final viewModel = context.watch<QuoteDetailViewModel>();
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: R.palette.disableButtonColor)),
      child: Column(
        children: [
          widget.isRecommended
              ? Container(
                  height: 46.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: R.palette.accentOrangeColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(05),
                      topRight: Radius.circular(
                        05,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 30.w),
                      Icon(
                        Icons.star,
                        color: R.palette.appWhiteColor,
                      ),
                      SizedBox(width: 11.w),
                      SubHeading(
                        AppLocalizations.of(context).txt_recommended,
                        fontSize: 6,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SubHeading(
                  widget.quote.name ?? 'Basic Cover',
                  color: R.palette.appHeadingTextBlackColor,
                  fontSize: 5,
                  fontWeight: FontWeight.w600,
                ),
                InkWell(
                  onTap: () {
                    if (isExpanded) {
                      setState(() {
                        isExpanded = false;
                      });
                    } else {
                      setState(() {
                        isExpanded = true;
                      });
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 26.h),
                    child: Container(
                      height: 60.h,
                      width: 60.h,
                      decoration: BoxDecoration(
                          color: R.palette.appPrimaryBlue,
                          boxShadow: [
                            BoxShadow(
                              color: R.palette.appPrimaryBlue.withOpacity(0.3),
                              blurRadius: 10.0, // soften the shadow
                              spreadRadius: 1, //extend the shadow
                              offset: const Offset(
                                0.2, // Move to right 5  horizontally
                                0.1, // Move to bottom 5 Vertically
                              ),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_up_rounded
                              : Icons.keyboard_arrow_down_rounded,
                          size: 50,
                          color: R.palette.appWhiteColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: SubHeading(
                        "${widget.quote.quotePrice?.currency ?? 'PKR'} ${widget.quote.quotePrice?.amount?.toStringAsFixed(2) ?? '100'}",
                        color: R.palette.appPrimaryBlue,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: GenericButton(
                        enableShadow: viewModel.selectedQuote == widget.quote,
                        height: 40,
                        allowClickWhenDisabled: true,
                        width: 50,
                        radius: 8,
                        fontSize: 4,
                        fontWeightT: FontWeight.w600,
                        isEnable: viewModel.selectedQuote == widget.quote,
                        onPressed: () {
                          viewModel.setQuote(widget.quote);
                        },
                        text: AppLocalizations.of(context).select,
                      ),
                    ),
                    widget.isRecommended
                        ? SizedBox(height: 33.h)
                        : SizedBox(
                            height: 30.h,
                          )
                  ],
                ),
              ),
            ],
          ),
          Visibility(
            visible: isExpanded,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 27.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.quote.coverGroups != null) ...[
                        Expanded(
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final cover = widget.quote.coverGroups?[index];
                              return ExpansionRow(
                                tileTitle: cover?.name ?? '',
                                data: cover?.coverItems,
                                subTile: "",
                                subTileData: AppLocalizations.of(context).txt_hong_kong_money('5000'.hardcoded),
                                linkText: AppLocalizations.of(context).txt_see_all,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20.h,
                              );
                            },
                          ),
                        ),
                      ],
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 3,
                      ),
                      if (widget.quote.addOnCoverItemsAvailable != null) ...[
                        Expanded(
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final cover =
                                  widget.quote.addOnCoverItemsAvailable?[index];
                              return AddOnWidget(
                                tileTitle: cover?.name ?? '',
                                desription: cover?.shortDescription ?? '',
                                price:
                                    "${cover?.price?.amount ?? ''}${cover?.price?.currency ?? ''}",
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20.h,
                              );
                            },
                          ),
                        ),
                      ]
                    ],
                  ),
                  SizedBox(
                    height: 34.h,
                  )
                ],
              ),
            ),
          ),
        ],
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
