import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

import '../viewmodel/quote_detail_viewmodel.dart';
import 'expansion_card_page_view_data_widget.dart';

class PageViewWidget extends StatefulWidget {
  final List<PagesData> list;

  const PageViewWidget({Key? key, required this.list}) : super(key: key);

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  int curr = 0;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QuoteDetailViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: 245.h,
            width: double.maxFinite,
            child: PageView.builder(
              padEnds: false,
              controller: PageController(
                viewportFraction: 0.5,
                initialPage: 1,
              ),
              onPageChanged: (value) {
                setState(() {
                  curr = value;
                });
              },
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      left: 5, right: 13.w, top: 10.h, bottom: 10.h),
                  child: Container(
                      decoration: R.theme.cardDecoration,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13.w),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // text
                              children: <Widget>[
                                SizedBox(
                                  height: 16.h,
                                ),
                                SubHeading(
                                  widget.list[index].text ?? "",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: R.palette.darkBlack,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                SubHeading(
                                  widget.list[index].subText ?? "",
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13,
                                  color: R.palette.textFieldHintGreyColor,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                InkWell(
                                    onTap: () {
                                      PagesData value = widget.list[index];
                                      sl<Navigation>().pushWithArgs(
                                        context,
                                        Routes.infoExpandDetailsRoute,
                                        args: {
                                          "page": value,
                                        },
                                      );
                                    },
                                    child: SubHeading(
                                      widget.list[index].linkText ?? "",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: R.palette.appPrimaryBlue,
                                    )),
                                SizedBox(
                                  height: 20.h,
                                ),
                                SubHeading(
                                  widget.list[index].amountText ?? "",
                                  fontSize: 16,
                                  color: R.palette.darkBlack,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    widget.list[index].actionAdd =
                                        !widget.list[index].actionAdd;
                                    final price = double.parse(widget
                                        .list[index].amountText!
                                        .replaceAll(RegExp('[^0-9]'), ''));
                                    setState(() {});
                                    if (widget.list[index].actionAdd) {
                                      viewModel.removeFromPrice(price);
                                    } else {
                                      viewModel.addToPrice(price);
                                    }
                                  },
                                  child: SubHeading(
                                    widget.list[index].actionAdd
                                        ? R.stringRes.quoteDetailScreen
                                            .addButton
                                        : R.stringRes.quoteDetailScreen
                                            .removeButton,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: widget.list[index].actionAdd == true
                                        ? R.palette.darkBlack
                                        : R.palette.appPrimaryBlue,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                              ]),
                        ),
                      )),
                );
              },
            )),
        SizedBox(
          height: 14.h,
        ),
        SizedBox(
          height: 14.h,
        ),
        Center(
          child: DotsIndicator(
            dotsCount: widget.list.length,
            position: curr,
          ),
        )
      ],
    );
  }
}
