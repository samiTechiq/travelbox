// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:travelbox/data/di/dependeny_injection.dart';
// import 'package:travelbox/data/resources/r.dart';
// import 'package:travelbox/utils/core/go_router/args_model/info_expanded_args_model.dart';
// import 'package:travelbox/utils/core/go_router/routes_constants.dart';
// import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
// import 'package:travelbox/utils/widgets/app_text.dart';
//
// class Pages extends StatefulWidget {
//   final String? text;
//   final String? name;
//   final String? shortDescription;
//   final String? longDescription;
//   final String? subText;
//   final String? linkText;
//   final String? amountText;
//   final int? tapIndex;
//   final Color? color;
//   bool actionAdd;
//
//   Pages({
//     Key? key,
//     this.text,
//     this.name,
//     this.shortDescription,
//     this.longDescription,
//     this.color,
//     this.subText,
//     this.linkText,
//     this.actionAdd = false,
//     this.amountText,
//     this.tapIndex,
//   }) : super(key: key);
//
//   @override
//   State<Pages> createState() => _PagesState();
// }
//
// class _PagesState extends State<Pages> {
//   DateTime? startDate;
//   DateTime? endDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(left: 0, right: 13.w, top: 10.h, bottom: 10.h),
//       child: Container(
//         decoration: R.theme.cardDecoration,
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 13.w),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 SizedBox(
//                   height: 16.h,
//                 ),
//                 SubHeading(
//                   widget.name ?? "",
//                   fontWeight: FontWeight.w600,
//                   fontSize: 14,
//                   color: R.palette.darkBlack,
//                   maxLines: 3,
//                 ),
//                 SizedBox(
//                   height: 7.h,
//                 ),
//                 SizedBox(
//                   width: 0.25.sw,
//                   child: SubHeading(
//                     widget.shortDescription ?? "",
//                     fontWeight: FontWeight.w400,
//                     fontSize: 13,
//                     color: R.palette.textFieldHintGreyColor,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 6.h,
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       final InfoExpandedArgs args = InfoExpandedArgs(
//                         heading: widget.longDescription ?? '',
//                         isCruiseScreen: true,
//                         isRentalProtectionScreen: false,
//                         isAdventureAndSportsScreen: false,
//                         isGadgetCover: false,
//                         isGolfCoverScreen: false,
//                         isPersonalLiabilityScreen: false,
//                         isWinterSportsProtection: false,
//                       );
//
//                       sl<Navigation>().pushWithArgs(
//                         context,
//                         Routes.infoExpandDetailsRoute,
//                         args: args,
//                       );
//                     },
//                     child: SubHeading(
//                       widget.linkText ?? "",
//                       fontWeight: FontWeight.w400,
//                       fontSize: 13,
//                       color: R.palette.appPrimaryBlue,
//                     )),
//                 SizedBox(
//                   height: 18.h,
//                 ),
//                 SubHeading(
//                   widget.amountText ?? "",
//                   fontSize: 16,
//                   color: R.palette.darkBlack,
//                 ),
//                 SizedBox(
//                   height: 12.h,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     widget.list[index].actionAdd =
//                         !widget.list[index].actionAdd;
//                     setState(() {});
//                   },
//                   child: SubHeading(
//                     widget.crudText ?? "",
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                     color: R.palette.appPrimaryBlue,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:ui';

class PagesData {
  final String? text;
  final String? name;
  final String? shortDescription;
  final String? longDescription;
  final String? subText;
  final String? linkText;
  final String? amountText;
  final int? tapIndex;
  final Color? color;
  bool actionAdd;

  PagesData({
    this.text,
    this.name,
    this.shortDescription,
    this.longDescription,
    this.color,
    this.subText,
    this.linkText,
    this.actionAdd = true,
    this.amountText,
    this.tapIndex,
  });
}
