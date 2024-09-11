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

class PersonalLiabilityPopup extends StatelessWidget {
  const PersonalLiabilityPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: PersonalLiabilityPopupMobile(),
      desktopLayout: PersonalLiabilityPopupDesktop(),
    );
  }
}

class PersonalLiabilityPopupMobile extends StatelessWidget {
  const PersonalLiabilityPopupMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: 'Personal liability protection',
      onPressed: () {},
      content: content(),
      titleButton: '${AppLocalizations.of(context).add_to_plan_for} HK\$200',
      isEnableButton: true,
    );
  }

  Widget content() {
    return Expanded(
      child: Column(
        children: [
          SubHeading(
            "This option provides up to HK\$5,000,000 protection against any incident for which you become legally liable for during your journey, to cover:",
            color: R.palette.textFieldHintGreyColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            maxLines: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: personalProtectionData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  LineTheOptionWidget(title: personalProtectionData[index]),
                ],
              );
            },
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

class PersonalLiabilityPopupDesktop extends StatelessWidget {
  const PersonalLiabilityPopupDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: 'Personal liability protection',
      onPressed: () {},
      content: content(),
      titleButton: '${AppLocalizations.of(context).add_to_plan_for} HK\$200',
      isEnableButton: true,
    );
  }

  Widget content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubHeading(
          "This option provides up to HK\$5,000,000 protection against any incident for which you become legally liable for during your journey, to cover:",
          color: R.palette.textFieldHintGreyColor,
          fontSize: 5,
          fontWeight: FontWeight.w400,
          maxLines: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: personalProtectionData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                LineTheOptionWidget(title: personalProtectionData[index]),
              ],
            );
          },
        ),
        SizedBox(height: 0.4.sh),
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
