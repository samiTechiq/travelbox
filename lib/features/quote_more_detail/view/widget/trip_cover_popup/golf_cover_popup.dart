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

class GolfCoverPopup extends StatelessWidget {
  const GolfCoverPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: GolfCoverPopupMobile(),
      desktopLayout: GolfCoverPopupDesktop(),
    );
  }
}

class GolfCoverPopupMobile extends StatelessWidget {
  const GolfCoverPopupMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: AppLocalizations.of(context).golf_cover,
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
            "Benefits of this cover are per person and include:",
            color: R.palette.textFieldHintGreyColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            maxLines: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: golfCoverData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  LineTheOptionWidget(title: golfCoverData[index]),
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

class GolfCoverPopupDesktop extends StatelessWidget {
  const GolfCoverPopupDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: AppLocalizations.of(context).golf_cover,
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
          "Benefits of this cover are per person and include:",
          color: R.palette.textFieldHintGreyColor,
          fontSize: 4,
          fontWeight: FontWeight.w400,
          maxLines: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: golfCoverData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                LineTheOptionWidget(title: golfCoverData[index]),
              ],
            );
          },
        ),
      ],
    );
  }
}
