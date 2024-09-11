import 'package:flutter/material.dart';

@immutable
final class InsuranceOffer {
  final String title;
  final String description;

  const InsuranceOffer({
    required this.title,
    required this.description,
  });
}
