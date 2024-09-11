import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class PaymentCard extends StatelessWidget {
  final String title;
  final Function() onPress;
  final Color? color;
  final Color? textColor;
  final double? width;
  final String imageUrl;

  const PaymentCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.color,
    this.width,
    this.textColor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: PaymentCardMobile(
        title: title,
        imageUrl: imageUrl,
        onPress: onPress,
        color: color,
        width: width,
        textColor: textColor,
      ),
      desktopLayout: PaymentCardDesktop(
        title: title,
        imageUrl: imageUrl,
        onPress: onPress,
        color: color,
        width: width,
        textColor: textColor,
      ),
    );
  }
}

class PaymentCardMobile extends StatelessWidget {
  final String title;
  final Function() onPress;
  final Color? color;
  final Color? textColor;
  final double? width;
  final String imageUrl;

  const PaymentCardMobile(
      {Key? key,
      required this.title,
      required this.imageUrl,
      this.color,
      this.width,
      this.textColor,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: 65.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SubHeading(
                title,
                fontSize: 18,
                color: textColor ?? R.palette.darkBlack,
              ),
              SizedBox(
                width: 10.w,
              ),
              Image.asset(
                imageUrl,
                width: 80.w,
              )
            ],
          )),
    );
  }
}

class PaymentCardDesktop extends StatelessWidget {
  final String title;
  final Function() onPress;
  final Color? color;
  final Color? textColor;
  final double? width;
  final String imageUrl;

  const PaymentCardDesktop(
      {Key? key,
      required this.title,
      required this.imageUrl,
      this.color,
      this.width,
      this.textColor,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: 65.h,
          width: 466.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SubHeading(
                title,
                fontSize: 18,
                color: textColor ?? R.palette.darkBlack,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                width: 11.w,
              ),
              Image.asset(
                imageUrl,
                height: 30.h,
              )
            ],
          )),
    );
  }
}
