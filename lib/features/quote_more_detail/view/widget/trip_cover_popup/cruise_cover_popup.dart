import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/add_decline_service_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/base_quote_popup.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class CruiseCoverPopup extends StatelessWidget {
  const CruiseCoverPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: CruiseCoverPopupMobile(),
      desktopLayout: CruiseCoverPopupDesktop(),
    );
  }
}

class CruiseCoverPopupMobile extends StatelessWidget {
  const CruiseCoverPopupMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: 'Cruise Cover',
      onPressed: () {},
      content: content(),
      titleButton: 'Get covered for HK\$200',
      isEnableButton: true,
    );
  }

  Widget content() {
    return Expanded(
      child: Column(
        children: [
          SubHeading(
            "Cruises are defined as trips on ocean or river cruise-ships / boats. No cover is provided for cruise holidays unless you have declared this to us by adding to your coverage and ensured that \"Cruise: Included\" is shown on your Validation Certificate. A ferry crossing does not constitute a cruise",
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

class CruiseCoverPopupDesktop extends StatelessWidget {
  const CruiseCoverPopupDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: 'Cruise Cover',
      onPressed: () {},
      content: content(),
      titleButton: 'Get covered for HK\$200',
      isEnableButton: true,
    );
  }

  Widget content() {
    return Column(
      children: [
        SubHeading(
          "Cruises are defined as trips on ocean or river cruise-ships / boats. No cover is provided for cruise holidays unless you have declared this to us by adding to your coverage and ensured that \"Cruise: Included\" is shown on your Validation Certificate. A ferry crossing does not constitute a cruise",
          color: R.palette.textFieldHintGreyColor,
          fontSize: 5,
          fontWeight: FontWeight.w400,
        ),
        SizedBox(
          height: 0.4.sh,
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
