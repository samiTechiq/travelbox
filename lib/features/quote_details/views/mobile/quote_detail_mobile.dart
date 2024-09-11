import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/questions/viewmodel/common_quote_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/titile_widget_builder.dart';
import 'package:travelbox/features/quote_details/viewmodel/quote_detail_viewmodel.dart';
import 'package:travelbox/features/quote_details/widgets/quote_expansion_card.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/number_utils.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class QuoteDetailsMobile extends StatelessWidget {
  QuoteDetailsMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuoteDetailViewModel>.value(
      value: sl<QuoteDetailViewModel>(),
      builder: (context, child) {
        final quotes = sl<QuoteData>().quotes;
        final viewModel = context.watch<QuoteDetailViewModel>();
        return Container(
          color: R.palette.appBackgroundColor,
          child: SafeArea(
            bottom: false,
            child: Scaffold(
                backgroundColor: R.palette.appBackgroundColor,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenericAppBar(
                          leading: Padding(
                            padding: EdgeInsets.only(right: 9.w),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: R.palette.mediumBlack,
                            ),
                          ),
                          onLeadingPressed: () {
                            sl<Navigation>().goBack(context);
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Heading(
                          AppLocalizations.of(context).here_your_quote,
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                          fontFamily: R.theme.larkenLightFontFamily,
                          color: R.palette.appHeadingTextBlackColor,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        TitleWidgetBuilder(
                          timeFrame:
                          sl<CoverQuoteViewModel>().timeframeSelected,
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                        ListView.separated(
                          itemBuilder: (context, index) {
                            final quote = quotes[index];
                            return QuoteExpansionCard(
                              heading: quote.name,
                              subHeading: AppLocalizations.of(context).txt_hong_kong_money(NumberUtils.formatPriceNumber(200)),
                              destinationHeading: AppLocalizations.of(context).txt_hong_kong_money(NumberUtils.formatPriceNumber(200)),
                              isRecommended: quote.name != null
                                  ? quote.name!
                                  .toLowerCase()
                                  .contains('comprehensive')
                                  : false,
                              quote: quote,
                            );
                          },
                          separatorBuilder: (context, _) {
                            return SizedBox(
                              height: 30.h,
                            );
                          },
                          itemCount: quotes.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        SizedBox(
                          height: 55.h,
                        ),
                        GenericButton(
                          onPressed: () async {
                            EasyLoading.show();
                            final result = await viewModel.getOrder();
                            EasyLoading.dismiss();
                            if (result == null) return;

                            Future.delayed(const Duration(seconds: 0), () {
                              sl<Navigation>().pushWithArgs(
                                  // ignore: use_build_context_synchronously
                                  context, Routes.detailsPolicyRoute,
                                  args: result);
                            });
                          },
                          text:
                          AppLocalizations.of(context).txt_get_covered_for('${viewModel.selectedQuote?.quotePrice?.currency ?? ''}${viewModel.totalPrice.toInt()}'),
                          isEnable: viewModel.selectedQuote != null,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        RichText(
                          // textAlign: TextAlign.center,
                          text: TextSpan(
                            style: defaultStyle,
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${AppLocalizations.of(context).txt_the} ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: R.theme.interRegular,
                                      fontSize: 16.sp,
                                      color: R.palette.textFieldHintGreyColor)),
                              TextSpan(
                                  text: AppLocalizations.of(context).policy_wording.toLowerCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                    fontSize: 16.sp,
                                    decoration: TextDecoration.underline,
                                    color: R.palette.appPrimaryBlue,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                              TextSpan(
                                  text: ' ${AppLocalizations.of(context).txt_quote_detail_policy}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: R.theme.interRegular,
                                      fontSize: 16.sp,
                                      color: R.palette.textFieldHintGreyColor)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }

  final TextStyle defaultStyle = TextStyle(
    color: R.palette.appHeadingTextBlackColor,
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    fontFamily: R.theme.larkenDemoRegular,
  );
  final TextStyle linkStyle = TextStyle(
    color: R.palette.appPrimaryBlue,
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    fontFamily: R.theme.larkenDemoRegular,
  );
}
