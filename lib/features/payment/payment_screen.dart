import 'package:flutter/material.dart';
import 'package:travelbox/features/payment/views/payment_screen/desktop/payment_screen_desktop.dart';
import 'package:travelbox/features/payment/views/payment_screen/mobile/payment_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class Payment extends StatelessWidget {
  final String orderId;

  const Payment({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: PaymentMobile(orderId: orderId),
        desktopLayout: PaymentDesktop(orderId: orderId));
  }
}