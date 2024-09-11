import 'package:flutter/material.dart';

class UserInputBuilder extends StatelessWidget {
  final String name;
  final WidgetBuilder onAnnual;
  final WidgetBuilder onSingle;

  const UserInputBuilder(
      {Key? key,
      required this.name,
      required this.onAnnual,
      required this.onSingle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (name.toLowerCase().contains('annual')) {
      return onAnnual(context);
    } else if (name.toLowerCase().contains('single')) {
      return onSingle(context);
    } else {
      return const SizedBox();
    }
  }
}
