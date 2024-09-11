import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/payment/inform_payment_failed_dialog.dart';
import 'package:travelbox/features/payment/inform_payment_success_dialog.dart';
import 'package:travelbox/features/payment/utils/card_number_formatter.dart';
import 'package:travelbox/features/payment/utils/expiration_date_formatter.dart';
import 'package:travelbox/features/payment/viewmodel/payment_information_screen_viewmodel.dart';
import 'package:travelbox/features/payment/widget/payment_selection_card_widget.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_square_box.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';
import 'package:travelbox/utils/widgets/text_fields/app_text_field.dart';

class PaymentInformationScreen extends StatelessWidget {
  const PaymentInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: PaymentInformationScreenMobile(),
      desktopLayout: PaymentInformationScreenDesktop(),
    );
  }
}

class PaymentInformationScreenDesktop extends StatefulWidget {
  const PaymentInformationScreenDesktop({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentInformationScreenDesktop> createState() =>
      _PaymentInformationScreenDesktopState();
}

class _PaymentInformationScreenDesktopState
    extends State<PaymentInformationScreenDesktop> {
  late StreamSubscription<bool> keyboardSubscription;
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        isKeyboardVisible = visible;
      });
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  Future<void> _showInformPaymentSuccess(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const InformPaymentSuccessDialog();
      },
    );
  }

  Future<void> _showInformPaymentFailed(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const InformPaymentFailedDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      R.assets.graphics.master.path,
      R.assets.graphics.visa.path,
      R.assets.graphics.amex.path,
    ];
    return ChangeNotifierProvider.value(
      value: sl<PaymentInformationScreenViewModel>(),
      builder: (context, index) {
        final viewModel = context.watch<PaymentInformationScreenViewModel>();

        return SizedBox(
          width: (624/1440).sw,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              child: Stack(
                children: [
                  Positioned(
                    top: 10.h,
                    child: SubHeading(
                      AppLocalizations.of(context).txt_payment_information,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: R.palette.darkBlack,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: SizedBox(
                              width: 19.w,
                              child: Image.asset(
                                R.assets.graphics.cross.path,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            SubHeading(
                              AppLocalizations.of(context).txt_select_your_card,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: R.palette.lightGray,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            PaymentCardSelect(
                              imageUrl: imageUrls,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      SubHeading(
                        AppLocalizations.of(context).txt_name,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: R.palette.lightGray,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      PhysicalModel(
                        borderRadius: BorderRadius.circular(11.51),
                        color: Colors.white,
                        elevation: 5.0,
                        shadowColor: R.palette.appWhiteColor.withOpacity(0.3),
                        child: GenericTextField(
                          hintText: AppLocalizations.of(context).txt_name_hint,
                          borderColor:
                              R.palette.paymentFieldHintColor.withOpacity(0.50),
                          verticalContentPadding: 19,
                          filled: true,
                          fillColor: R.palette.appWhiteColor,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z ]')),
                          ],
                          hintStyle: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w500,
                            color: R.palette.mediumBlack,
                          ),
                          textStyle: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w600,
                            color: R.palette.mediumBlack,
                          ),
                          useBottomPadding: false,
                          onChange: (value) {
                            viewModel.setCardHolderName(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      SubHeading(
                        AppLocalizations.of(context).txt_card_number,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: R.palette.lightGray,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      PhysicalModel(
                        borderRadius: BorderRadius.circular(11.51),
                        color: Colors.white,
                        elevation: 5.0,
                        shadowColor: R.palette.appWhiteColor.withOpacity(0.3),
                        child: GenericTextField(
                          hintText:
                              AppLocalizations.of(context).txt_card_number_hint,
                          borderColor:
                              R.palette.paymentFieldHintColor.withOpacity(0.50),
                          // trailingIcon: viewModel.cardTypeImage != ''
                          //     ? Image.asset(
                          //         viewModel.cardTypeImage,
                          //         width: 43.42.w,
                          //       )
                          //     : null,
                          textInputType: TextInputType.number,
                          filled: true,
                          fillColor: R.palette.appWhiteColor,
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w500,
                            color: R.palette.mediumBlack,
                          ),
                          textStyle: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w600,
                            color: R.palette.mediumBlack,
                          ),
                          useBottomPadding: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CardNumberFormatter(),
                          ],
                          onChange: (value) {
                            viewModel.detectCardType(value);
                            viewModel.setCardNumber(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SubHeading(
                                  AppLocalizations.of(context).txt_cvv,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: R.palette.lightGray,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                PhysicalModel(
                                  borderRadius: BorderRadius.circular(11.51),
                                  color: Colors.white,
                                  elevation: 5.0,
                                  shadowColor:
                                      R.palette.appWhiteColor.withOpacity(0.3),
                                  child: GenericTextField(
                                    hintText: AppLocalizations.of(context)
                                        .txt_cvv_hint,
                                    borderColor: R.palette.paymentFieldHintColor
                                        .withOpacity(0.50),
                                    verticalContentPadding: 19,
                                    filled: true,
                                    fillColor: R.palette.appWhiteColor,
                                    hintStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w500,
                                      color: R.palette.mediumBlack,
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w600,
                                      color: R.palette.mediumBlack,
                                    ),
                                    textInputType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                    useBottomPadding: false,
                                    onChange: (value) {
                                      viewModel.setCvv(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 54.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SubHeading(
                                  AppLocalizations.of(context)
                                      .txt_expiration_date,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: R.palette.lightGray,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                PhysicalModel(
                                  borderRadius: BorderRadius.circular(11.51),
                                  color: Colors.white,
                                  elevation: 5.0,
                                  shadowColor:
                                      R.palette.appWhiteColor.withOpacity(0.3),
                                  child: GenericTextField(
                                    hintText: AppLocalizations.of(context)
                                        .txt_expiration_date_hint,
                                    borderColor: R.palette.paymentFieldHintColor
                                        .withOpacity(0.50),
                                    verticalContentPadding: 19,
                                    textInputType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CardExpirationFormatter(),
                                      LengthLimitingTextInputFormatter(7),
                                    ],
                                    filled: true,
                                    fillColor: R.palette.appWhiteColor,
                                    hintStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w500,
                                      color: R.palette.mediumBlack,
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w600,
                                      color: R.palette.mediumBlack,
                                    ),
                                    useBottomPadding: false,
                                    onChange: (value) {
                                      viewModel.setExpiryDate(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        children: [
                          const SquareBox(
                            checkValue: false,
                            squareBoxSize: 20,
                            iconSize: 5,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            child: SubHeading(
                              AppLocalizations.of(context)
                                  .txt_save_credit_card_information,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: R.palette.lightGray.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      GenericButton(
                        width: (560/1440).sw,
                        onPressed: () async {
                          // final orderId =
                          //     sl<QuoteDetailViewModel>().order.orderId;
                          // if (!viewModel.isCardNumberValid()) {
                          //   EasyLoading.showError(R
                          //       .stringRes.errorString.pleaseFillFormCorrectly);
                          //   return;
                          // }
                          // if (orderId == null) {
                          //   return;
                          // }
                          // EasyLoading.show();
                          // try {
                          //   final result = await viewModel.makePayment(
                          //     orderId,
                          //     sl<QuoteDetailViewModel>().currency ?? '',
                          //     sl<QuoteDetailViewModel>()
                          //         .totalPrice
                          //         .toInt()
                          //         .toString(),
                          //   );
                          //   EasyLoading.dismiss();
                          //   if (result) {
                          //     Future.delayed(Duration.zero, () {
                          //       sl<Navigation>()
                          //           // ignore: use_build_context_synchronously
                          //           .push(context, Routes.referFriendRoute);
                          //     });
                          //   }
                          //   return;
                          // } catch (e) {
                          //   EasyLoading.showError(
                          //       R.stringRes.errorString.somethingWentWrong);
                          // }
                          // _showPaymentSuccessDialog(context);
                          if (viewModel.isCardNumberValid()) {
                            _showInformPaymentSuccess(context);
                          } else {
                            _showInformPaymentFailed(context);
                          }
                          // Future.delayed(Duration.zero, () {
                          //   sl<Navigation>()
                          //       // ignore: use_build_context_synchronously
                          //       .push(context, Routes.referFriendRoute);
                          // });
                        },
                        text: AppLocalizations.of(context).btn_pay_now,
                        fontSize: 20,
                        isEnable: viewModel.isValid,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      if (isKeyboardVisible) ...[
                        SizedBox(height: 150.h),
                      ]
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PaymentInformationScreenMobile extends StatefulWidget {
  const PaymentInformationScreenMobile({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentInformationScreenMobile> createState() =>
      _PaymentInformationScreenMobileState();
}

class _PaymentInformationScreenMobileState
    extends State<PaymentInformationScreenMobile> {
  late StreamSubscription<bool> keyboardSubscription;
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        isKeyboardVisible = visible;
      });
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
  }

  // void _showPaymentSuccessDialog(BuildContext context) {
  //   showGeneralDialog(
  //     context: context,
  //     barrierLabel: "Barrier",
  //     barrierDismissible: false,
  //     transitionDuration: const Duration(milliseconds: 200),
  //     transitionBuilder: (_, anim, __, child) {
  //       Tween<Offset> tween;
  //       if (anim.status == AnimationStatus.reverse) {
  //         tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
  //       } else {
  //         tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
  //       }
  //
  //       return SlideTransition(
  //         position: tween.animate(anim),
  //         child: FadeTransition(
  //           opacity: anim,
  //           child: child,
  //         ),
  //       );
  //     },
  //     pageBuilder: (_, __, ___) {
  //       return Center(
  //         child: Container(
  //           margin: const EdgeInsets.symmetric(horizontal: 20),
  //           padding: const EdgeInsets.all(30),
  //           decoration: BoxDecoration(
  //               color: Colors.white, borderRadius: BorderRadius.circular(15)),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   SubHeading(
  //                     AppLocalizations.of(context).payment_order_placed,
  //                     fontWeight: FontWeight.w600,
  //                     fontSize: 24,
  //                     color: R.palette.darkBlack,
  //                   ),
  //                   const SizedBox(
  //                     height: 20,
  //                   ),
  //                   SubHeading(
  //                     AppLocalizations.of(context).payment_inform_confirm_email,
  //                     fontWeight: FontWeight.w400,
  //                     fontSize: 16,
  //                     color: R.palette.darkBlack,
  //                   ),
  //                 ],
  //               ),
  //               const Spacer(),
  //               SvgPicture.asset(
  //                 R.assets.graphics.iconSuccess.path,
  //                 height: 180,
  //                 width: 180,
  //                 fit: BoxFit.fitWidth,
  //               ),
  //               const Spacer(),
  //               GenericButton(
  //                 onPressed: () async {
  //                   Navigator.of(context).pop();
  //                   Future.delayed(Duration.zero, () {
  //                     sl<Navigation>()
  //                         // ignore: use_build_context_synchronously
  //                         .push(context, Routes.referFriendRoute);
  //                   });
  //                 },
  //                 text: 'Close',
  //                 fontSize: 18,
  //                 isEnable: true,
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  Future<void> _showInformPaymentSuccess(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const InformPaymentSuccessDialog();
      },
    );
  }

  Future<void> _showInformPaymentFailed(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const InformPaymentFailedDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      R.assets.graphics.master.path,
      R.assets.graphics.visa.path,
      R.assets.graphics.amex.path,
    ];
    return ChangeNotifierProvider.value(
      value: sl<PaymentInformationScreenViewModel>(),
      builder: (context, index) {
        final viewModel = context.watch<PaymentInformationScreenViewModel>();

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
                      // GenericAppBar(
                      //   leading: InkWell(
                      //       onTap: () {
                      //         sl<Navigation>().goBack(context);
                      //       },
                      //       child: const Icon(Icons.arrow_back_ios)),
                      //   trailing: const SizedBox(),
                      //   center: SubHeading(
                      //     R.stringRes.paymentInformation.paymentInformation,
                      //     fontSize: 18,
                      //     fontWeight: FontWeight.w600,
                      //     color: R.palette.darkBlack,
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 38.h,
                      // ),
                      GenericAppBarMobile(
                        leading: Padding(
                          padding: EdgeInsets.only(right: 12.w),
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
                      SubHeading(
                        AppLocalizations.of(context).txt_payment_information,
                        fontSize: 32,
                        fontFamily: R.theme.larkenLightFontFamily,
                        fontWeight: FontWeight.w400,
                        color: R.palette.appHeadingTextBlackColor,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        // height: 168.h,
                        width: double.maxFinite,
                        decoration: R.theme.genericCardDecoration,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 30.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   height: 30.h,
                              // ),
                              SubHeading(
                                AppLocalizations.of(context)
                                    .txt_select_your_card,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: R.palette.mediumBlack,
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              PaymentCardSelect(
                                imageUrl: imageUrls,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 42.85.h,
                      ),
                      SubHeading(
                        AppLocalizations.of(context).txt_name,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: R.palette.lightGray,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      PhysicalModel(
                        borderRadius: BorderRadius.circular(11.51),
                        color: Colors.white,
                        elevation: 5.0,
                        shadowColor: R.palette.appWhiteColor.withOpacity(0.3),
                        child: GenericTextField(
                          hintText: AppLocalizations.of(context).txt_name_hint,
                          borderColor: R.palette.appWhiteColor,
                          verticalContentPadding: 19,
                          filled: true,
                          fillColor: R.palette.appWhiteColor,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp('[a-zA-Z ]')),
                          ],
                          hintStyle: TextStyle(
                              fontSize: 18.42.sp,
                              fontFamily: R.theme.interRegular,
                              fontWeight: FontWeight.w600,
                              color: R.palette.mediumBlack),
                          textStyle: TextStyle(
                            fontSize: 18.42.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w600,
                            color: R.palette.mediumBlack,
                          ),
                          useBottomPadding: false,
                          onChange: (value) {
                            viewModel.setCardHolderName(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 33.12.h,
                      ),
                      SubHeading(
                        AppLocalizations.of(context).txt_card_number,
                        fontSize: 18,
                        color: R.palette.lightGray,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      PhysicalModel(
                        borderRadius: BorderRadius.circular(11.51),
                        color: Colors.white,
                        elevation: 5.0,
                        shadowColor: R.palette.appWhiteColor.withOpacity(0.3),
                        child: GenericTextField(
                          hintText:
                              AppLocalizations.of(context).txt_card_number_hint,
                          borderColor:
                              R.palette.paymentFieldHintColor.withOpacity(0.50),
                          // trailingIcon: viewModel.cardTypeImage != ''
                          //     ? Image.asset(
                          //         viewModel.cardTypeImage,
                          //         width: 43.42.w,
                          //       )
                          //     : null,
                          textInputType: TextInputType.number,
                          filled: true,
                          fillColor: R.palette.appWhiteColor,
                          hintStyle: TextStyle(
                            fontSize: 18.42.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w600,
                            color: R.palette.mediumBlack,
                          ),
                          textStyle: TextStyle(
                            fontSize: 18.42.sp,
                            fontFamily: R.theme.interRegular,
                            fontWeight: FontWeight.w600,
                            color: R.palette.mediumBlack,
                          ),
                          useBottomPadding: false,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(16),
                            CardNumberFormatter(),
                          ],
                          onChange: (value) {
                            viewModel.detectCardType(value);
                            viewModel.setCardNumber(value);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 36.12.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SubHeading(
                                  AppLocalizations.of(context).txt_cvv,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: R.palette.lightGray,
                                ),
                                SizedBox(
                                  height: 13.24.h,
                                ),
                                PhysicalModel(
                                  borderRadius: BorderRadius.circular(11.51),
                                  color: Colors.white,
                                  elevation: 5.0,
                                  shadowColor:
                                      R.palette.appWhiteColor.withOpacity(0.3),
                                  child: GenericTextField(
                                    hintText: AppLocalizations.of(context)
                                        .txt_cvv_hint,
                                    borderColor: R.palette.appWhiteColor,
                                    verticalContentPadding: 19,
                                    filled: true,
                                    fillColor: R.palette.appWhiteColor,
                                    hintStyle: TextStyle(
                                      fontSize: 18.42.sp,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w600,
                                      color: R.palette.mediumBlack,
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: 18.42.sp,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w600,
                                      color: R.palette.mediumBlack,
                                    ),
                                    textInputType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(4),
                                    ],
                                    useBottomPadding: false,
                                    onChange: (value) {
                                      viewModel.setCvv(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 29.94.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SubHeading(
                                  AppLocalizations.of(context)
                                      .txt_expiration_date,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: R.palette.lightGray,
                                ),
                                SizedBox(
                                  height: 13.24.h,
                                ),
                                PhysicalModel(
                                  borderRadius: BorderRadius.circular(11.51),
                                  color: Colors.white,
                                  elevation: 5.0,
                                  shadowColor:
                                      R.palette.appWhiteColor.withOpacity(0.3),
                                  child: GenericTextField(
                                    hintText: AppLocalizations.of(context)
                                        .txt_expiration_date_hint,
                                    borderColor: R.palette.appWhiteColor,
                                    verticalContentPadding: 19,
                                    textInputType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CardExpirationFormatter(),
                                      LengthLimitingTextInputFormatter(7),
                                    ],
                                    filled: true,
                                    fillColor: R.palette.appWhiteColor,
                                    hintStyle: TextStyle(
                                        fontSize: 18.42.sp,
                                        fontFamily: R.theme.interRegular,
                                        fontWeight: FontWeight.w600,
                                        color: R.palette.mediumBlack),
                                    textStyle: TextStyle(
                                      fontSize: 18.42.sp,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w600,
                                      color: R.palette.mediumBlack,
                                    ),
                                    useBottomPadding: false,
                                    onChange: (value) {
                                      viewModel.setExpiryDate(value);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 36.64.h,
                      ),
                      Row(
                        children: [
                          const SquareBox(
                            checkValue: true,
                            iconSize: 18,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            child: SubHeading(
                              AppLocalizations.of(context)
                                  .txt_save_credit_card_information,
                              fontSize: 18,
                              color: R.palette.paymentFieldHintColor
                                  .withOpacity(0.50),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      GenericButton(
                        onPressed: () async {
                          // final orderId =
                          //     sl<QuoteDetailViewModel>().order.orderId;
                          // if (!viewModel.isCardNumberValid()) {
                          //   EasyLoading.showError(R
                          //       .stringRes.errorString.pleaseFillFormCorrectly);
                          //   return;
                          // }
                          // if (orderId == null) {
                          //   return;
                          // }
                          // EasyLoading.show();
                          // try {
                          //   final result = await viewModel.makePayment(
                          //     orderId,
                          //     sl<QuoteDetailViewModel>().currency ?? '',
                          //     sl<QuoteDetailViewModel>()
                          //         .totalPrice
                          //         .toInt()
                          //         .toString(),
                          //   );
                          //   EasyLoading.dismiss();
                          //   if (result) {
                          //     Future.delayed(Duration.zero, () {
                          //       sl<Navigation>()
                          //           .push(context, Routes.referFriendRoute);
                          //     });
                          //   }
                          //   return;
                          // } catch (e) {
                          //   EasyLoading.showError(
                          //       R.stringRes.errorString.somethingWentWrong);
                          // }
                          // _showPaymentSuccessDialog(context);
                          if (viewModel.isCardNumberValid()) {
                            _showInformPaymentSuccess(context);
                          } else {
                            _showInformPaymentFailed(context);
                          }

                          // Future.delayed(Duration.zero, () {
                          //   sl<Navigation>()
                          //       // ignore: use_build_context_synchronously
                          //       .push(context, Routes.referFriendRoute);
                          // });
                        },
                        text: AppLocalizations.of(context).btn_pay_now,
                        fontSize: 18,
                        // isEnable: viewModel.isValid,
                        isEnable: true,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      if (isKeyboardVisible) ...[
                        SizedBox(height: 150.h),
                      ]
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
