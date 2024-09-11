import 'package:flutter/material.dart';

@immutable
final class InsurancePolicy {
  final String? coverImage;
  final String title;
  final List<String> policies;
  final bool isExtras;

  const InsurancePolicy({
    this.coverImage,
    required this.title,
    required this.policies,
    this.isExtras = false,
  });
}
