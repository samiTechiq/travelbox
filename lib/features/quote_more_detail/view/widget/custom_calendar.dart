import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class CalendarPicker extends StatefulWidget {
  final bool rangeDate;

  final DateTime? minimumDate;

  final DateTime? maximumDate;

  final DateTime? initialStartDate;

  final DateTime? initialEndDate;

  final Function(DateTime, DateTime)? startEndDateChange;

  const CalendarPicker({
    Key? key,
    this.initialStartDate,
    this.initialEndDate,
    this.startEndDateChange,
    this.minimumDate,
    this.maximumDate,
    this.rangeDate = true,
  }) : super(key: key);

  @override
  CalendarPickerState createState() => CalendarPickerState();
}

class CalendarPickerState extends State<CalendarPicker> {
  List<DateTime> currentMonthDateList = <DateTime>[];

  List<DateTime> currentNextMonthDateList = <DateTime>[];

  DateTime currentMonthDate = DateTime.now();

  DateTime currentNextMonthDate =
      DateTime(DateTime.now().year, DateTime.now().month + 2, 0);

  DateTime? startDate;

  DateTime? endDate;

  @override
  void initState() {
    setListOfDate(currentMonthDateList, currentMonthDate);
    setListOfDate(currentNextMonthDateList, currentNextMonthDate);
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    }
    if (widget.initialEndDate != null) {
      endDate = widget.initialEndDate;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: CalendarPickerMobile(
          currentMonthDateList: currentMonthDateList,
          currentNextMonthDateList: currentNextMonthDateList,
          currentMonthDate: currentMonthDate,
          currentNextMonthDate: currentNextMonthDate,
          startDate: startDate,
          endDate: endDate,
          onDateClick: onDateClick,
          onClickPre: onClickPre,
          onClickNext: onClickNext,
          getDaysNoUI: getDaysNoUI,
          rangeDate: widget.rangeDate,
        ),
        desktopLayout: CalendarPickerDesktop(
          currentMonthDateList: currentMonthDateList,
          currentNextMonthDateList: currentNextMonthDateList,
          currentMonthDate: currentMonthDate,
          currentNextMonthDate: currentNextMonthDate,
          startDate: startDate,
          endDate: endDate,
          onDateClick: onDateClick,
          onClickPre: onClickPre,
          onClickNext: onClickNext,
          getDaysNoUI: getDaysNoUI,
          rangeDate: widget.rangeDate,
        ));
  }

  void notifyChange() {
    setState(() {
      try {
        widget.startEndDateChange?.call(startDate!, endDate ?? DateTime.now());
      } catch (_) {}
    });
  }

  void onDateClick(DateTime date) {
    if (widget.rangeDate) {
      if (startDate == null) {
        startDate = date;
      } else if (startDate != date && endDate == null) {
        endDate = date;
      } else if (startDate!.day == date.day && startDate!.month == date.month) {
        startDate = null;
      } else if (endDate!.day == date.day && endDate!.month == date.month) {
        endDate = null;
      }
      if (startDate == null && endDate != null) {
        startDate = endDate;
        endDate = null;
      }
      if (startDate != null && endDate != null) {
        if (date.isBefore(endDate!) && date.isAfter(startDate!)) {
          endDate = date;
        }
        if (!endDate!.isAfter(startDate!)) {
          final DateTime d = startDate!;
          startDate = endDate;
          endDate = d;
        }
        if (date.isBefore(startDate!)) {
          startDate = date;
        }
        if (date.isAfter(endDate!)) {
          endDate = date;
        }
      }
      notifyChange();
    } else if (!widget.rangeDate) {
      if (startDate == null) {
        startDate = date;
      } else if (startDate!.day == date.day && startDate!.month == date.month) {
        startDate = null;
      } else {
        startDate = date;
      }
      notifyChange();
    }
  }

  void setListOfDate(List<DateTime> dateList, DateTime monthDate) {
    dateList.clear();
    final DateTime newDate = DateTime(monthDate.year, monthDate.month, 0);
    int previousMothDay = 0;
    if (newDate.weekday < 7) {
      previousMothDay = newDate.weekday;
      for (int i = 1; i <= previousMothDay; i++) {
        dateList.add(newDate.subtract(Duration(days: previousMothDay - i)));
      }
    }
    for (int i = 0; i < (35 - previousMothDay); i++) {
      dateList.add(newDate.add(Duration(days: i + 1)));
    }
  }

  Widget getDaysNameUI(DateTime dateTime) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Text(
        DateFormat('EEE').format(dateTime),
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: R.palette.calenderDaysColor,
          fontFamily: R.theme.neueMontrealRegular,
        ),
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
                padding: EdgeInsets.only(right: 7.w, bottom: 7.h),
                child: Container(
                  height: kIsWeb ? 43.26.h : 45.w,
                  width: kIsWeb ? 42.8.w : 45.w,
                  decoration: BoxDecoration(
                    color: getBackgroundColor(monthDate, date),
                    border: Border.all(width: 0.5, color: getBorderColor(date)),
                    borderRadius: const BorderRadius.all(Radius.circular(7)),
                  ),
                  child: InkWell(
                    onTap: () {
                      if (monthDate.month == date.month) {
                        if (widget.minimumDate != null &&
                            widget.maximumDate != null) {
                          final DateTime newMinimumDate = DateTime(
                              widget.minimumDate!.year,
                              widget.minimumDate!.month,
                              widget.minimumDate!.day - 1);
                          final DateTime newMaximumDate = DateTime(
                              widget.maximumDate!.year,
                              widget.maximumDate!.month,
                              widget.maximumDate!.day + 1);
                          if (date.isAfter(newMinimumDate) &&
                              date.isBefore(newMaximumDate)) {
                            onDateClick(date);
                          }
                        } else if (widget.minimumDate != null) {
                          final DateTime newMinimumDate = DateTime(
                              widget.minimumDate!.year,
                              widget.minimumDate!.month,
                              widget.minimumDate!.day - 1);
                          if (date.isAfter(newMinimumDate)) {
                            onDateClick(date);
                          }
                        } else if (widget.maximumDate != null) {
                          final DateTime newMaximumDate = DateTime(
                              widget.maximumDate!.year,
                              widget.maximumDate!.month,
                              widget.maximumDate!.day + 1);
                          if (date.isBefore(newMaximumDate)) {
                            onDateClick(date);
                          }
                        } else {
                          onDateClick(date);
                        }
                      }
                    },
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(
                          color: getTextColor(monthDate, date),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: R.theme.neueMontrealRegular,
                        ),
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

  Color getBorderColor(DateTime date) {
    if (widget.rangeDate) {
      if ((isEqualsDateTimeNow(date) &&
              startDate != null &&
              !isSameDate(date, startDate!)) ||
          (isEqualsDateTimeNow(date) && startDate == null) ||
          isInRange(date)) {
        return R.palette.appPrimaryBlue;
      }
      return R.palette.appWhiteColor;
    } else if ((isEqualsDateTimeNow(date) &&
            startDate != null &&
            !isSameDate(date, startDate!)) ||
        (isEqualsDateTimeNow(date) && startDate == null)) {
      return R.palette.appPrimaryBlue;
    }
    return R.palette.appWhiteColor;
  }

  Color getTextColor(DateTime monthDate, DateTime date) {
    if (widget.rangeDate) {
      if (isStartAndEndDate(date)) {
        return R.palette.appWhiteColor;
      } else if (isInRange(date)) {
        return R.palette.appPrimaryBlue;
      } else if (monthDate.month == date.month) {
        return isEqualsDateTimeNow(date)
            ? R.palette.mediumBlack
            : date.isBefore(DateTime.now())
                ? R.palette.calenderDaysColor
                : R.palette.mediumBlack;
      }
      return R.palette.calenderDaysColor;
    } else {
      if (isStartDate(date)) {
        return R.palette.appWhiteColor;
      } else if (monthDate.month == date.month) {
        return isEqualsDateTimeNow(date)
            ? R.palette.mediumBlack
            : date.isBefore(DateTime.now())
                ? R.palette.calenderDaysColor
                : R.palette.mediumBlack;
      }
      return R.palette.calenderDaysColor;
    }
  }

  Color getBackgroundColor(DateTime monthDate, DateTime date) {
    if (widget.rangeDate) {
      if (isStartAndEndDate(date)) {
        return R.palette.appPrimaryBlue;
      } else if (isInRange(date)) {
        return R.palette.calenderLightBlue;
      } else if (monthDate.month == date.month) {
        return isEqualsDateTimeNow(date)
            ? R.palette.calenderGrey
            : date.isBefore(DateTime.now())
                ? R.palette.appWhiteColor
                : R.palette.calenderGrey;
      }
      return R.palette.appWhiteColor;
    } else {
      if (isStartDate(date)) {
        return R.palette.appPrimaryBlue;
      } else if (monthDate.month == date.month) {
        return isEqualsDateTimeNow(date)
            ? R.palette.calenderGrey
            : date.isBefore(DateTime.now())
                ? R.palette.appWhiteColor
                : R.palette.calenderGrey;
      }
      return R.palette.appWhiteColor;
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

  bool isInRange(DateTime date) {
    return startDate != null &&
        endDate != null &&
        date.isAfter(startDate!) &&
        date.isBefore(endDate!);
  }

  bool isStartDate(DateTime date) {
    return startDate != null && isSameDate(startDate!, date);
  }

  bool isStartAndEndDate(DateTime date) {
    return (startDate != null && isSameDate(startDate!, date)) ||
        (endDate != null && isSameDate(endDate!, date));
  }

  void onClickPre() {
    setState(() {
      currentNextMonthDate = currentMonthDate;
      currentMonthDate =
          DateTime(currentMonthDate.year, currentMonthDate.month, 0);
      setListOfDate(currentMonthDateList, currentMonthDate);
      setListOfDate(currentNextMonthDateList, currentNextMonthDate);
    });
  }

  void onClickNext() {
    setState(() {
      currentMonthDate = currentNextMonthDate;
      currentNextMonthDate =
          DateTime(currentMonthDate.year, currentMonthDate.month + 2, 0);
      setListOfDate(currentMonthDateList, currentMonthDate);
      setListOfDate(currentNextMonthDateList, currentNextMonthDate);
    });
  }
}

// ignore: must_be_immutable
class CalendarPickerMobile extends StatelessWidget {
  List<DateTime> currentMonthDateList;

  List<DateTime> currentNextMonthDateList;

  DateTime currentMonthDate;

  DateTime currentNextMonthDate;

  DateTime? startDate;

  DateTime? endDate;

  Function(DateTime date) onDateClick;

  VoidCallback onClickPre;

  VoidCallback onClickNext;

  final bool rangeDate;

  List<Widget> Function(
    List<DateTime> dateList,
    DateTime monthDate,
  ) getDaysNoUI;

  CalendarPickerMobile({
    super.key,
    required this.currentMonthDateList,
    required this.currentNextMonthDateList,
    required this.currentMonthDate,
    required this.currentNextMonthDate,
    required this.startDate,
    required this.endDate,
    required this.onDateClick,
    required this.onClickPre,
    required this.onClickNext,
    required this.getDaysNoUI,
    required this.rangeDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkWell(
              onTap: () => onClickPre(),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: R.palette.black,
                size: 32.sp,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  DateFormat(R.stringRes.localeHelper.dateFormat)
                      .format(currentMonthDate),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22.sp,
                    color: R.palette.mediumBlack,
                    fontFamily: R.theme.neueMontrealRegular,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => onClickNext(),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: R.palette.black,
                size: 32.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        rangeDate
            ? Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: getDaysNoUI(
                          currentMonthDateList,
                          currentMonthDate,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Text(
                        DateFormat(R.stringRes.localeHelper.dateFormat)
                            .format(currentNextMonthDate),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22.sp,
                          color: R.palette.mediumBlack,
                          fontFamily: R.theme.neueMontrealRegular,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Column(
                        children: getDaysNoUI(
                          currentNextMonthDateList,
                          currentNextMonthDate,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: getDaysNoUI(
                          currentMonthDateList,
                          currentMonthDate,
                        ),
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}

// ignore: must_be_immutable
class CalendarPickerDesktop extends StatelessWidget {
  List<DateTime> currentMonthDateList;

  List<DateTime> currentNextMonthDateList;

  DateTime currentMonthDate;

  DateTime currentNextMonthDate;

  DateTime? startDate;

  DateTime? endDate;

  Function(DateTime date) onDateClick;

  VoidCallback onClickPre;

  VoidCallback onClickNext;

  List<Widget> Function(
    List<DateTime> dateList,
    DateTime monthDate,
  ) getDaysNoUI;

  bool? rangeDate;

  CalendarPickerDesktop({
    super.key,
    required this.currentMonthDateList,
    required this.currentNextMonthDateList,
    required this.currentMonthDate,
    required this.currentNextMonthDate,
    required this.startDate,
    required this.endDate,
    required this.onDateClick,
    required this.onClickPre,
    required this.onClickNext,
    required this.getDaysNoUI,
    this.rangeDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            InkWell(
              onTap: () => onClickPre(),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: R.palette.black,
                size: 32,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  DateFormat(R.stringRes.localeHelper.dateFormat)
                      .format(currentMonthDate),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                    color: R.palette.appHeadingTextBlackColor,
                    fontFamily: R.theme.neueMontrealRegular,
                  ),
                ),
              ),
            ),
            rangeDate == true
                ? Expanded(
                    child: Center(
                      child: Text(
                        DateFormat(R.stringRes.localeHelper.dateFormat)
                            .format(currentMonthDate),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          color: R.palette.appHeadingTextBlackColor,
                          fontFamily: R.theme.neueMontrealRegular,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            InkWell(
              onTap: () => onClickNext(),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: R.palette.black,
                size: 32,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        rangeDate == true
            ? Row(
                children: [
                  Column(
                    children: getDaysNoUI(
                      currentMonthDateList,
                      currentMonthDate,
                    ),
                  ),
                  SizedBox(
                    width: 44.w,
                  ),
                  // const Spacer(),
                  Column(
                    children: getDaysNoUI(
                      currentNextMonthDateList,
                      currentNextMonthDate,
                    ),
                  ),
                ],
              )
            : Column(
                children: getDaysNoUI(
                  currentMonthDateList,
                  currentMonthDate,
                ),
              ),
      ],
    );
  }
}
