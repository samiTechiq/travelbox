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

class WinterSportPopup extends StatelessWidget {
  const WinterSportPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: WinterSportPopupMobile(),
      desktopLayout: WinterSportPopupDesktop(),
    );
  }
}

class WinterSportPopupMobile extends StatelessWidget {
  const WinterSportPopupMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: 'Winter sports protection',
      onPressed: () {},
      content: content(),
      titleButton: '${AppLocalizations.of(context).add_to_plan_for} HK\$150.00',
      isEnableButton: true,
    );
  }

  Widget content() {
    return Expanded(
      child: Column(
        children: [
          SubHeading(
            "Coverage for medical expenses if you become injured while participating in winter sports as defined in the plan on the same basis as all other injuries.",
            color: R.palette.textFieldHintGreyColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            maxLines: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: winterSportProtectionData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  LineTheOptionWidget(title: winterSportProtectionData[index]),
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

class WinterSportPopupDesktop extends StatelessWidget {
  const WinterSportPopupDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: 'Winter sports protection',
      onPressed: () {},
      content: content(),
      titleButton: '${AppLocalizations.of(context).add_to_plan_for} HK\$150.00',
      isEnableButton: true,
    );
  }

  Widget content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubHeading(
          "Coverage for medical expenses if you become injured while participating in winter sports as defined in the plan on the same basis as all other injuries.",
          color: R.palette.textFieldHintGreyColor,
          fontSize: 4,
          fontWeight: FontWeight.w400,
          maxLines: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: winterSportProtectionData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                LineTheOptionWidget(title: winterSportProtectionData[index]),
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
