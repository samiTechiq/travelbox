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

class NotificationsMobile extends StatelessWidget {
  const NotificationsMobile({super.key});

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
      body: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              children: [
                GenericAppBar(
                  leading: Padding(
                    padding: EdgeInsets.only(right: 9.w),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: R.palette.mediumBlack,
                    ),
                  ),
                  onLeadingPressed: () {
                    sl<Navigation>().goBack(context);
                  },
                ),
                SizedBox(
                  height: 32.h,
                ),
                Expanded(
                  child: Container(
                    decoration: R.theme.genericCardDecoration,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 25.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SubHeading(
                            AppLocalizations.of(context).notifications,
                            color: R.palette.mediumBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 60.h,
                            child: TabBar.secondary(
                              labelStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: R.theme.interRegular,
                              ),
                              unselectedLabelStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: R.theme.interRegular,
                              ),
                              labelColor: R.palette.appPrimaryBlue,
                              indicatorColor: R.palette.appPrimaryBlue,
                              unselectedLabelColor:
                                  R.palette.textFieldHintGreyColor,
                              controller: _tabController,
                              isScrollable: true,
                              indicatorSize: TabBarIndicatorSize.label,
                              padding: EdgeInsets.zero,
                              indicatorPadding: EdgeInsets.zero,
                              tabAlignment: TabAlignment.start,
                              labelPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                              tabs: <Widget>[
                                Tab(
                                  text: AppLocalizations.of(context)
                                      .newsletters_services,
                                ),
                                Tab(
                                  text: AppLocalizations.of(context).purchases,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: const [
                                SingleChildScrollView(
                                  child: NewsletterServicesTab(),
                                ),
                                SingleChildScrollView(
                                  child: PurchasesTab(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
