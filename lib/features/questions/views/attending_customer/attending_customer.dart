import 'package:flutter/material.dart';
import 'package:travelbox/features/questions/views/attending_customer/views/desktop/attending_customer_desktop.dart';
import 'package:travelbox/features/questions/views/attending_customer/views/mobile/attending_customer_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class AttendingCustomer extends StatelessWidget {
  const AttendingCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: AttendingCustomerMobile(),
        desktopLayout: AttendingCustomerDesktop());
  }
}
