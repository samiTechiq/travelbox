import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';


class AddOnUpdated extends StatelessWidget{
  final String title;
  final String price;

  const AddOnUpdated({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: AddOnUpdatedMobile(
        title: title,
        price: price,
      ),
      desktopLayout: AddOnUpdatedDesktop(
        title: title,
        price: price,
      ),
    );
  }

}

class AddOnUpdatedMobile extends StatefulWidget {
  final String? title;
  final String? price;

  const AddOnUpdatedMobile({
    Key? key,
    this.title,
    this.price,
  }) : super(key: key);

  @override
  State<AddOnUpdatedMobile> createState() => _AddOnUpdatedMobileState();
}

class _AddOnUpdatedMobileState extends State<AddOnUpdatedMobile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          widget.price!.isNotEmpty ? R.assets.graphics.checkedGreen.path : R.assets.graphics.line.path,
          height: 17.h,
          width: 17.w,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(
          width: 8.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(
              widget.title ?? "",
              color: R.palette.mediumBlack,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
            SubHeading(
              'HK\$${widget.price!}',
              color: R.palette.mediumBlack,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ],
        )
      ],
    );
  }
}

class AddOnUpdatedDesktop extends StatefulWidget {
  final String? title;
  final String? price;

  const AddOnUpdatedDesktop({
    Key? key,
    this.title,
    this.price,
  }) : super(key: key);

  @override
  State<AddOnUpdatedDesktop> createState() => _AddOnUpdatedDesktopState();
}

class _AddOnUpdatedDesktopState extends State<AddOnUpdatedDesktop> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.095.sw,
      height: 47.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.price!.isNotEmpty ? R.assets.graphics.checkedGreen.path : R.assets.graphics.line.path,
            height: 15.w,
            width: 14.h,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 12.78.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubHeading(
                widget.title ?? "",
                color: R.palette.appHeadingTextBlackColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                maxLines: 1,
              ),
              SubHeading(
                'HK\$${widget.price!}',
                color: R.palette.appHeadingTextBlackColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                maxLines: 1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
