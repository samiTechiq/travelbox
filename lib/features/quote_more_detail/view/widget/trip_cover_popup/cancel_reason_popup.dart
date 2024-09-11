import 'package:flutter/material.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/add_decline_service_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/base_quote_popup.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class CancelReasonPopup extends StatelessWidget {
  const CancelReasonPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: CancelReasonPopupMobile(),
      desktopLayout: CancelReasonPopupDesktop(),
    );
  }
}

class CancelReasonPopupMobile extends StatelessWidget {
  const CancelReasonPopupMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: 'Cancel for any reason',
      onPressed: () {},
      content: content(),
      titleButton: '${AppLocalizations.of(context).add_to_plan_for} HK\$',
      isEnableButton: true,
    );
  }

  Widget content() {
    return Expanded(
      child: Column(
        children: [
          SubHeading(
            "Be reimbursed for up to 75% of non- refundable trip expenses if you cancel your trip for any reason (up to 48 hrs prior to departure).\nYou must purchase this add-on within 14 days of your initial trip deposit.",
            color: R.palette.textFieldHintGreyColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            maxLines: 10,
          ),
          const Spacer(),
          AddDeclineServiceWidget(
            country: 'HK',
            money: '24.6',
            isAdd: false,
            onPress: () {},
          ),
        ],
      ),
    );
  }
}

class CancelReasonPopupDesktop extends StatelessWidget {
  const CancelReasonPopupDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: 'Cancel for any reason',
      onPressed: () {},
      content: content(),
      titleButton: 'Add to plan for HK\$',
      isEnableButton: true,
    );
  }

  Widget content() {
    return SubHeading(
      "Be reimbursed for up to 75% of non- refundable trip expenses if you cancel your trip for any reason (up to 48 hrs prior to departure).\nYou must purchase this add-on within 14 days of your initial trip deposit.",
      color: R.palette.textFieldHintGreyColor,
      fontSize: 4,
      fontWeight: FontWeight.w400,
      maxLines: 10,
    );
  }
}
