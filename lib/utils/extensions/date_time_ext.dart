import 'package:jiffy/jiffy.dart';

extension DateTimeExt on DateTime {
  String get formatToDoPattern =>
      Jiffy.parseFromDateTime(this).format(pattern: "do MMMM yyyy");
}
