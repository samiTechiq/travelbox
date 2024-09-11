import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class InformPaymentFailedDialog extends StatelessWidget {
  const InformPaymentFailedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: InformPaymentFailedDialogMobile(),
      desktopLayout: InformPaymentFailedDialogDesktop(),
    );
  }
}

class InformPaymentFailedDialogDesktop extends StatelessWidget {
  const InformPaymentFailedDialogDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        backgroundColor: R.palette.white,
        surfaceTintColor: R.palette.white,
        child: SizedBox(
          width: 0.35.sw,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).title_payment_failed,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: R.palette.darkBlack,
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    SubHeading(
                      AppLocalizations.of(context).description_payment_failed,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: R.palette.lightGray,
                    ),
                  ],
                ),
                // const Spacer(),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Image.asset(
                    R.assets.graphics.imgFailed.path,
                    height: 163.h,
                    width: 185.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GenericButton(
                  width: 475.w,
                  onPressed: () async {
                    Navigator.of(context).pop();
                    // Future.delayed(Duration.zero, () {
                    //   sl<Navigation>()
                    //   // ignore: use_build_context_synchronously
                    //       .push(context, Routes.referFriendRoute);
                    // });
                  },
                  text: AppLocalizations.of(context).btn_close,
                  fontSize: 20,
                  isEnable: true,
                  color: const Color(0xffED1C24),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class InformPaymentFailedDialogMobile extends StatelessWidget {
  const InformPaymentFailedDialogMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 25.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        backgroundColor: R.palette.appWhiteColor,
        surfaceTintColor: R.palette.transparent,
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 30.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      AppLocalizations.of(context).payment_order_placed,
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: R.palette.darkBlack,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SubHeading(
                      AppLocalizations.of(context)
                          .payment_inform_confirm_email,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: R.palette.lightGray,
                    ),
                  ],
                ),
                // const Spacer(),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Image.asset(
                    R.assets.graphics.imgFailed.path,
                    height: 159.h,
                    width: 171.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GenericButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    // Future.delayed(Duration.zero, () {
                    //   sl<Navigation>()
                    //   // ignore: use_build_context_synchronously
                    //       .push(context, Routes.referFriendRoute);
                    // });
                  },
                  text: AppLocalizations.of(context).btn_close,
                  fontSize: 20,
                  isEnable: true,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

