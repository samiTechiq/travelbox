import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/add_decline_service_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/base_quote_popup.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class VacationRentalPopup extends StatelessWidget {
  const VacationRentalPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: VacationRentalPopupMobile(),
      desktopLayout: VacationRentalPopupDesktop(),
    );
  }
}

class VacationRentalPopupMobile extends StatelessWidget {
  const VacationRentalPopupMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: 'Vacation rental protection',
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
            "Be reimbursed up to HK\$5,000 in repair/replacement costs if you accidentally damage the rental you're staying in, or its contents, while in-trip",
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

class VacationRentalPopupDesktop extends StatelessWidget {
  const VacationRentalPopupDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: 'Vacation rental protection',
      onPressed: () {},
      content: content(),
      titleButton: 'Add to plan for HK\$200',
      isEnableButton: true,
    );
  }

  Widget content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubHeading(
          "Be reimbursed up to HK\$5,000 in repair/replacement costs if you accidentally damage the rental you're staying in, or its contents, while in-trip",
          color: R.palette.textFieldHintGreyColor,
          fontSize: 5,
          fontWeight: FontWeight.w400,
          maxLines: 10,
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
