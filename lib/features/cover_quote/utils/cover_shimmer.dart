import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CoverShimmer {
  Widget showCoverShimmer(bool visibility) {
    if (visibility) {
      return const CoverShimmerWidget();
    }
    else {
      return const SizedBox();
    }
  }
}

class CoverShimmerWidget extends StatelessWidget {
  const CoverShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 186.h,
          color: Colors.transparent,
        ),
        Shimmer(
          child: Container(
            height: 143.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey.shade300,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 16.w,
          child: Container(
            height: 84.w,
            width: 84.w,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(100)),
          ),
        )
      ],
    );
  }
}
