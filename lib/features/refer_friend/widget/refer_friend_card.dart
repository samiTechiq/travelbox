import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';
import 'package:travelbox/utils/widgets/text_fields/app_text_field.dart';

class ReferFriendCard extends StatelessWidget {
  final String title;
  final String? description;
  final String? subTitle;

  const ReferFriendCard(
      {super.key, required this.title, this.description, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: ReferFriendCardMobile(
        title: title,
        description: description,
        subTitle: subTitle,
      ),
      desktopLayout: ReferFriendCardDesktop(
        title: title,
        description: description,
        subTitle: subTitle,
      ),
    );
  }
}

class ReferFriendCardDesktop extends StatelessWidget {
  final String title;
  final String? description;
  final String? subTitle;

  const ReferFriendCardDesktop(
      {Key? key, required this.title, this.description, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: R.theme.genericCardDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            SubHeading(
              title,
              fontSize: 5,
              fontWeight: FontWeight.w600,
              color: R.palette.darkBlack,
            ),
            SizedBox(
              height: 16.h,
            ),
            Visibility(
                visible: description != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      description ?? "",
                      fontWeight: FontWeight.w400,
                      fontSize: 5,
                      color: R.palette.textFieldHintGreyColor,
                      maxLines: 5,
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    SubHeading(
                      subTitle ?? "",
                      fontSize: 5,
                      fontWeight: FontWeight.w600,
                      color: R.palette.darkBlack,
                    ),
                    SizedBox(
                      height: 27.h,
                    )
                  ],
                )),
            GenericTextField(
              hintText: "https://appstore/lylaapp.com",
              useBottomPadding: false,
              trailingIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.copy,
                    size: 5.0.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.share_rounded,
                    size: 5.0.w,
                  )
                ],
              ),
              hintStyle: TextStyle(
                fontSize: 5.sp,
                fontFamily: R.theme.interRegular,
                fontWeight: FontWeight.w600,
                height: 1.4,
                color: R.palette.mediumBlack,
              ),
              textStyle: TextStyle(
                fontSize: 5.sp,
                fontFamily: R.theme.interRegular,
                fontWeight: FontWeight.w600,
                color: R.palette.mediumBlack,
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Row(
              children: [
                Expanded(
                  child: SubHeading(
                    AppLocalizations.of(context).txt_give_us_a_share,
                    fontSize: 5,
                    color: R.palette.darkBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(R.assets.graphics.messenger.path, width: 6.w),
                SizedBox(
                  width: 5.w,
                ),
                Image.asset(R.assets.graphics.call.path, width: 6.w),
                SizedBox(
                  width: 5.w,
                ),
                Image.asset(R.assets.graphics.mail.path, width: 6.w),
              ],
            ),
            SizedBox(
              height: 34.h,
            )
          ],
        ),
      ),
    );
  }
}

class ReferFriendCardMobile extends StatelessWidget {
  final String title;
  final String? description;
  final String? subTitle;

  const ReferFriendCardMobile(
      {Key? key, required this.title, this.description, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: R.theme.genericCardDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            SubHeading(
              title,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: R.palette.darkBlack,
            ),
            SizedBox(
              height: 25.h,
            ),
            Visibility(
                visible: description != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SubHeading(
                      description ?? "",
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: R.palette.lightGray,
                      maxLines: 5,
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    SubHeading(
                      subTitle ?? "",
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: R.palette.darkBlack,
                    ),
                    SizedBox(
                      height: 27.h,
                    )
                  ],
                )),
            GenericTextField(
              hintText: "https://appstore/lylaapp.com".hardcoded,
              useBottomPadding: false,
              hintStyle: TextStyle(
                fontSize: 16.sp,
                fontFamily: R.theme.interRegular,
                fontWeight: FontWeight.w500,
                height: 1.4,
                color: R.palette.lightGray,
              ),
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontFamily: R.theme.interRegular,
                fontWeight: FontWeight.w500,
                color: R.palette.lightGray,
              ),
              trailingIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.copy),
                  SizedBox(
                    width: 21.w,
                  ),
                  const Icon(Icons.share_rounded)
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Expanded(
                  child: SubHeading(
                    AppLocalizations.of(context).txt_give_us_a_share,
                    fontSize: 18,
                    color: R.palette.mediumBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset(R.assets.graphics.messenger.path, width: 27.w),
                SizedBox(
                  width: 22.w,
                ),
                Image.asset(R.assets.graphics.call.path, width: 27.w),
                SizedBox(
                  width: 22.w,
                ),
                Image.asset(R.assets.graphics.mail.path, width: 27.w),
              ],
            ),
            SizedBox(
              height: 34.h,
            )
          ],
        ),
      ),
    );
  }
}
