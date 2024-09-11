import 'package:flutter/material.dart';
import 'package:travelbox/features/refer_friend/view/desktop/refer_friend_desktop.dart';
import 'package:travelbox/features/refer_friend/view/mobile/refer_friend_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class ReferFriend extends StatelessWidget {
  const ReferFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: ReferFriendMobile(),
      desktopLayout: ReferFriendDesktop(),
    );
  }
}
