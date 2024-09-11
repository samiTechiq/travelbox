import 'package:flutter/material.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/add_decline_service_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/base_quote_popup.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class PetCarePopup extends StatelessWidget {
  const PetCarePopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: PetCarePopupMobile(),
      desktopLayout: PetCarePopupDesktop(),
    );
  }
}

class PetCarePopupMobile extends StatelessWidget {
  const PetCarePopupMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: 'Pet care',
      onPressed: () {},
      content: content(),
      titleButton: 'Add to plan for HK\$',
      isEnableButton: true,
    );
  }

  Widget content() {
    return Expanded(
      child: Column(
        children: [
          SubHeading(
            "Be reimbursed up to HK\$20,000 in veterinary expenses and \$2,000 for kenneling if you arrive back home later than expected",
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

class PetCarePopupDesktop extends StatelessWidget {
  const PetCarePopupDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: 'Pet care',
      onPressed: () {},
      content: content(),
      titleButton: 'Add to plan for HK\$',
      isEnableButton: true,
    );
  }

  Widget content() {
    return SubHeading(
      "Be reimbursed up to HK\$20,000 in veterinary expenses and \$2,000 for kenneling if you arrive back home later than expected",
      color: R.palette.textFieldHintGreyColor,
      fontSize: 4,
      fontWeight: FontWeight.w400,
      maxLines: 10,
    );
  }
}
