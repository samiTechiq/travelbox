import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/notifications/view/desktop/notications_desktop.dart';
import 'package:travelbox/features/notifications/view/mobile/notifications_mobile.dart';
import 'package:travelbox/features/notifications/viewmodel/notifications_viewmodel.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sl<NotificationsViewmodel>(),
        builder: (context, index) {
          return const ResponsiveLayout(
            mobileLayout: NotificationsMobile(),
            desktopLayout: NotificationsDesktop(),
          );
        });
  }
}
