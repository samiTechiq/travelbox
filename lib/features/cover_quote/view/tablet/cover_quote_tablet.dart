import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/cover_quote/model/country_data.dart';
import 'package:travelbox/features/cover_quote/utils/cover_shimmer.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/cover_quote/widget/cover_avatar_image.dart';
import 'package:travelbox/features/cover_quote/widget/expension_card.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

import '../../../../data/resources/r.dart';
import '../../../../utils/widgets/default_app_bar.dart';

class CoverQuoteTablet extends StatefulWidget {
  final List<Map<String, dynamic>> includedCountries;
  final List<Map<String, dynamic>> excludedCountries;

  const CoverQuoteTablet({
    Key? key,
    required this.includedCountries,
    required this.excludedCountries,
  }) : super(key: key);

  @override
  State<CoverQuoteTablet> createState() => _CoverQuoteTabletState();
}

class _CoverQuoteTabletState extends State<CoverQuoteTablet> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CoverQuoteViewModel>();
    return Container(
      color: R.palette.appBackgroundColor,
      width: 0.5.sw,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: R.palette.appBackgroundColor,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const GenericAppBar(),
                  SizedBox(
                    width: 0.5.sw,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        const Center(child: AvatarImage()),
                        SizedBox(
                          height: 20.h,
                        ),
                        Heading(
                          AppLocalizations.of(context).greeting,
                          fontSize: 10,
                          color: R.palette.appHeadingTextBlackColor,
                          fontFamily: R.theme.larkenLightFontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Heading(
                          AppLocalizations.of(context).how_can_i_help,
                          fontSize: 10,
                          color: R.palette.appHeadingTextBlackColor,
                          fontFamily: R.theme.larkenLightFontFamily,
                          fontWeight: FontWeight.normal,
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        if (!viewModel.isLoading &&
                            viewModel.coverList.isNotEmpty) ...[
                          ListView.separated(
                            itemBuilder: (context, index) {
                              final cover = viewModel.coverList[index];
                              return ExpansionCard(
                                isSelected: viewModel.selectedCover.coverId ==
                                    cover.coverId,
                                includedCountries: widget.includedCountries,
                                excludedCountries: widget.excludedCountries,
                                cover: cover,
                                heading: cover.name,
                                subHeading: cover.shortDescription ?? '',
                                textFieldHint:
                                AppLocalizations.of(context).destination_heading,
                                data: cover.availableCoverItems,
                                startingAmount:
                                cover.startingPrice.amount.toString(),
                                onCheckBoxSelected: (value) {
                                  viewModel.setCheckBox(value);
                                },
                                onTextFieldChanged: (destination) {
                                  viewModel.setDestination(destination);
                                },
                                onCoverSelected: (cover) {
                                  viewModel.setCover(cover);
                                },
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 70.h,
                              );
                            },
                            shrinkWrap: true,
                            itemCount: viewModel.coverList.length,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                        ],
                        CoverShimmer().showCoverShimmer(viewModel.isLoading),
                        SizedBox(
                          height: 30.0.h,
                        ),
                        CoverShimmer().showCoverShimmer(viewModel.isLoading),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SubHeading2(
                              AppLocalizations.of(context).i_live_in,
                              fontFamily: R.theme.interRegular,
                              fontSize: 8.sp,
                              color: R.palette.textFieldHintGreyColor,
                            ),
                            SubHeading2(
                              '${viewModel.selectedCountry.name}.',
                              fontFamily: R.theme.interRegular,
                              fontSize:  8.sp,
                              fontWeight: FontWeight.bold,
                              color: R.palette.mediumBlack,
                            ),
                            InkWell(
                              onTap: () {
                                if (viewModel.countryList.isEmpty) return;
                                showSheet(
                                    context, viewModel.countryList, viewModel);
                              },
                              child: SubHeading2(
                                AppLocalizations.of(context).change,
                                color: R.palette.appPrimaryBlue,
                                fontFamily: R.theme.interRegular,
                                fontSize: 8.sp,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GenericButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              sl<Navigation>().push(context, Routes.basicInfo);
                            }
                          },
                          fontSize: 9,
                          text: AppLocalizations.of(context).get_your_quote,
                          isEnable: viewModel.timeframeSelected !=
                              AvailableCoversTimeFrame.none,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Center(
                          child: SubHeading(
                            AppLocalizations.of(context).friend_refer,
                            fontSize: 6,
                            color: R.palette.appHeadingTextBlackColor,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSheet(BuildContext context, List<CountryData> counties,
      CoverQuoteViewModel viewModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            child: Column(
              children: [
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 8.0.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubHeading(
                        AppLocalizations.of(context).select_country,
                        color: R.palette.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
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
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: counties.length,
                    itemBuilder: (BuildContext context, int index) {
                      final country = counties[index];
                      return InkWell(
                        onTap: () {
                          viewModel.setCountry(country);
                        },
                        child: Container(
                          height: 50.0.h,
                          decoration: BoxDecoration(
                            color: (country.code == viewModel.selectedCountry.code)
                                ? R.palette.appGreyTextColor.withOpacity(0.3)
                                : R.palette.appWhiteColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(country.name),
                              ],
                            ),
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
