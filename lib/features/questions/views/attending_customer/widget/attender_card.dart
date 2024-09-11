import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/views/attending_customer/model/attending_customer_data.dart';
import 'package:travelbox/features/questions/views/attending_customer/viewmodel/attending_customer_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_radio_button.dart';

class AttenderCard extends StatelessWidget {
  final List<AttendingCustomerDataModel> data;
  final bool checkValue;
  final double fontSize;
  final double itemFontSize;

  const AttenderCard({
    Key? key,
    required this.data,
    this.checkValue = false,
    this.fontSize = 18,
    this.itemFontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AttendingCustomerViewModel>();
    return Container(
      decoration: R.theme.genericCardDecoration,
      width: double.infinity,
      // height: MediaQuery.of(context).size.width < 520 ? double.infinity : 270,
      padding: kIsWeb
          ? MediaQuery.of(context).size.width < 520
              ?  EdgeInsets.only(left: 28.w, right: 28.w, top: 30.h)
              : EdgeInsets.only(left: 28.w, right: 28.w, top: 35.h)
          : EdgeInsets.fromLTRB(25.w, 25.h, 25.w, 5.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubHeading(
            AppLocalizations.of(context).txt_whose_travelling,
            color: R.palette.darkBlack,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          // SizedBox(
          //   height: 18.h,
          // ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GenericRadioButton(
                    key: Key(data[index].title),
                    color: R.palette.mediumBlack,
                    enabledPrimaryBlue: R.palette.appPrimaryBlue,
                    title: data[index].title,
                    // verticalHeight: 20.h,
                    itemFontSize: 18,
                    unFillBackColor: R.palette.appWhiteColor,
                    outerBorderColor: R.palette.textFieldHintGreyColor,
                    checkValue: data[index].isSelected,
                    onTap: () {
                      viewModel.toggleSelectedAttendee(data[index], data);
                    },
                    rowWidgetsWidth:
                        MediaQuery.of(context).size.width < 520 ? 5 : 7.w,
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.width < 520 ? 5.h : 2.h,
                  // )
                ],
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width < 520 ? 28.h : 37.h,
          ),
        ],
      ),
    );
  }
}
