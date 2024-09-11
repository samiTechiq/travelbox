class CalendarUtils {
  static int getAge(dayOfBirth) {
    DateTime? dob;
    DateTime today = DateTime.now();
    switch (dayOfBirth.runtimeType) {
      case String:
        if (dayOfBirth.isNotEmpty) {
          dob = DateTime.tryParse(dayOfBirth);
        }
        break;
      case DateTime:
        dob = dayOfBirth;
        break;
    }
    if (dob == null) return 18;

    final year = today.year - dob.year;
    final mth = today.month - dob.month;
    // final days = today.day - dob.day;
    if (mth < 0) {
      /// negative month means it's still upcoming
      /// 'turning $year in ${mth.abs()} months and $days days'
      return year - 1;
    } else {
      /// 'your next bday is ${12-mth}months and ${28 -days} days away'
      return year;
    }
  }

  static bool isSameDate(DateTime date1, DateTime date2) {
    return date1.day == date2.day &&
        date1.month == date2.month &&
        date1.year == date2.year;
  }
}

extension MyDateUtils on DateTime {
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}
