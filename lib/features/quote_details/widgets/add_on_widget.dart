import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/resources/r.dart';
import '../../../utils/widgets/app_text.dart';

class AddOnWidget extends StatelessWidget {
  final String tileTitle;
  final String price;
  final String desription;

  const AddOnWidget(
      {super.key,
      required this.tileTitle,
      required this.desription,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubHeading(
                tileTitle,
                fontSize: 5,
                fontWeight: FontWeight.w500,
                color: R.palette.darkBlack,
              ),
              SizedBox(
                height: 3.h,
              ),
              SubHeading(
                desription,
                fontSize: 4,
                fontWeight: FontWeight.w500,
                color: R.palette.textFieldHintGreyColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              SubHeading(
                "See more",
                fontSize: 3,
                fontWeight: FontWeight.w400,
                color: R.palette.appPrimaryBlue,
              ),
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          child: SubHeading(
            price,
            fontSize: 5,
            fontWeight: FontWeight.w500,
            color: R.palette.darkBlack,
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: R.palette.appPrimaryBlue),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(
              child: SubHeading(
                "Remove",
                fontSize: 4,
                fontWeight: FontWeight.w400,
                color: R.palette.appPrimaryBlue,
              ),
            ),
          ),
        )
      ],
    );
  }
}
