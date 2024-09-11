import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// user for DateTime formatting
import 'package:intl/intl.dart';
import 'package:travelbox/data/resources/r.dart';

/// `const CustomCalendar({
///   Key? key,
///   this.initialStartDate,
///   this.initialEndDate,
///   this.startEndDateChange,
///   this.minimumDate,
///   this.maximumDate,
///   required this.primaryColor,
/// })`
class CustomCalendar extends StatefulWidget {
  /// The minimum date that can be selected on the calendar
  final DateTime? minimumDate;

  /// The maximum date that can be selected on the calendar
  final DateTime? maximumDate;

  /// The initial start date to be shown on the calendar
  final DateTime? initialStartDate;

  /// The initial end date to be shown on the calendar
  final DateTime? initialEndDate;

  /// The primary color to be used in the calendar's color scheme
  final Color primaryColor;

  /// A function to be called when the selected date range changes
  final Function(DateTime, DateTime)? startEndDateChange;

  const CustomCalendar({
    Key? key,
    this.initialStartDate,
    this.initialEndDate,
    this.startEndDateChange,
    this.minimumDate,
    this.maximumDate,
    required this.primaryColor,
  }) : super(key: key);

  @override
  CustomCalendarState createState() => CustomCalendarState();
}

class CustomCalendarState extends State<CustomCalendar> {
  List<DateTime> dateList = <DateTime>[];

  DateTime currentMonthDate = DateTime.now();

  DateTime? startDate;

  DateTime? endDate;

  @override
  void initState() {
    setListOfDate(currentMonthDate);
    if (widget.initialStartDate != null) {
      startDate = widget.initialStartDate;
    }
    if (widget.initialEndDate != null) {
      endDate = widget.initialEndDate;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// This function is used to set the list of dates to be shown on the calendar
  /// It sets the list of dates based on the month and year of the [monthDate] parameter
  void setListOfDate(DateTime monthDate) {
    dateList.clear();
    final DateTime newDate = DateTime(monthDate.year, monthDate.month, 0);
    int previousMothDay = 0;
    if (newDate.weekday < 7) {
      previousMothDay = newDate.weekday;
      for (int i = 1; i <= previousMothDay; i++) {
        dateList.add(newDate.subtract(Duration(days: previousMothDay - i)));
      }
    }
    for (int i = 0; i < (42 - previousMothDay); i++) {
      dateList.add(newDate.add(Duration(days: i + 1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 38,
              width: 38,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  onTap: () {
                    setState(() {
                      currentMonthDate = DateTime(
                          currentMonthDate.year, currentMonthDate.month, 0);
                      setListOfDate(currentMonthDate);
                    });
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  DateFormat(R.stringRes.localeHelper.dateFormat)
                      .format(currentMonthDate),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: R.palette.appHeadingTextBlackColor),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    onTap: () {
                      setState(() {
                        currentMonthDate = DateTime(currentMonthDate.year,
                            currentMonthDate.month + 2, 0);
                        setListOfDate(currentMonthDate);
                      });
                    },
                    child: const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: getDaysNameUI(),
        ),
        SizedBox(
          height: 12.72.h,
        ),
        Column(
          children: getDaysNoUI(),
        ),
        SizedBox(
          height: 22.12.h,
        )
      ],
    );
  }

  List<Widget> getDaysNameUI() {
    final List<Widget> listUI = <Widget>[];
    for (int i = 0; i < 7; i++) {
      listUI.add(
        Expanded(
          child: Center(
            child: Text(
              DateFormat('EEE').format(dateList[i]),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: R.palette.calenderDaysColor),
            ),
          ),
        ),
      );
    }
    return listUI;
  }

  List<Widget> getDaysNoUI() {
    final List<Widget> noList = <Widget>[];
    int count = 0;
    for (int i = 0; i < dateList.length / 7; i++) {
      final List<Widget> listUI = <Widget>[];
      for (int i = 0; i < 7; i++) {
        final DateTime date = dateList[count];
        listUI.add(
          Expanded(
            child: AspectRatio(
              aspectRatio: 0.9,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 6.3.h, right: 4.w),
                    child: Material(
                      color: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 0,
                            bottom: 4,
                            left: isStartDateRadius(date) ? 4 : 3,
                            right: isEndDateRadius(date) ? 4 : 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: startDate != null && endDate != null
                                ? getIsItStartAndEndDate(date) ||
                                        getIsInRange(date)
                                    ? widget.primaryColor.withOpacity(0.4)
                                    : Colors.grey.shade300
                                : Colors.grey.shade300,
                            border: Border.all(
                                width: 0.5,
                                color: startDate != null && endDate != null
                                    ? getIsItStartAndEndDate(date) ||
                                            getIsInRange(date)
                                        ? R.palette.appPrimaryBlue
                                        : Colors.transparent
                                    : Colors.transparent),
                            borderRadius: BorderRadius.only(
                              bottomLeft: isStartDateRadius(date)
                                  ? const Radius.circular(6.36)
                                  : const Radius.circular(6.36),
                              topLeft: isStartDateRadius(date)
                                  ? const Radius.circular(6.36)
                                  : const Radius.circular(6.36),
                              topRight: isEndDateRadius(date)
                                  ? const Radius.circular(6.36)
                                  : const Radius.circular(6.36),
                              bottomRight: isEndDateRadius(date)
                                  ? const Radius.circular(6.36)
                                  : const Radius.circular(6.36),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(32.0)),
                      onTap: () {
                        if (currentMonthDate.month == date.month) {
                          if (widget.minimumDate != null &&
                              widget.maximumDate != null) {
                            final DateTime newminimumDate = DateTime(
                                widget.minimumDate!.year,
                                widget.minimumDate!.month,
                                widget.minimumDate!.day - 1);
                            final DateTime newmaximumDate = DateTime(
                                widget.maximumDate!.year,
                                widget.maximumDate!.month,
                                widget.maximumDate!.day + 1);
                            if (date.isAfter(newminimumDate) &&
                                date.isBefore(newmaximumDate)) {
                              onDateClick(date);
                            }
                          } else if (widget.minimumDate != null) {
                            final DateTime newminimumDate = DateTime(
                                widget.minimumDate!.year,
                                widget.minimumDate!.month,
                                widget.minimumDate!.day - 1);
                            if (date.isAfter(newminimumDate)) {
                              onDateClick(date);
                            }
                          } else if (widget.maximumDate != null) {
                            final DateTime newmaximumDate = DateTime(
                                widget.maximumDate!.year,
                                widget.maximumDate!.month,
                                widget.maximumDate!.day + 1);
                            if (date.isBefore(newmaximumDate)) {
                              onDateClick(date);
                            }
                          } else {
                            onDateClick(date);
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: getIsItStartAndEndDate(date)
                                ? widget.primaryColor
                                : Colors.transparent,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6.36)),
                            boxShadow: getIsItStartAndEndDate(date)
                                ? <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        blurRadius: 4,
                                        offset: const Offset(0, 0)),
                                  ]
                                : null,
                          ),
                          child: Center(
                            child: Text(
                              '${date.day}',
                              style: TextStyle(
                                  color: getIsItStartAndEndDate(date)
                                      ? R.palette.appWhiteColor
                                      : currentMonthDate.month == date.month
                                          ? widget.primaryColor
                                          : Colors.grey.withOpacity(0.6),
                                  fontSize:
                                      MediaQuery.of(context).size.width > 360
                                          ? 18
                                          : 16,
                                  fontWeight: getIsItStartAndEndDate(date)
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 9,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                          color: DateTime.now().day == date.day &&
                                  DateTime.now().month == date.month &&
                                  DateTime.now().year == date.year
                              ? getIsInRange(date)
                                  ? Colors.white
                                  : widget.primaryColor
                              : Colors.transparent,
                          shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
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

  bool getIsInRange(DateTime date) {
    if (startDate != null && endDate != null) {
      if (date.isAfter(startDate!) && date.isBefore(endDate!)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool getIsItStartAndEndDate(DateTime date) {
    if (startDate != null &&
        startDate!.day == date.day &&
        startDate!.month == date.month &&
        startDate!.year == date.year) {
      return true;
    } else if (endDate != null &&
        endDate!.day == date.day &&
        endDate!.month == date.month &&
        endDate!.year == date.year) {
      return true;
    } else {
      return false;
    }
  }

  bool isStartDateRadius(DateTime date) {
    if (startDate != null &&
        startDate!.day == date.day &&
        startDate!.month == date.month) {
      return true;
    } else if (date.weekday == 1) {
      return true;
    } else {
      return false;
    }
  }

  bool isEndDateRadius(DateTime date) {
    if (endDate != null &&
        endDate!.day == date.day &&
        endDate!.month == date.month) {
      return true;
    } else if (date.weekday == 7) {
      return true;
    } else {
      return false;
    }
  }

  void onDateClick(DateTime date) {
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
    setState(() {
      try {
        widget.startEndDateChange!(startDate!, endDate!);
      } catch (_) {}
    });
  }
}
