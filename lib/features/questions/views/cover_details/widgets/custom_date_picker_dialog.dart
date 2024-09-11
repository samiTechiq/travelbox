import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

class CustomDatePickerDialog extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  const CustomDatePickerDialog({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  });

  @override
  CustomDatePickerDialogState createState() => CustomDatePickerDialogState();
}

class CustomDatePickerDialogState extends State<CustomDatePickerDialog> {
  late DateTime selectedDate;
  late int selectedYear;
  late int selectedMonth;
  List<DateTime> currentMonthDateList = <DateTime>[];
  DateTime currentMonthDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    selectedYear = widget.initialDate.year;
    selectedMonth = widget.initialDate.month;
    setListOfDate(selectedDate);
  }

  void onDateClick(DateTime date) {
    if (selectedMonth == date.month && date.compareTo(DateTime.now()) <= 0) {
      selectedDate = date;
      Future.delayed(const Duration(milliseconds: 20), () {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop(date);
      });
    }
  }

  Widget getDaysNameUI(DateTime dateTime) {
    return Padding(
      padding: EdgeInsets.only(bottom: 2.w),
      child: SubHeading(
        DateFormat('EEE').format(dateTime),
        fontSize: kIsWeb
            ? MediaQuery.of(context).size.width < 520
                ? 18
                : 17
            : 16,
        fontWeight: FontWeight.w400,
        color: R.palette.mediumBlack,
      ),
    );
  }

  List<Widget> getDaysNoUI(
    List<DateTime> dateList,
    DateTime monthDate,
  ) {
    final List<Widget> noList = <Widget>[];
    int count = 0;
    for (int i = 0; i < dateList.length / 7; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i < 7; i++) {
        final DateTime date = dateList[count];
        listUI.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              count < 7 ? getDaysNameUI(dateList[i]) : const SizedBox(),
              Padding(
                padding: EdgeInsets.all(kIsWeb ? 1.w : 2.w),
                child: Container(
                  height: kIsWeb
                      ? MediaQuery.of(context).size.width < 520
                          ? 45.w
                          : 44
                      : 45.w,
                  width: kIsWeb
                      ? MediaQuery.of(context).size.width < 520
                          ? 45.w
                          : 44
                      : 45.w,
                  decoration: BoxDecoration(
                    color: getBackgroundColor(date),
                    border: Border.all(width: 0.5, color: getBorderColor(date)),
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                  ),
                  child: InkWell(
                    onTap: () => onDateClick(date),
                    child: Center(
                      child: SubHeading(
                        '${date.day}',
                        fontSize: kIsWeb
                            ? MediaQuery.of(context).size.width < 520
                                ? 18
                                : 17
                            : 16,
                        fontWeight: FontWeight.w400,
                        color: getTextColor(date),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
        count += 1;
      }
      noList.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: listUI,
      ));
    }
    return noList;
  }

  void setListOfDate(DateTime monthDate) {
    currentMonthDateList.clear();
    final DateTime newDate = DateTime(monthDate.year, monthDate.month, 0);
    int previousMothDay = 0;
    if (newDate.weekday < 7) {
      previousMothDay = newDate.weekday;
      for (int i = 1; i <= previousMothDay; i++) {
        currentMonthDateList
            .add(newDate.subtract(Duration(days: previousMothDay - i)));
      }
    }
    for (int i = 0; i < (42 - previousMothDay); i++) {
      currentMonthDateList.add(newDate.add(Duration(days: i + 1)));
    }
  }

  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }

  bool isEqualsDateTimeNow(DateTime date) {
    return isSameDate(DateTime.now(), date);
  }

  bool isSelectedDate(DateTime date) {
    return isSameDate(selectedDate, date);
  }

  Color getBorderColor(DateTime date) {
    if ((isEqualsDateTimeNow(date) && !isSameDate(date, selectedDate)) ||
        (isEqualsDateTimeNow(date))) {
      return R.palette.appPrimaryBlue;
    }
    return R.palette.appWhiteColor;
  }

  Color getTextColor(DateTime date) {
    if (isSelectedDate(date)) {
      return R.palette.appWhiteColor;
    } else if (selectedMonth == date.month) {
      return isEqualsDateTimeNow(date)
          ? R.palette.mediumBlack
          : date.isAfter(DateTime.now())
              ? R.palette.calenderDaysColor
              : R.palette.mediumBlack;
    }
    return R.palette.calenderDaysColor;
  }

  Color getBackgroundColor(DateTime date) {
    if (isSelectedDate(date)) {
      return R.palette.appPrimaryBlue;
    }
    return R.palette.appWhiteColor;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      insetPadding: kIsWeb ? null : EdgeInsets.symmetric(horizontal: 30.w),
      backgroundColor: R.palette.appWhiteColor,
      surfaceTintColor: Colors.transparent,
      child: Container(
        width: kIsWeb
            ? MediaQuery.of(context).size.width < 520
                ? 0.85.sw
                : 0.25.sw
            : null,
        padding: EdgeInsets.symmetric(vertical: kIsWeb ? 5.w : 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      dropdownColor: R.palette.hoverGrey,
                      icon: Icon(
                        Icons.arrow_drop_up_outlined,
                        color: R.palette.appPrimaryBlue,
                      ),
                      alignment: Alignment.center,
                      value: selectedMonth,
                      items: List.generate(12, (index) {
                        return DropdownMenuItem(
                          value: index + 1,
                          child: Text(
                            DateFormat.MMMM().format(DateTime(0, index + 1)),
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: R.palette.black,
                            ),
                          ),
                        );
                      }),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value!;
                          currentMonthDate =
                              DateTime(selectedYear, value + 1, 0);
                          setListOfDate(
                              DateTime(selectedYear, selectedMonth + 1, 0));
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    dropdownColor: R.palette.hoverGrey,
                    icon: Icon(
                      Icons.arrow_drop_down_outlined,
                      color: R.palette.appPrimaryBlue,
                    ),
                    value: selectedYear,
                    items: List.generate(
                        widget.lastDate.year - widget.firstDate.year + 1,
                        (index) {
                      return DropdownMenuItem(
                        value: widget.firstDate.year + index,
                        child: Text(
                          (widget.firstDate.year + index).toString(),
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w400,
                            color: R.palette.black,
                          ),
                        ),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        selectedYear = value!;
                        currentMonthDate = DateTime(selectedYear, value + 1, 0);
                        setListOfDate(
                            DateTime(selectedYear, selectedMonth + 1, 0));
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: getDaysNoUI(
                    currentMonthDateList,
                    currentMonthDate,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
