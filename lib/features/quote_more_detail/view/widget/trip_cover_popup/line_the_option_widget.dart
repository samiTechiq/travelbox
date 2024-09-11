import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

class LineTheOptionWidget extends StatelessWidget {
  final String title;
  const LineTheOptionWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: R.palette.textFieldHintGreyColor),
            height: kIsWeb ? 1.w : 6.w,
            width: kIsWeb ? 1.w : 6.w,
          ),
        ),
        Expanded(
          child: SubHeading(
            title,
            color: R.palette.textFieldHintGreyColor,
            fontSize: kIsWeb ? 4 : 16,
            fontWeight: FontWeight.w400,
            maxLines: 4,
          ),
        ),
      ],
    );
  }
}
