import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

class PersonalTile extends StatelessWidget {
  final String heading;
  final String value;
  final double fontSize;

  const PersonalTile({
    super.key,
    required this.heading,
    required this.value,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubHeading(
              heading,
              fontSize: fontSize,
              fontWeight: FontWeight.normal,
              color: R.palette.textFieldHintGreyColor,
            ),
            Flexible(
              child: SubHeading(
                value,
                fontSize: fontSize,
                fontWeight: FontWeight.normal,
                color: R.palette.textFieldHintGreyColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        )
      ],
    );
  }
}
