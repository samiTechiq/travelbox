import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/add_decline_service_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/base_quote_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/line_the_option_widget.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class AdventureExtremePopup extends StatelessWidget {
  const AdventureExtremePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: AdventureExtremePopupMobile(),
      desktopLayout: AdventureExtremePopupDesktop(),
    );
  }
}

class AdventureExtremePopupMobile extends StatelessWidget {
  const AdventureExtremePopupMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: AppLocalizations.of(context).adventure_extreme_sports_protection,
      onPressed: () {},
      content: content(context),
      titleButton: '${AppLocalizations.of(context).add_to_plan_for} HK\$200',
      isEnableButton: true,
    );
  }

  Widget content(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SubHeading(
              AppLocalizations.of(context).adventure_extreme_content,
              color: R.palette.textFieldHintGreyColor,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              maxLines: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: adventureExtremeData.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    LineTheOptionWidget(title: adventureExtremeData[index]),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AdventureExtremePopupDesktop extends StatelessWidget {
  const AdventureExtremePopupDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: AppLocalizations.of(context).adventure_extreme_sports_protection,
      onPressed: () {},
      content: content(context),
      titleButton: '${AppLocalizations.of(context).add_to_plan_for} HK\$200',
      isEnableButton: true,
    );
  }

  Widget content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubHeading(
          AppLocalizations.of(context).adventure_extreme_content,
          color: R.palette.textFieldHintGreyColor,
          fontSize: 5,
          fontWeight: FontWeight.w400,
          maxLines: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: adventureExtremeData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                LineTheOptionWidget(title: adventureExtremeData[index]),
              ],
            );
          },
        ),
        SizedBox(
          height: 25.h,
        ),
        AddDeclineServiceWidget(
          country: 'HK',
          money: '24.6',
          isAdd: false,
          onPress: () {},
        ),
      ],
    );
  }
}
