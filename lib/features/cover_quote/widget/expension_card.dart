import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/model/country_data.dart';
import 'package:travelbox/features/cover_quote/model/cover.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/cover_quote/widget/input_type_builder.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_checkbox.dart';
import 'package:travelbox/utils/widgets/checkbox/app_square_box.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

import '../../../utils/core/go_router/routes_navigation.dart';
import '../../../utils/widgets/drop_down/app_dropdown.dart';
import '../model/country.dart';
import 'chip_input_suggestions.dart';
import 'countries_option_builder.dart';

// ignore: must_be_immutable
class ExpansionCard extends StatelessWidget {
  final Cover cover;
  final String? heading;
  final String? subHeading;
  final String? textFieldHint;
  final List<AvailableCoverItems> data;
  final String startingAmount;
  final Function(AvailableCoverItems)? onCheckBoxSelected;
  final Function(String)? onTextFieldChanged;
  final Function(Cover)? onCoverSelected;
  bool isSelected = false;
  final List<Map<String, dynamic>> includedCountries;
  final List<Map<String, dynamic>> excludedCountries;

  ExpansionCard({
    Key? key,
    this.heading,
    this.subHeading,
    required this.cover,
    this.isSelected = false,
    required this.data,
    this.textFieldHint,
    this.startingAmount = "1180",
    this.onCheckBoxSelected,
    this.onTextFieldChanged,
    this.onCoverSelected,
    required this.includedCountries,
    required this.excludedCountries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: ExpansionCardMobileContent(
        cover: cover,
        data: data,
        heading: heading,
        subHeading: subHeading,
        isSelected: isSelected,
        textFieldHint: textFieldHint,
        startingAmount: startingAmount,
        onCheckBoxSelected: onCheckBoxSelected,
        onTextFieldChanged: onTextFieldChanged,
        onCoverSelected: onCoverSelected,
        includedCountries: includedCountries,
        excludedCountries: excludedCountries,
      ),
      desktopLayout: ExpansionCardDesktopContent(
        cover: cover,
        data: data,
        heading: heading,
        subHeading: subHeading,
        isSelected: isSelected,
        textFieldHint: textFieldHint,
        startingAmount: startingAmount,
        onCheckBoxSelected: onCheckBoxSelected,
        onTextFieldChanged: onTextFieldChanged,
        onCoverSelected: onCoverSelected,
        includedCountries: includedCountries,
        excludedCountries: excludedCountries,
      ),
      tabletLayout: ExpansionCardDesktopContent(
        cover: cover,
        data: data,
        heading: heading,
        subHeading: subHeading,
        isSelected: isSelected,
        textFieldHint: textFieldHint,
        startingAmount: startingAmount,
        onCheckBoxSelected: onCheckBoxSelected,
        onTextFieldChanged: onTextFieldChanged,
        onCoverSelected: onCoverSelected,
        includedCountries: includedCountries,
        excludedCountries: excludedCountries,
      ),
    );
  }
}

// ignore: must_be_immutable
class ExpansionCardMobileContent extends StatefulWidget {
  final Cover cover;
  final String? heading;
  final String? subHeading;
  final String? textFieldHint;
  final List<AvailableCoverItems> data;
  final String startingAmount;
  final Function(AvailableCoverItems)? onCheckBoxSelected;
  final Function(String)? onTextFieldChanged;
  final Function(Cover)? onCoverSelected;
  bool isSelected = false;
  final List<Map<String, dynamic>> includedCountries;
  final List<Map<String, dynamic>> excludedCountries;

  ExpansionCardMobileContent({
    Key? key,
    this.heading,
    this.subHeading,
    required this.cover,
    this.isSelected = false,
    required this.data,
    this.textFieldHint,
    this.startingAmount = "1180",
    this.onCheckBoxSelected,
    this.onTextFieldChanged,
    this.onCoverSelected,
    required this.includedCountries,
    required this.excludedCountries,
  }) : super(key: key);

  @override
  State<ExpansionCardMobileContent> createState() =>
      ExpansionCardMobileContentState();
}

class ExpansionCardMobileContentState
    extends State<ExpansionCardMobileContent> {
  TextEditingController controller = TextEditingController();

  List<CountryModel> includedCountries = [
    CountryModel(countryName: "Australia", countryCode: "AS"),
    CountryModel(countryName: "Brunei", countryCode: "BR"),
    CountryModel(countryName: "Cambodia", countryCode: "CA"),
    CountryModel(countryName: "China", countryCode: "CH"),
    CountryModel(countryName: "Indonesia", countryCode: "IN"),
    CountryModel(countryName: "Japan", countryCode: "JP"),
    CountryModel(countryName: "Laos", countryCode: "LA"),
    CountryModel(countryName: "Macau", countryCode: "MA"),
    CountryModel(countryName: "Malaysia", countryCode: "MY"),
    CountryModel(countryName: "Myanmar", countryCode: "MM"),
    CountryModel(countryName: "New Zealand", countryCode: "NZ"),
    CountryModel(countryName: "Philippines", countryCode: "PH"),
    CountryModel(countryName: "Singapore", countryCode: "SG"),
    CountryModel(countryName: "South Korea", countryCode: "SK"),
    CountryModel(countryName: "Taiwan", countryCode: "TW"),
    CountryModel(countryName: "Thailand", countryCode: "TH"),
    CountryModel(countryName: "Vietnam", countryCode: "VN"),
  ];

  List<CountryModel> excludedCountries = [
    CountryModel(countryName: "Cuba", countryCode: "CU"),
    CountryModel(countryName: "Iran", countryCode: "IR"),
    CountryModel(countryName: "Syria", countryCode: "SY"),
    CountryModel(countryName: "North Korea", countryCode: "KP"),
    CountryModel(countryName: "Ukraine", countryCode: "UA"),
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CoverQuoteViewModel>();
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.isSelected
                ? R.palette.appPrimaryBlue
                : R.palette.appWhiteColor,
            boxShadow: [
              BoxShadow(
                color: kIsWeb
                    ? R.palette.boxGreyColor.withOpacity(0.5)
                    : R.palette.boxGreyColor,
                blurRadius: 15.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: const Offset(
                  1.0, // Move to right 5  horizontally
                  1.0, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 25.w, right: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubHeading(
                          widget.heading ?? "",
                          color: widget.isSelected
                              ? R.palette.appWhiteColor
                              : R.palette.appHeadingTextBlackColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: R.theme.interRegular,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 0.61.sw,
                          child: SubHeading(
                            widget.subHeading ?? "",
                            color: widget.isSelected
                                ? R.palette.appWhiteColor
                                : R.palette.appHeadingTextBlackColor,
                            fontSize: 18,
                            maxLines: 2,
                            fontWeight: FontWeight.w400,
                            fontFamily: R.theme.interRegular,
                            height: 1.3,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      key: const Key("expand_button"),
                      onTap: () {
                        if (!widget.isSelected) {
                          widget.onCoverSelected!(widget.cover);
                          setState(() {});
                          return;
                        }
                        widget.onCoverSelected!(Cover.initial());
                      },
                      child: widget.isSelected
                          ? SizedBox(
                        key: const Key('arrow_up'),
                            child: SvgPicture.asset(
                                R.assets.graphics.arrowUp.path,
                                width: 60,
                                height: 60,
                              ),
                          )
                          : SizedBox(
                        key: const Key('arrow_up'),
                            child: SvgPicture.asset(
                                R.assets.graphics.arrowDown.path,
                                width: 60,
                                height: 60,
                              ),
                          ),
                    ),
                  ],
                ),
                widget.isSelected
                    ? const SizedBox()
                    : SizedBox(
                        height: 20.h,
                      ),
                if (widget.isSelected) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      SubHeading2(
                        getDestinationHeadings(),
                        color: widget.isSelected
                            ? R.palette.appWhiteColor
                            : R.palette.appHeadingTextBlackColor,
                        fontSize: 20,
                        maxLines: 2,
                        fontWeight: FontWeight.w600,
                        fontFamily: R.theme.interRegular,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        child: SubHeading2(
                          getDestinationSubHeadings(),
                          color: widget.isSelected
                              ? R.palette.appWhiteColor
                              : R.palette.appHeadingTextBlackColor,
                          fontSize: 18,
                          maxLines: 3,
                          fontWeight: FontWeight.w400,
                          fontFamily: R.theme.interRegular,
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      UserInputBuilder(
                        name: widget.heading ?? '',
                        onAnnual: (context) {
                          return SizedBox(
                            height: 48,
                            child: GenericDropDown(
                              items: [
                                AppLocalizations.of(context).asia,
                                AppLocalizations.of(context).world_wide,
                              ],
                              hintText: viewModel.destinationRegionAnnual ==
                                      DestinationRegionAnnual.none
                                  ? AppLocalizations.of(context).select
                                  : '',
                              hintColor: R.palette.mediumBlack,
                              hoverColor: R.palette.hoverGrey,
                              filled: true,
                              value: viewModel.destinationRegionAnnual ==
                                      DestinationRegionAnnual.none
                                  ? null
                                  : viewModel.destinationRegionAnnual ==
                                          DestinationRegionAnnual.asia
                                      ? AppLocalizations.of(context).asia
                                      : AppLocalizations.of(context).world_wide,
                              mapDropDownText: (value) {
                                return Text(
                                  value,
                                  style: TextStyle(
                                    color: R.palette.mediumBlack,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                  ),
                                );
                              },
                              fillColor: R.palette.white,
                              onDropDownItemChanged: (value) {
                                if (value ==
                                    AppLocalizations.of(context).asia) {
                                  viewModel.setDestinationRegionAnnual(
                                      DestinationRegionAnnual.asia);
                                } else if (value ==
                                    AppLocalizations.of(context).world_wide) {
                                  viewModel.setDestinationRegionAnnual(
                                      DestinationRegionAnnual.world);
                                } else {
                                  viewModel.setDestinationRegionAnnual(
                                      DestinationRegionAnnual.none);
                                }
                              },
                              textColor: R.palette.appPrimaryBlue,
                              hintTextStyle: TextStyle(
                                  color: R.palette.mediumBlack,
                                  fontFamily: R.theme.interRegular,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                              dropDownColor: R.palette.appWhiteColor,
                              iconColor: R.palette.textFieldHintGreyColor,
                            ),
                          );
                        },
                        onSingle: (context) {
                          return ChipsInput<CountryData>(
                            height: 48,
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)
                                  .where_are_you_going,
                              hintStyle: TextStyle(
                                  color: R.palette.mediumBlack,
                                  fontSize: 15,
                                  fontFamily: R.theme.interRegular,
                                  fontWeight: FontWeight.w500),
                              border: InputBorder.none,
                            ),
                            findSuggestions: _findSuggestions,
                            onChanged: _onChanged,
                            chipBuilder: (
                              BuildContext context,
                              ChipsInputState<CountryData> state,
                              CountryData country,
                              bool isFirst,
                            ) {
                              return Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color:
                                      R.palette.appPrimaryBlue.withOpacity(0.1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3.r),
                                  ),
                                  border: Border.all(
                                      color: R.palette.appPrimaryBlue
                                          .withOpacity(0.1)),
                                ),
                                child: Text(
                                  country.name,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: R.theme.interRegular,
                                    color: R.palette.darkAppPrimaryBlue,
                                  ),
                                ),
                              );
                            },
                            suggestionBuilder: (
                              BuildContext context,
                              ChipsInputState<CountryData> state,
                              CountryData country,
                              bool isFirst,
                            ) {
                              return ListTile(
                                key: ObjectKey(country),
                                title: Text(country.name),
                                onTap: () => state.selectSuggestion(country),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      viewModel.destinationRegionAnnual !=
                              DestinationRegionAnnual.none
                          ? CountiesOptionBuilder(
                              name: widget.heading ?? '',
                              onAsiaSelected: (BuildContext context) {
                                return InkWell(
                                  onTap: () {
                                    if (widget.includedCountries.isNotEmpty) {
                                      showSheet(
                                          context, widget.includedCountries,
                                          title: AppLocalizations.of(context)
                                              .included_asia_cover_countries);
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      bottom:
                                          1, // Space between underline and text
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: R.palette.white,
                                      width: 1.0, // Underline thickness
                                    ))),
                                    child: SubHeading2(
                                      AppLocalizations.of(context)
                                          .included_countries,
                                      color: R.palette.white,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                              },
                              onWorldSelected: (BuildContext context) {
                                return InkWell(
                                  onTap: () {
                                    showSheet(
                                      context,
                                      widget.excludedCountries,
                                      title: AppLocalizations.of(context)
                                          .excluded_worldwide_countries_covered,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      bottom:
                                          1, // Space between underline and text
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: R.palette.white,
                                      width: 1.0, // Underline thickness
                                    ))),
                                    child: SubHeading2(
                                      AppLocalizations.of(context)
                                          .excluded_countries,
                                      color: R.palette.white,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                              },
                              region: viewModel.destinationRegionAnnual,
                            )
                          : const SizedBox(),
                      viewModel.destinationRegionAnnual !=
                              DestinationRegionAnnual.none
                          ? SizedBox(
                              height: 30.h,
                            )
                          : const SizedBox(),
                      SubHeading2(
                        AppLocalizations.of(context).do_you_also_want,
                        color: widget.isSelected
                            ? R.palette.appWhiteColor
                            : R.palette.appHeadingTextBlackColor,
                        fontSize: 16,
                        maxLines: 2,
                        fontFamily: R.theme.interRegular,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListView.builder(
                        itemCount: widget.data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      widget.data[index].isSelected =
                                          !widget.data[index].isSelected;
                                    });
                                    widget.onCheckBoxSelected!(
                                        widget.data[index]);
                                  },
                                  child: SquareBox(
                                    iconColor: R.palette.appPrimaryBlue,
                                    innerBoxColor: R.palette.white,
                                    unFillBackColor: R.palette.white,
                                    border: Border.all(
                                      color: R.palette.lightGrey,
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(2)),
                                    checkValue: widget.data[index].isSelected,
                                    squareBoxSize: 20,
                                    iconSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: SubHeading2(
                                    widget.data[index].name,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: R.palette.appWhiteColor,
                                    fontFamily: R.theme.interRegular,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ]
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: Container(
            height: 39.h,
            decoration: BoxDecoration(
              color: R.palette.accentOrangeColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SubHeading(
                    AppLocalizations.of(context).from,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: R.palette.lightBlack,
                    fontFamily: R.theme.larken,
                    fontWeight: FontWeight.w400,
                  ),
                  SubHeading(
                    ' ${viewModel.selectedCountry.code}',
                    fontSize: 14,
                    color: R.palette.lightBlack,
                    fontFamily: R.theme.interRegular,
                    fontWeight: FontWeight.w500,
                  ),
                  SubHeading(
                    '\$${widget.startingAmount}/',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: R.theme.larken,
                    color: R.palette.lightBlack,
                    maxLines: 1,
                  ),
                  SubHeading2(
                    getPerLine(),
                    fontSize: 12,
                    color: R.palette.lightBlack,
                    fontFamily: R.theme.interRegular,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void _onChanged(List<CountryData> data) {}

  Future<List<CountryData>> _findSuggestions(String query) async {
    if (query.isNotEmpty) {
      return countries.where((country) {
        return country.name.toLowerCase().contains(query);
      }).toList(growable: false);
    } else {
      return const <CountryData>[];
    }
  }

  String getDestinationHeadings() {
    if (widget.heading == null) {
      return '';
    }

    if (widget.heading!.toLowerCase().contains('annual')) {
      return AppLocalizations.of(context).destination_heading;
    } else {
      return AppLocalizations.of(context).destinations_to_cover;
    }
  }

  String getPerLine() {
    if (widget.heading == null) {
      return '';
    }

    if (widget.heading!.toLowerCase().contains('annual')) {
      return AppLocalizations.of(context).per_year;
    } else {
      return AppLocalizations.of(context).per_day;
    }
  }

  String getDestinationSubHeadings() {
    if (widget.heading == null) {
      return '';
    }

    if (widget.heading!.toLowerCase().contains('annual')) {
      return AppLocalizations.of(context).select_the_destinations_to_cover;
    } else {
      return AppLocalizations.of(context).traveling_to_multiple_countries;
    }
  }

  void showSheet(BuildContext context, List<Map<String, dynamic>> counties,
      {required String title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setDialogState) {
          return Dialog(
            backgroundColor: R.palette.appWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            surfaceTintColor: R.palette.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SubHeading(
                          title,
                          color: R.palette.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          sl<Navigation>().goBack(context);
                        },
                        child: Image.asset(
                          R.assets.graphics.cross.path,
                          height: 16.0.h,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.w,
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: counties.length,
                    itemBuilder: (BuildContext context, int index) {
                      final country = counties[index];
                      return Container(
                        height: 50.0.h,
                        decoration: BoxDecoration(
                          color: R.palette.transparent,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      height: 25.0.w,
                                      child:
                                          Image.asset(country['image'] ?? '')),
                                  SizedBox(
                                    width: 20.0.w,
                                  ),
                                  Text(country['name'] ?? ''),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5.0.h,
                ),
              ],
            ),
          );
        });
      },
    );
  }
}

// ignore: must_be_immutable
class ExpansionCardDesktopContent extends StatefulWidget {
  final Cover cover;
  final String? heading;
  final String? subHeading;
  final String? textFieldHint;
  final List<AvailableCoverItems> data;
  final String startingAmount;
  final Function(AvailableCoverItems)? onCheckBoxSelected;
  final Function(String)? onTextFieldChanged;
  final Function(Cover)? onCoverSelected;
  bool isSelected = false;
  final List<Map<String, dynamic>> includedCountries;
  final List<Map<String, dynamic>> excludedCountries;

  ExpansionCardDesktopContent({
    Key? key,
    this.heading,
    this.subHeading,
    required this.cover,
    this.isSelected = false,
    required this.data,
    this.textFieldHint,
    this.startingAmount = "1180",
    this.onCheckBoxSelected,
    this.onTextFieldChanged,
    this.onCoverSelected,
    required this.includedCountries,
    required this.excludedCountries,
  }) : super(key: key);

  @override
  State<ExpansionCardDesktopContent> createState() =>
      ExpansionCardDesktopContentState();
}

class ExpansionCardDesktopContentState
    extends State<ExpansionCardDesktopContent> {
  TextEditingController controller = TextEditingController();

  List<CountryModel> includedCountries = [
    CountryModel(countryName: "Australia", countryCode: "AS"),
    CountryModel(countryName: "Brunei", countryCode: "BR"),
    CountryModel(countryName: "Cambodia", countryCode: "CA"),
    CountryModel(countryName: "China", countryCode: "CH"),
    CountryModel(countryName: "Indonesia", countryCode: "IN"),
    CountryModel(countryName: "Japan", countryCode: "JP"),
    CountryModel(countryName: "Laos", countryCode: "LA"),
    CountryModel(countryName: "Macau", countryCode: "MA"),
    CountryModel(countryName: "Malaysia", countryCode: "MY"),
    CountryModel(countryName: "Myanmar", countryCode: "MM"),
    CountryModel(countryName: "New Zealand", countryCode: "NZ"),
    CountryModel(countryName: "Philippines", countryCode: "PH"),
    CountryModel(countryName: "Singapore", countryCode: "SG"),
    CountryModel(countryName: "South Korea", countryCode: "SK"),
    CountryModel(countryName: "Taiwan", countryCode: "TW"),
    CountryModel(countryName: "Thailand", countryCode: "TH"),
    CountryModel(countryName: "Vietnam", countryCode: "VN"),
  ];

  List<CountryModel> excludedCountries = [
    CountryModel(countryName: "Cuba", countryCode: "CU"),
    CountryModel(countryName: "Iran", countryCode: "IR"),
    CountryModel(countryName: "Syria", countryCode: "SY"),
    CountryModel(countryName: "North Korea", countryCode: "KP"),
    CountryModel(countryName: "Ukrain", countryCode: "UA"),
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CoverQuoteViewModel>();
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          // padding: EdgeInsets.only(bottom: 20.h),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.isSelected
                ? R.palette.appPrimaryBlue
                : R.palette.appWhiteColor,
            boxShadow: [
              BoxShadow(
                color: kIsWeb
                    ? R.palette.boxGreyColor.withOpacity(0.5)
                    : R.palette.boxGreyColor,
                blurRadius: 15.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
                offset: const Offset(
                  5.0, // Move to right 5  horizontally
                  5.0, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 39.h,
                decoration: BoxDecoration(
                  color: R.palette.accentOrangeColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SubHeading(
                        AppLocalizations.of(context).from,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: R.palette.lightBlack,
                        fontFamily: R.theme.larken,
                        fontWeight: FontWeight.w400,
                      ),
                      SubHeading(
                        ' ${viewModel.selectedCountry.code}',
                        fontSize: 16,
                        color: R.palette.lightBlack,
                        fontFamily: R.theme.interRegular,
                        fontWeight: FontWeight.w500,
                      ),
                      Heading(
                        '\$${widget.startingAmount}/',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: R.theme.larken,
                        color: R.palette.lightBlack,
                        maxLines: 1,
                      ),
                      SubHeading(
                        getPerLine(),
                        fontSize: 12,
                        color: R.palette.lightBlack,
                        fontFamily: R.theme.interRegular,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SubHeading(
                              widget.heading ?? "",
                              color: widget.isSelected
                                  ? R.palette.appWhiteColor
                                  : R.palette.appHeadingTextBlackColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              fontFamily: R.theme.interRegular,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              child: SubHeading(
                                widget.subHeading ?? "",
                                color: widget.isSelected
                                    ? R.palette.appWhiteColor
                                    : R.palette.lightBlack,
                                fontSize: 16,
                                maxLines: 2,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        )),
                        SizedBox(
                          width: 20.w,
                        ),
                        InkWell(
                          key: const ValueKey("expand_button"),
                          onTap: () {
                            if (!widget.isSelected) {
                              widget.onCoverSelected!(widget.cover);
                              setState(() {});
                              return;
                            }
                            widget.onCoverSelected!(Cover.initial());
                          },
                          child: Container(
                            padding: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                                color: widget.isSelected
                                    ? R.palette.appWhiteColor
                                    : R.palette.appPrimaryBlue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Icon(
                                widget.isSelected
                                    ? Icons.keyboard_arrow_up_rounded
                                    : Icons.keyboard_arrow_down_rounded,
                                color: widget.isSelected
                                    ? R.palette.appPrimaryBlue
                                    : R.palette.appWhiteColor,
                                size: 28.w,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    if (widget.isSelected) ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.h),
                          SubHeading(
                            getDestinationHeadings(),
                            color: widget.isSelected
                                ? R.palette.appWhiteColor
                                : R.palette.appHeadingTextBlackColor,
                            fontSize: 16,
                            maxLines: 2,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: 244.w,
                            child: SubHeading(
                              getDestinationSubHeadings(),
                              color: widget.isSelected
                                  ? R.palette.appWhiteColor
                                  : R.palette.appHeadingTextBlackColor,
                              fontSize: 14,
                              maxLines: 3,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            height: 18.h,
                          ),
                          UserInputBuilder(
                            name: widget.heading ?? '',
                            onAnnual: (context) {
                              return SizedBox(
                                height: 47.h,
                                child: GenericDropDown(
                                  items: [
                                    AppLocalizations.of(context).asia,
                                    AppLocalizations.of(context).world_wide
                                  ],
                                  hintText: viewModel.destinationRegionAnnual ==
                                          DestinationRegionAnnual.none
                                      ? AppLocalizations.of(context).select
                                      : '',
                                  hintColor: R.palette.mediumBlack,
                                  hoverColor: R.palette.hoverGrey,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.h, horizontal: 3.0.w),
                                  filled: true,
                                  value: viewModel.destinationRegionAnnual ==
                                          DestinationRegionAnnual.none
                                      ? null
                                      : viewModel.destinationRegionAnnual ==
                                              DestinationRegionAnnual.asia
                                          ? AppLocalizations.of(context).asia
                                          : AppLocalizations.of(context)
                                              .world_wide,
                                  mapDropDownText: (value) {
                                    return Text(
                                      value,
                                      style: TextStyle(
                                        color: R.palette.mediumBlack,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    );
                                  },
                                  fillColor: R.palette.white,
                                  onDropDownItemChanged: (value) {
                                    if (value ==
                                        AppLocalizations.of(context).asia) {
                                      viewModel.setDestinationRegionAnnual(
                                          DestinationRegionAnnual.asia);
                                    } else if (value ==
                                        AppLocalizations.of(context)
                                            .world_wide) {
                                      viewModel.setDestinationRegionAnnual(
                                          DestinationRegionAnnual.world);
                                    } else {
                                      viewModel.setDestinationRegionAnnual(
                                          DestinationRegionAnnual.none);
                                    }
                                  },
                                  textColor: R.palette.appPrimaryBlue,
                                  hintTextStyle: TextStyle(
                                    color: R.palette.mediumBlack,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  dropDownColor: R.palette.white,
                                  iconColor: R.palette.textFieldHintGreyColor,
                                ),
                              );
                            },
                            onSingle: (context) {
                              return ChipsInput<CountryData>(
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)
                                      .where_are_you_going,
                                  hintStyle: TextStyle(
                                    color: R.palette.mediumBlack,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  border: InputBorder.none,
                                ),
                                findSuggestions: _findSuggestions,
                                onChanged: _onChanged,
                                isWeb: true,
                                chipBuilder: (
                                  BuildContext context,
                                  ChipsInputState<CountryData> state,
                                  CountryData country,
                                  bool isFirst,
                                ) {
                                  return InputChip(
                                    key: ObjectKey(country),
                                    label: Text(
                                      country.name,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: R.theme.interRegular,
                                        color: R.palette.darkAppPrimaryBlue,
                                      ),
                                    ),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    disabledColor:
                                        R.palette.lightBlue.withOpacity(0.2),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        style: BorderStyle.none,
                                        color: R.palette.appPrimaryBlue
                                            .withOpacity(0.1), // Border width
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3.r),
                                      ),
                                    ),
                                    backgroundColor: R.palette.appPrimaryBlue
                                        .withOpacity(0.1),
                                    labelStyle: TextStyle(
                                      color: R.palette.white,
                                      fontSize: 15.sp,
                                    ),
                                  );
                                },
                                suggestionBuilder: (
                                  BuildContext context,
                                  ChipsInputState<CountryData> state,
                                  CountryData country,
                                  bool isFirst,
                                ) {
                                  return InkWell(
                                    onTap: () =>
                                        state.selectSuggestion(country),
                                    child: Container(
                                      color: isFirst
                                          ? R.palette.appGreyTextColor
                                              .withOpacity(0.3)
                                          : null,
                                      key: ObjectKey(country),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 10.h),
                                        child: Text(
                                          country.name,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: R.theme.interRegular,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          viewModel.destinationRegionAnnual !=
                                  DestinationRegionAnnual.none
                              ? CountiesOptionBuilder(
                                  name: widget.heading ?? '',
                                  onAsiaSelected: (BuildContext context) {
                                    return InkWell(
                                      onTap: () {
                                        if (widget
                                            .includedCountries.isNotEmpty) {
                                          showSheet(
                                            context,
                                            widget.includedCountries,
                                            title: AppLocalizations.of(context)
                                                .included_asia_cover_countries,
                                          );
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          bottom:
                                              1, // Space between underline and text
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                          color: R.palette.white,
                                          width: 1.0, // Underline thickness
                                        ))),
                                        child: SubHeading2(
                                          AppLocalizations.of(context)
                                              .included_countries,
                                          color: R.palette.white,
                                          fontFamily: R.theme.interRegular,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    );
                                  },
                                  onWorldSelected: (BuildContext context) {
                                    return InkWell(
                                      onTap: () {
                                        showSheet(
                                          context,
                                          widget.excludedCountries,
                                          title: AppLocalizations.of(context)
                                              .excluded_worldwide_countries_covered,
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          bottom:
                                              1, // Space between underline and text
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                          color: R.palette.white,
                                          width: 1.0, // Underline thickness
                                        ))),
                                        child: SubHeading2(
                                          AppLocalizations.of(context)
                                              .excluded_countries,
                                          color: R.palette.white,
                                          fontFamily: R.theme.interRegular,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    );
                                  },
                                  region: viewModel.destinationRegionAnnual,
                                )
                              : const SizedBox(),
                          viewModel.destinationRegionAnnual !=
                                  DestinationRegionAnnual.none
                              ? SizedBox(
                                  height: 30.h,
                                )
                              : const SizedBox(),
                          SubHeading(
                            AppLocalizations.of(context).do_you_also_want,
                            color: widget.isSelected
                                ? R.palette.appWhiteColor
                                : R.palette.appHeadingTextBlackColor,
                            fontSize: 16,
                            maxLines: 2,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          ListView.builder(
                            itemCount: widget.data.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(top: 10.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.data[index].isSelected =
                                              !widget.data[index].isSelected;
                                        });
                                        widget.onCheckBoxSelected!(
                                            widget.data[index]);
                                      },
                                      child: SquareBox(
                                        iconColor: R.palette.appPrimaryBlue,
                                        innerBoxColor: R.palette.white,
                                        unFillBackColor: R.palette.white,
                                        border: Border.all(
                                          color: R.palette.lightGrey,
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(2)),
                                        checkValue:
                                            widget.data[index].isSelected,
                                        squareBoxSize: 18,
                                        iconSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: SubHeading2(
                                        widget.data[index].name,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: R.palette.appWhiteColor,
                                        fontFamily: R.theme.interRegular,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
        // Positioned(
        //   left: 0,
        //   top: 0,
        //   right: 0,
        //   child: Container(
        //     height: 46.h,
        //     decoration: BoxDecoration(
        //       color: R.palette.accentOrangeColor,
        //       borderRadius: const BorderRadius.only(
        //         topLeft: Radius.circular(10),
        //         topRight: Radius.circular(10),
        //       ),
        //     ),
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 5.w),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           SubHeading(
        //             AppLocalizations.of(context).from,
        //             fontSize: 4.5,
        //             fontStyle: FontStyle.italic,
        //             color: R.palette.lightBlack,
        //             fontFamily: R.theme.larken,
        //             fontWeight: FontWeight.w400,
        //           ),
        //           SubHeading(
        //             ' ${viewModel.selectedCountry.code}',
        //             fontSize: 4.5,
        //             color: R.palette.lightBlack,
        //             fontFamily: R.theme.interRegular,
        //             fontWeight: FontWeight.w500,
        //           ),
        //           Heading(
        //             '\$${widget.startingAmount}/',
        //             fontSize: 5.5,
        //             fontWeight: FontWeight.w600,
        //             fontFamily: R.theme.larken,
        //             color: R.palette.lightBlack,
        //             maxLines: 1,
        //           ),
        //           SubHeading(
        //             getPerLine(),
        //             fontSize: 4.5,
        //             color: R.palette.lightBlack,
        //             fontFamily: R.theme.interRegular,
        //             fontWeight: FontWeight.w500,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }

  void _onChanged(List<CountryData> data) {}

  Future<List<CountryData>> _findSuggestions(String query) async {
    if (query.isNotEmpty) {
      return countries.where((country) {
        return country.name.toLowerCase().contains(query);
      }).toList(growable: false);
    } else {
      return const <CountryData>[];
    }
  }

  String getDestinationHeadings() {
    if (widget.heading == null) {
      return '';
    }

    if (widget.heading!.toLowerCase().contains('annual')) {
      return AppLocalizations.of(context).destination_heading;
    } else {
      return AppLocalizations.of(context).where_are_you_going;
    }
  }

  String getPerLine() {
    if (widget.heading == null) {
      return '';
    }

    if (widget.heading!.toLowerCase().contains('annual')) {
      return AppLocalizations.of(context).per_year;
    } else {
      return AppLocalizations.of(context).per_day;
    }
  }

  String getDestinationSubHeadings() {
    if (widget.heading == null) {
      return '';
    }

    if (widget.heading!.toLowerCase().contains('annual')) {
      return AppLocalizations.of(context).select_the_destinations_to_cover;
    } else {
      return AppLocalizations.of(context).traveling_to_multiple_countries;
    }
  }

  void showSheet(BuildContext context, List<Map<String, dynamic>> counties,
      {required String title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setDialogState) {
          return Dialog(
            child: Container(
              width: 0.43.sw,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SubHeading(
                            title,
                            color: R.palette.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            sl<Navigation>().goBack(context);
                          },
                          child: Image.asset(
                            R.assets.graphics.cross.path,
                            height: 16.0.h,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: counties.length,
                        itemBuilder: (BuildContext context, int index) {
                          final country = counties[index];
                          return Container(
                            height: 60.0.h,
                            decoration: BoxDecoration(
                              color: R.palette.transparent,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 30.w,
                                        height: 30.h,
                                        child: Image.asset(
                                            country['image'] ?? '')),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    SubHeading(
                                      country['name'] ?? '',
                                      color: R.palette.lightGray,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.0.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}

// ignore: must_be_immutable
class ExpansionCardTabletContent extends StatefulWidget {
  final Cover cover;
  final String? heading;
  final String? subHeading;
  final String? textFieldHint;
  final List<AvailableCoverItems> data;
  final String startingAmount;
  final Function(AvailableCoverItems)? onCheckBoxSelected;
  final Function(String)? onTextFieldChanged;
  final Function(Cover)? onCoverSelected;
  bool isSelected = false;
  final List<Map<String, dynamic>> includedCountries;
  final List<Map<String, dynamic>> excludedCountries;

  ExpansionCardTabletContent({
    Key? key,
    this.heading,
    this.subHeading,
    required this.cover,
    this.isSelected = false,
    required this.data,
    this.textFieldHint,
    this.startingAmount = "1180",
    this.onCheckBoxSelected,
    this.onTextFieldChanged,
    this.onCoverSelected,
    required this.includedCountries,
    required this.excludedCountries,
  }) : super(key: key);

  @override
  State<ExpansionCardTabletContent> createState() =>
      ExpansionCardTabletContentState();
}

class ExpansionCardTabletContentState
    extends State<ExpansionCardTabletContent> {
  TextEditingController controller = TextEditingController();

  List<CountryModel> includedCountries = [
    CountryModel(countryName: "Australia", countryCode: "AS"),
    CountryModel(countryName: "Brunei", countryCode: "BR"),
    CountryModel(countryName: "Cambodia", countryCode: "CA"),
    CountryModel(countryName: "China", countryCode: "CH"),
    CountryModel(countryName: "Indonesia", countryCode: "IN"),
    CountryModel(countryName: "Japan", countryCode: "JP"),
    CountryModel(countryName: "Laos", countryCode: "LA"),
    CountryModel(countryName: "Macau", countryCode: "MA"),
    CountryModel(countryName: "Malaysia", countryCode: "MY"),
    CountryModel(countryName: "Myanmar", countryCode: "MM"),
    CountryModel(countryName: "New Zealand", countryCode: "NZ"),
    CountryModel(countryName: "Philippines", countryCode: "PH"),
    CountryModel(countryName: "Singapore", countryCode: "SG"),
    CountryModel(countryName: "South Korea", countryCode: "SK"),
    CountryModel(countryName: "Taiwan", countryCode: "TW"),
    CountryModel(countryName: "Thailand", countryCode: "TH"),
    CountryModel(countryName: "Vietnam", countryCode: "VN"),
  ];

  List<CountryModel> excludedCountries = [
    CountryModel(countryName: "Cuba", countryCode: "CU"),
    CountryModel(countryName: "Iran", countryCode: "IR"),
    CountryModel(countryName: "Syria", countryCode: "SY"),
    CountryModel(countryName: "North Korea", countryCode: "KP"),
    CountryModel(countryName: "Ukrain", countryCode: "UA"),
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CoverQuoteViewModel>();
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: widget.isSelected ? null : 150.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.isSelected
                ? R.palette.appPrimaryBlue
                : R.palette.appWhiteColor,
            boxShadow: [
              BoxShadow(
                color: kIsWeb
                    ? R.palette.boxGreyColor.withOpacity(0.5)
                    : R.palette.boxGreyColor,
                blurRadius: 15.0, // soften the shadow
                spreadRadius: 5.0, //extend the shadow
                offset: const Offset(
                  5.0, // Move to right 5  horizontally
                  5.0, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                SubHeading(
                  widget.heading ?? "",
                  color: widget.isSelected
                      ? R.palette.appWhiteColor
                      : R.palette.appHeadingTextBlackColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 0.375.sw,
                      child: SubHeading(
                        widget.subHeading ?? "",
                        color: widget.isSelected
                            ? R.palette.appWhiteColor
                            : R.palette.appHeadingTextBlackColor,
                        fontSize: 8,
                        maxLines: 2,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(
                      width: 0.01.sw,
                    ),
                    InkWell(
                      key: const ValueKey("expand_button"),
                      onTap: () {
                        if (!widget.isSelected) {
                          widget.onCoverSelected!(widget.cover);
                          setState(() {});
                          return;
                        }
                        widget.onCoverSelected!(Cover.initial());
                      },
                      child: Container(
                        height: 50.r,
                        width: 50.r,
                        decoration: BoxDecoration(
                            color: widget.isSelected
                                ? R.palette.appWhiteColor
                                : R.palette.appPrimaryBlue,
                            borderRadius: BorderRadius.circular(11)),
                        child: Center(
                          child: Icon(
                            widget.isSelected
                                ? Icons.keyboard_arrow_up_rounded
                                : Icons.keyboard_arrow_down_rounded,
                            color: widget.isSelected
                                ? R.palette.appPrimaryBlue
                                : R.palette.appWhiteColor,
                            size: 35.r,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                if (widget.isSelected) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 45.h),
                      SubHeading(
                        getDestinationHeadings(),
                        color: widget.isSelected
                            ? R.palette.appWhiteColor
                            : R.palette.appHeadingTextBlackColor,
                        fontSize: 10,
                        maxLines: 2,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: 244.w,
                        child: SubHeading(
                          getDestinationSubHeadings(),
                          color: widget.isSelected
                              ? R.palette.appWhiteColor
                              : R.palette.appHeadingTextBlackColor,
                          fontSize: 8,
                          maxLines: 3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      UserInputBuilder(
                        name: widget.heading ?? '',
                        onAnnual: (context) {
                          return SizedBox(
                            height: 48.h,
                            child: GenericDropDown(
                              items: [
                                AppLocalizations.of(context).asia,
                                AppLocalizations.of(context).world_wide,
                              ],
                              hintText: viewModel.destinationRegionAnnual ==
                                      DestinationRegionAnnual.none
                                  ? AppLocalizations.of(context).select
                                  : '',
                              hintColor: R.palette.mediumBlack,
                              hoverColor: R.palette.hoverGrey,
                              filled: true,
                              value: viewModel.destinationRegionAnnual ==
                                      DestinationRegionAnnual.none
                                  ? null
                                  : viewModel.destinationRegionAnnual ==
                                          DestinationRegionAnnual.asia
                                      ? AppLocalizations.of(context).asia
                                      : AppLocalizations.of(context).world_wide,
                              mapDropDownText: (value) {
                                return SizedBox(
                                  height: 90.h,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: R.palette.mediumBlack,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                              },
                              fillColor: R.palette.white,
                              onDropDownItemChanged: (value) {
                                if (value ==
                                    AppLocalizations.of(context).asia) {
                                  viewModel.setDestinationRegionAnnual(
                                      DestinationRegionAnnual.asia);
                                } else if (value ==
                                    AppLocalizations.of(context).world_wide) {
                                  viewModel.setDestinationRegionAnnual(
                                      DestinationRegionAnnual.world);
                                } else {
                                  viewModel.setDestinationRegionAnnual(
                                      DestinationRegionAnnual.none);
                                }
                              },
                              textColor: R.palette.appPrimaryBlue,
                              hintTextStyle: TextStyle(
                                  color: R.palette.mediumBlack,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                              dropDownColor: R.palette.white,
                              iconColor: R.palette.textFieldHintGreyColor,
                            ),
                          );
                        },
                        onSingle: (context) {
                          return ChipsInput<CountryData>(
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)
                                  .where_are_you_going,
                              hintStyle: TextStyle(
                                color: R.palette.mediumBlack,
                                fontSize: 6.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                                bottom: 20,
                              ),
                            ),
                            findSuggestions: _findSuggestions,
                            onChanged: _onChanged,
                            chipBuilder: (
                              BuildContext context,
                              ChipsInputState<CountryData> state,
                              CountryData country,
                              bool isFirst,
                            ) {
                              return InputChip(
                                key: ObjectKey(country),
                                label: Text(
                                  country.name,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: R.theme.interRegular,
                                    fontWeight: FontWeight.w500,
                                    color: R.palette.darkAppPrimaryBlue,
                                  ),
                                ),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                disabledColor:
                                    R.palette.lightBlue.withOpacity(0.2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                backgroundColor:
                                    R.palette.appPrimaryBlue.withOpacity(0.1),
                                labelStyle: TextStyle(
                                  color: R.palette.white,
                                  fontSize: 6.sp,
                                ),
                              );
                            },
                            suggestionBuilder: (
                              BuildContext context,
                              ChipsInputState<CountryData> state,
                              CountryData country,
                              bool isFirst,
                            ) {
                              return ListTile(
                                key: ObjectKey(country),
                                title: Text(country.name),
                                tileColor: Colors.red,
                                onTap: () => state.selectSuggestion(country),
                              );
                            },
                          );
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      viewModel.destinationRegionAnnual !=
                              DestinationRegionAnnual.none
                          ? CountiesOptionBuilder(
                              name: widget.heading ?? '',
                              onAsiaSelected: (BuildContext context) {
                                return InkWell(
                                  onTap: () {
                                    if (widget.includedCountries.isNotEmpty) {
                                      showSheet(
                                        context,
                                        widget.includedCountries,
                                        title: AppLocalizations.of(context)
                                            .included_asia_cover_countries,
                                      );
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      bottom:
                                          1, // Space between underline and text
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: R.palette.white,
                                      width: 1.0, // Underline thickness
                                    ))),
                                    child: SubHeading2(
                                      AppLocalizations.of(context)
                                          .included_countries,
                                      color: R.palette.white,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                              },
                              onWorldSelected: (BuildContext context) {
                                return InkWell(
                                  onTap: () {
                                    showSheet(
                                      context,
                                      widget.excludedCountries,
                                      title: AppLocalizations.of(context)
                                          .excluded_worldwide_countries_covered,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                      bottom:
                                          1, // Space between underline and text
                                    ),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                      color: R.palette.white,
                                      width: 1.0, // Underline thickness
                                    ))),
                                    child: SubHeading2(
                                      AppLocalizations.of(context)
                                          .excluded_countries,
                                      color: R.palette.white,
                                      fontFamily: R.theme.interRegular,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                              },
                              region: viewModel.destinationRegionAnnual,
                            )
                          : const SizedBox(),
                      viewModel.destinationRegionAnnual !=
                              DestinationRegionAnnual.none
                          ? SizedBox(
                              height: 30.h,
                            )
                          : const SizedBox(),
                      SubHeading(
                        AppLocalizations.of(context).do_you_also_want,
                        color: widget.isSelected
                            ? R.palette.appWhiteColor
                            : R.palette.appHeadingTextBlackColor,
                        fontSize: 16,
                        maxLines: 2,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ListView.builder(
                        itemCount: widget.data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GenericCheckbox(
                            title: widget.data[index].name,
                            fontSize: 16,
                            rowWidgetsWidth: 5,
                            checkValue: widget.data[index].isSelected,
                            onTap: () {
                              setState(() {
                                widget.data[index].isSelected =
                                    !widget.data[index].isSelected;
                              });
                              widget.onCheckBoxSelected!(widget.data[index]);
                            },
                            iconColor: R.palette.appPrimaryBlue,
                            squareBoxSize: 18,
                          );
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      )
                    ],
                  ),
                ]
              ],
            ),
          ),
        ),
        Positioned(
          top: -0.03.sw,
          right: 16.w,
          child: Container(
            height: 30.w,
            width: 30.w,
            decoration: BoxDecoration(
                color: R.palette.accentOrangeColor,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SubHeading(
                    AppLocalizations.of(context).from,
                    fontSize: 5,
                    fontStyle: FontStyle.italic,
                    textAlign: TextAlign.center,
                    color: R.palette.lightBlack,
                    fontFamily: R.theme.larken,
                    fontWeight: FontWeight.w300,
                  ),
                  Flexible(
                    child: Heading(
                      '\$${widget.startingAmount}',
                      fontSize: 7,
                      fontWeight: FontWeight.w600,
                      fontFamily: R.theme.larken,
                      textAlign: TextAlign.center,
                      color: R.palette.lightBlack,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void _onChanged(List<CountryData> data) {}

  Future<List<CountryData>> _findSuggestions(String query) async {
    if (query.isNotEmpty) {
      return countries.where((country) {
        return country.name.toLowerCase().contains(query);
      }).toList(growable: false);
    } else {
      return const <CountryData>[];
    }
  }

  String getDestinationHeadings() {
    if (widget.heading == null) {
      return '';
    }

    if (widget.heading!.toLowerCase().contains('annual')) {
      return AppLocalizations.of(context).destination_heading;
    } else {
      return AppLocalizations.of(context).where_are_you_going;
    }
  }

  String getDestinationSubHeadings() {
    if (widget.heading == null) {
      return '';
    }

    if (widget.heading!.toLowerCase().contains('annual')) {
      return AppLocalizations.of(context).select_the_destinations_to_cover;
    } else {
      return AppLocalizations.of(context).traveling_to_multiple_countries;
    }
  }

  void showSheet(BuildContext context, List<Map<String, dynamic>> counties,
      {required String title}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setDialogState) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 8.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SubHeading(
                          title,
                          color: R.palette.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          sl<Navigation>().goBack(context);
                        },
                        child: Image.asset(
                          R.assets.graphics.cross.path,
                          height: 16.0.h,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: counties.length,
                    itemBuilder: (BuildContext context, int index) {
                      final country = counties[index];
                      return Container(
                        height: 50.0.h,
                        decoration: BoxDecoration(
                          color: R.palette.appWhiteColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      height: 25.0.w,
                                      child:
                                          Image.asset(country['image'] ?? '')),
                                  SizedBox(
                                    width: 20.0.w,
                                  ),
                                  Text(country['name'] ?? ''),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }
}

const List<Country> countryOptions = <Country>[
  Country(name: 'Africa', size: 30370000),
  Country(name: 'Asia', size: 44579000),
  Country(name: 'Australia', size: 8600000),
  Country(name: 'Bulgaria', size: 110879),
  Country(name: 'Canada', size: 9984670),
  Country(name: 'Denmark', size: 42916),
  Country(name: 'Europe', size: 10180000),
  Country(name: 'India', size: 3287263),
  Country(name: 'North America', size: 24709000),
  Country(name: 'South America', size: 17840000),
];

class Country {
  const Country({
    required this.name,
    required this.size,
  });

  final String name;
  final int size;

  @override
  String toString() {
    return '$name ($size)';
  }
}
