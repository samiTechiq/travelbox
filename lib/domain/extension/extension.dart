import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }
}

extension StringExtension on String? {
  String capitalizeFirstWord() {
    if (this == null) {
      return '';
    }
    if (this!.isEmpty) {
      return this!;
    }

    final firstChar = this!.substring(0, 1).toUpperCase();
    final remainingChars = this!.substring(1);

    return '$firstChar$remainingChars';
  }
}
