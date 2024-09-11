import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/features/notifications/viewmodel/notifications_viewmodel.dart';
import 'package:travelbox/features/notifications/widget/notifications_item.dart';
import 'package:travelbox/l10n/gen/l10n.dart';

class PurchasesTab extends StatelessWidget {
  const PurchasesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = context.watch<NotificationsViewmodel>();
    return Column(
      children: [
        NotificationItem(
            isSubTitle: true,
            subTitle: AppLocalizations.of(context).purchase_emails_content,
            title: AppLocalizations.of(context).purchase_emails,
            value: notifications.notificationsSettings.purchasesEmails,
            onChange: notifications.setPurchasesEmails),
        NotificationItem(
            isSubTitle: true,
            subTitle: AppLocalizations.of(context).renewals_content,
            title: AppLocalizations.of(context).renewals,
            value: notifications.notificationsSettings.renewals,
            onChange: notifications.setRenewals),
        NotificationItem(
            isSubTitle: true,
            title: AppLocalizations.of(context).reviews,
            subTitle: AppLocalizations.of(context).reviews_content,
            value: notifications.notificationsSettings.reviews,
            onChange: notifications.setReviews),
        NotificationItem(
            isSubTitle: true,
            title: AppLocalizations.of(context).offers_in_confirmation_emails,
            subTitle: AppLocalizations.of(context).other_product_and_deals,
            value: notifications.notificationsSettings.offersConfirmEmail,
            onChange: notifications.setOffersConfirmEmail),
        NotificationItem(
            isSubTitle: true,
            title: AppLocalizations.of(context).purchase_confirmation_emails,
            subTitle: AppLocalizations.of(context).you_cant_unsubscribe,
            value: notifications.notificationsSettings.purchaseConfirmEmail,
            onChange: notifications.setPurchaseConfirmEmail),
      ],
    );
  }
}
