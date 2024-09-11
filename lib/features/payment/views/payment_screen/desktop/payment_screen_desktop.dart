import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/payment/payment_information_screen.dart';
import 'package:travelbox/features/payment/widget/payment_card.dart';
import 'package:travelbox/features/quote_details/viewmodel/quote_detail_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class PaymentDesktop extends StatelessWidget {
  final String orderId;

  const PaymentDesktop({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          appBar: GenericAppBarDesktop(
            leading: InkWell(
                onTap: () {
                  sl<Navigation>().goBack(context);
                },
                child: const Icon(Icons.arrow_back_ios)),
            trailing: const SizedBox(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 0.3.sw,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubHeading(
                            AppLocalizations.of(context).txt_lets_start_payment,
                            fontSize: 34,
                            fontFamily: R.theme.larkenLightFontFamily,
                            fontWeight: FontWeight.normal,
                            color: R.palette.appHeadingTextBlackColor,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Center(
                            child: Stack(
                              children: [
                                Image.asset(
                                  R.assets.graphics.boringStuff.path,
                                  height: 230,
                                  width: 355,
                                  fit: BoxFit.cover,
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SubHeading2(
                                          AppLocalizations.of(context)
                                              .txt_your_quote,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: R.theme.interRegular,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          textBaseline:
                                              TextBaseline.ideographic,
                                          children: <Widget>[
                                            SubHeading2(
                                              sl<QuoteDetailViewModel>()
                                                      .currency ??
                                                  'HK',
                                              fontSize: 27,
                                              fontFamily:
                                                  R.theme.larkenDemoRegular,
                                              fontWeight: FontWeight.w700,
                                              color: R.palette.appPrimaryBlue,
                                            ),
                                            SubHeading2(
                                              '\$',
                                              fontSize: 27,
                                              fontFamily: R.theme.larken,
                                              fontWeight: FontWeight.w700,
                                              color: R.palette.appPrimaryBlue,
                                            ),
                                            SubHeading2(
                                              sl<QuoteDetailViewModel>()
                                                  .totalPrice
                                                  .toStringAsFixed(2),
                                              fontSize: 45,
                                              fontFamily: R.theme.larken,
                                              fontWeight: FontWeight.w700,
                                              color: R.palette.appPrimaryBlue,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            decoration: R.theme.genericCardDecoration,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 15.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  SubHeading(
                                    AppLocalizations.of(context)
                                        .txt_how_would_you_like_to_pay,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: R.palette.mediumBlack,
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.lock,
                                        size: 20.w,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: SubHeading(
                                          AppLocalizations.of(context)
                                              .txt_secure_payments,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: R.palette.mediumBlack,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 24.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _showCustomDialog(context);
                                    },
                                    child: Container(
                                      height: 65,
                                      width: 466,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: R.palette.white,
                                        border: Border.all(
                                          color: R
                                              .palette.textFieldBorderGreyColor,
                                          width: 1,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 29.w, right: 18.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SubHeading(
                                              'Card',
                                              fontSize: 20,
                                              color: R.palette.darkBlack,
                                              fontWeight: FontWeight.w900,
                                              fontFamily: R.theme.interRegular,
                                            ),
                                            const Spacer(),
                                            Image.asset(
                                              R.assets.graphics.master.path,
                                              width: 46.w,
                                            ),
                                            SizedBox(
                                              width: 14.0.w,
                                            ),
                                            Image.asset(
                                              R.assets.graphics.visa.path,
                                              width: 46.w,
                                            ),
                                            SizedBox(
                                              width: 14.0.w,
                                            ),
                                            Image.asset(
                                              R.assets.graphics.amex.path,
                                              width: 46.w,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  PaymentCard(
                                    title: AppLocalizations.of(context)
                                        .btn_continue_with,
                                    imageUrl: R.assets.graphics.paypal.path,
                                    color: R.palette.yellowColor,
                                    onPress: () {},
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  PaymentCard(
                                    title: AppLocalizations.of(context)
                                        .btn_pay_with,
                                    imageUrl: R.assets.graphics.apPay.path,
                                    color: R.palette.darkBlack,
                                    width: 7,
                                    textColor: R.palette.appWhiteColor,
                                    onPress: () {},
                                  ),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 26.h,
                          ),
                          SizedBox(
                            width: 0.78.sw,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        bottom: 1.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: R.palette.dullBlack,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        '${AppLocalizations.of(context).not_ready_to_buy} ${AppLocalizations.of(context).click} ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                          color: R.palette.dullBlack,
                                        ),
                                      ),
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        bottom: 1.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: R.palette.appPrimaryBlue,
                                            width: 1.0, // Underline thickness
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        '${AppLocalizations.of(context).here} ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                          color: R.palette.appPrimaryBlue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        bottom: 1.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: R.palette.dullBlack,
                                            width: 1.0, // Underline thickness
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        '${AppLocalizations.of(context).txt_to} ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                          color: R.palette.dullBlack,
                                        ),
                                      ),
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        bottom: 1.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: R.palette.dullBlack,
                                            width: 1.0, // Underline thickness
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .txt_email_your_quote,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                          color: R.palette.dullBlack,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 26.h,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          backgroundColor: R.palette.appWhiteColor,
          surfaceTintColor: R.palette.transparent,
          child: kIsWeb
              ? const PaymentInformationScreen()
              : SizedBox(
                  width: 0.45.sw,
                  height: 0.82.sh,
                  child: const PaymentInformationScreen()),
        );
      },
    );
  }
}
