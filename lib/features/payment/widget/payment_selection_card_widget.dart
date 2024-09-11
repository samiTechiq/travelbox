import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class PaymentCardSelect extends StatelessWidget {
  final List<String> imageUrl;

  const PaymentCardSelect({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: PaymentCardSelectMobile(imageUrl: imageUrl),
        desktopLayout: PaymentCardSelectDesktop(imageUrl: imageUrl));
  }
}

class PaymentCardSelectMobile extends StatefulWidget {
  final List<String> imageUrl;

  const PaymentCardSelectMobile({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  State<PaymentCardSelectMobile> createState() =>
      _PaymentCardSelectMobileState();
}

class _PaymentCardSelectMobileState extends State<PaymentCardSelectMobile> {
  int? isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.imageUrl.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                isSelected = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: Container(
                height: 65.h,
                width: 98.w,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: isSelected == index
                            ? R.palette.appPrimaryBlue
                            : R.palette.textFieldBorderGreyColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.59.w, top: 13.h, bottom: 12.05.h),
                  child: Image.asset(
                    widget.imageUrl[index],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PaymentCardSelectDesktop extends StatefulWidget {
  final List<String> imageUrl;

  const PaymentCardSelectDesktop({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  State<PaymentCardSelectDesktop> createState() =>
      _PaymentCardSelectDesktopState();
}

class _PaymentCardSelectDesktopState extends State<PaymentCardSelectDesktop> {
  int? isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: widget.imageUrl.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                isSelected = index;
              });
            },
            child: Container(
              height: 84.h,
              width: 173.w,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: isSelected == index
                          ? R.palette.appPrimaryBlue
                          : R.palette.textFieldBorderGreyColor),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 16.h),
                child: Image.asset(
                  widget.imageUrl[index],
                  width: 50.w,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) {
          return SizedBox(
            width: 18.w,
          );
        },
      ),
    );
  }
}
