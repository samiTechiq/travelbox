import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/notifications/viewmodel/notifications_viewmodel.dart';
import 'package:travelbox/features/notifications/widget/newsletter_services_tab.dart';
import 'package:travelbox/features/notifications/widget/purchases_tab.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/default_app_bar.dart';

class NotificationsDesktop extends StatelessWidget {
  const NotificationsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = context.watch<NotificationsViewmodel>();
    return NotificationsContent(
      notifications: notifications,
    );
  }
}

class NotificationsContent extends StatefulWidget {
  final NotificationsViewmodel notifications;

  const NotificationsContent({super.key, required this.notifications});

  @override
  State<NotificationsContent> createState() => _NotificationsContentState();
}

class _NotificationsContentState extends State<NotificationsContent>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    widget.notifications.getConfigs();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      appBar: GenericAppBarDesktop(
        leading: InkWell(
          onTap: () {
            sl<Navigation>().goBack(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: R.palette.mediumBlack,
          ),
        ),
        trailing: const SizedBox(),
        showLanguageIcon: false,
      ),
      body: Center(
        child: Container(
          width: 0.5.sw,
          decoration: R.theme.genericCardDecoration,
          padding: EdgeInsets.only(left: 28.w, top: 39.h, right: 28.w, bottom: 39.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubHeading(
                AppLocalizations.of(context).notifications,
                color: R.palette.mediumBlack,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 15.h,
              ),
              TabBar.secondary(
                isScrollable: false,
                labelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: R.theme.interRegular,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: R.theme.interRegular,
                ),
                labelColor: R.palette.appPrimaryBlue,
                indicatorColor: R.palette.appPrimaryBlue,
                unselectedLabelColor: R.palette.textFieldHintGreyColor,
                controller: _tabController,
                tabs: <Widget>[
                  Tab(
                      text:
                          AppLocalizations.of(context).newsletters_services),
                  Tab(text: AppLocalizations.of(context).purchases),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      NewsletterServicesTab(),
                      PurchasesTab(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
