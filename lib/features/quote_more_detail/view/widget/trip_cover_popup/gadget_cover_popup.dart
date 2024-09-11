import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/enum/gadget_cover_state.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_detail/view/model/gadget_cover.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/add_decline_service_widget.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/base_quote_popup.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/trip_cover_popup/line_the_option_widget.dart';
import 'package:travelbox/features/quote_more_detail/viewmodel/gadget_cover_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class GadgetCoverPopup extends StatelessWidget {
  const GadgetCoverPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: GadgetCoverPopupMobile(),
      desktopLayout: GadgetCoverPopupDesktop(),
    );
  }
}

class GadgetCoverPopupMobile extends StatelessWidget {
  const GadgetCoverPopupMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseQuotePopup(
      title: AppLocalizations.of(context).gadget_cover,
      onPressed: () {},
      content: content(),
      titleButton: AppLocalizations.of(context).add_to_plan,
      isEnableButton: true,
    );
  }

  Widget content() {
    return Expanded(
      child: Column(
        children: [
          SubHeading(
            "This cover is available for an unlimited number of gadgets to provide cover for:",
            color: R.palette.textFieldHintGreyColor,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            maxLines: 10,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: gadgetData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  LineTheOptionWidget(title: gadgetData[index]),
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

class GadgetCoverPopupDesktop extends StatelessWidget {
  const GadgetCoverPopupDesktop({super.key});

  static List<GadgetCover> data = [
    GadgetCover(
      title: 'No thanks!',
      state: GadgetCoverState.no,
    ),
    GadgetCover(
      title: 'Yes, I’d like to cover HK\$10,000 worth of gadgets (HKD\$150.00)',
      state: GadgetCoverState.yes,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<GadgetCoverViewModel>(),
      builder: (context, child) {
        final viewModel = context.watch<GadgetCoverViewModel>();
        return BaseQuotePopup(
          title: AppLocalizations.of(context).gadget_cover,
          onPressed: () {},
          content: content(context),
          titleButton: AppLocalizations.of(context).add_to_plan,
          isEnableButton:
              viewModel.gadgetCoverState == GadgetCoverState.yes ? true : false,
        );
      },
    );
  }

  Widget content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubHeading(
          "This cover is available for an unlimited number of gadgets to provide cover for:",
          color: R.palette.textFieldHintGreyColor,
          fontSize: 4,
          fontWeight: FontWeight.w400,
          maxLines: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: gadgetData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                LineTheOptionWidget(title: gadgetData[index]),
              ],
            );
          },
        ),
        // SizedBox(
        //   height: 30.h,
        // ),
        // SubHeading(
        //   "Would you like to add gadget cover?",
        //   color: R.palette.textFieldHintGreyColor,
        //   fontSize: 4,
        //   fontWeight: FontWeight.w400,
        //   maxLines: 10,
        // ),
        // ListView.builder(
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   itemCount: data.length,
        //   itemBuilder: (context, index) {
        //     return GenericRadioButton(
        //       key: Key(data[index].title),
        //       color: R.palette.textFieldHintGreyColor,
        //       enabledPrimaryBlue: R.palette.appPrimaryBlue,
        //       title: data[index].title,
        //       rowWidgetsWidth: 3,
        //       verticalHeight: 20,
        //       itemFontSize: 4,
        //       unFillBackColor: R.palette.appWhiteColor,
        //       outerBorderColor: R.palette.textFieldHintGreyColor,
        //       checkValue: data[index].isSelected,
        //       onTap: () {
        //         viewModel.toggleSelected(data[index], data);
        //       },
        //     );
        //   },
        // ),
        SizedBox(
          height: 30.h,
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
