import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/features/notifications/viewmodel/notifications_viewmodel.dart';
import 'package:travelbox/features/notifications/widget/notifications_item.dart';
import 'package:travelbox/l10n/gen/l10n.dart';

class NewsletterServicesTab extends StatelessWidget {
  const NewsletterServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = context.watch<NotificationsViewmodel>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NotificationItem(
            isSubTitle: true,
            subTitle: AppLocalizations.of(context).promotions_deals_content,
            title: AppLocalizations.of(context).promotions_deals,
            value: notifications.notificationsSettings.promotions,
            onChange: notifications.setPromotions),
        NotificationItem(
            isSubTitle: false,
            title: AppLocalizations.of(context).rewards,
            value: notifications.notificationsSettings.rewards,
            onChange: notifications.setRewards),
        NotificationItem(
            isSubTitle: false,
            title: AppLocalizations.of(context).refer_a_friend,
            value: notifications.notificationsSettings.referFriend,
            onChange: notifications.setReferFriend),
        NotificationItem(
            isSubTitle: true,
            title: AppLocalizations.of(context).lyla_products_and_services,
            subTitle: AppLocalizations.of(context)
                .communications_about_lyla_products_and_services,
            value: notifications.notificationsSettings.productService,
            onChange: notifications.setProductService),
        NotificationItem(
            isSubTitle: false,
            title: AppLocalizations.of(context).customer_feedback,
            value: notifications.notificationsSettings.customerFeedback,
            onChange: notifications.setCustomerFeedback),
        NotificationItem(
            isSubTitle: false,
            title: AppLocalizations.of(context).product_announcements,
            value: notifications.notificationsSettings.productAnno,
            onChange: notifications.setProductAnno),
        NotificationItem(
            isSubTitle: true,
            title: AppLocalizations.of(context).travel_experiences,
            subTitle: AppLocalizations.of(context).travel_experiences_content,
            value: notifications.notificationsSettings.travelExp,
            onChange: notifications.setTravelExp),
      ],
    );
  }
}
