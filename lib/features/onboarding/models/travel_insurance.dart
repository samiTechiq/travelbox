import 'package:flutter/material.dart';

@immutable
final class TravelInsurance {
  final String title;
  final String description;
  final bool isIncluded;

  const TravelInsurance({
    required this.title,
    required this.description,
    required this.isIncluded,
  });
}
