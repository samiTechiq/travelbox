import 'package:flutter/material.dart';
import 'package:travelbox/features/downloadApp_suggestion/views/desktop/download_suggestion_screen_desktop.dart';
import 'package:travelbox/features/downloadApp_suggestion/views/mobile/download_suggestion_screen_mobile.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class DownLoadSuggestScreen extends StatelessWidget {
  const DownLoadSuggestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
        mobileLayout: DownLoadSuggestScreenMobile(),
        desktopLayout: DownLoadSuggestScreenDesktop());
  }
}
