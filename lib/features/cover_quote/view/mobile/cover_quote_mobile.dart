import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/change_language/language_dialog.dart';
import 'package:travelbox/features/cover_quote/model/country_data.dart';
import 'package:travelbox/features/cover_quote/utils/cover_shimmer.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/cover_quote/widget/cover_avatar_image.dart';
import 'package:travelbox/features/cover_quote/widget/expension_card.dart';
import 'package:travelbox/features/login/viewmodel/login_viewmodel.dart';
import 'package:travelbox/features/profile/profile.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

import '../../../../data/resources/r.dart';
import '../../../../utils/widgets/default_app_bar.dart';

class CoverQuoteMobile extends StatefulWidget {
  final List<Map<String, dynamic>> includedCountries;
  final List<Map<String, dynamic>> excludedCountries;

  const CoverQuoteMobile({
    Key? key,
    required this.includedCountries,
    required this.excludedCountries,
  }) : super(key: key);

  @override
  State<CoverQuoteMobile> createState() => _CoverQuoteMobileState();
}

class _CoverQuoteMobileState extends State<CoverQuoteMobile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CoverQuoteViewModel>();
    final loginViewModel = context.watch<LoginViewmodel>();
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenericAppBarMobile(
                          isClickable: false,
                          trailing: SvgPicture.asset(
                            loginViewModel.loginState
                                ? R.assets.graphics.person2.path
                                : R.assets.graphics.webIcon.path,
                            height: 45.h,
                            width: 45.w,
                          ),
                          leading: Padding(
                            padding: EdgeInsets.only(right: 9.w),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: R.palette.mediumBlack,
                            ),
                          ),
                          onTrailingPressed: () {
                            loginViewModel.loginState
                                ? _showMyDialog(const ProfileScreen())
                                : _showMyDialog(const LanguageDialog());
                          },
                          onLeadingPressed: () {
                            sl<Navigation>().goBack(context);
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        const Center(child: AvatarImage()),
                        SizedBox(
                          height: 25.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).greeting,
                          fontSize: 36,
                          color: R.palette.appHeadingTextBlackColor,
                          fontFamily: R.theme.larkenLightFontFamily,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                        ),
                        // SizedBox(
                        //   height: 2.h,
                        // ),
                        SizedBox(
                          width: 0.8.sw,
                          child: SubHeading(
                            AppLocalizations.of(context).how_can_i_help,
                            fontSize: 36,
                            color: R.palette.appHeadingTextBlackColor,
                            fontFamily: R.theme.larkenLightFontFamily,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
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
                                textFieldHint: AppLocalizations.of(context)
                                    .destination_heading,
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
                                height: 30.h,
                              );
                            },
                            shrinkWrap: true,
                            itemCount: viewModel.coverList.length,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                        ],
                        CoverShimmer().showCoverShimmer(viewModel.isLoading),
                        SizedBox(
                          height: 20.h,
                        ),
                        CoverShimmer().showCoverShimmer(viewModel.isLoading),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SubHeading(
                              AppLocalizations.of(context).i_live_in,
                              fontFamily: R.theme.interRegular,
                              fontSize: 18,
                              color: R.palette.lightGray,
                            ),
                            SubHeading(
                              '${viewModel.selectedCountry.name}. ',
                              fontFamily: R.theme.interRegular,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: R.palette.mediumBlack,
                            ),
                            InkWell(
                              onTap: () {
                                if (viewModel.countryList.isEmpty) return;
                                showSheet(
                                    context, viewModel.countryList, viewModel);
                              },
                              child: SubHeading(
                                AppLocalizations.of(context).change,
                                color: R.palette.appPrimaryBlue,
                                fontFamily: R.theme.interRegular,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        GenericButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              sl<Navigation>().push(context, Routes.basicInfo);
                            }
                          },
                          text: AppLocalizations.of(context).get_your_quote,
                          isEnable: viewModel.timeframeSelected !=
                              AvailableCoversTimeFrame.none,
                        ),
                        // SizedBox(
                        //   height: 17.h,
                        // ),
                        // Center(
                        //   child: SubHeading(
                        //     AppLocalizations.of(context).friend_refer,
                        //     fontSize: 18,
                        //     color: R.palette.appHeadingTextBlackColor,
                        //     fontWeight: FontWeight.w600,
                        //     decoration: TextDecoration.underline,
                        //   ),
                        // ),
                        SizedBox(
                          height: 36.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
            backgroundColor: R.palette.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            surfaceTintColor: R.palette.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SubHeading(
                          AppLocalizations.of(context).select_country,
                          color: R.palette.black,
                          fontSize: 19,
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
                  height: 20.h,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: counties.length,
                  itemBuilder: (BuildContext context, int index) {
                    final country = counties[index];
                    return InkWell(
                      onTap: () {
                        viewModel.setCountry(country);
                        sl<Navigation>().goBack(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              (country.code == viewModel.selectedCountry.code)
                                  ? R.palette.hoverGrey
                                  : R.palette.appWhiteColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0.w, vertical: 8.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 31.h,
                                width: 31.h,
                                child: Image.asset(country.image ?? ''),
                              ),
                              SizedBox(width: 10.w),
                              SubHeading(
                                country.name,
                                color: R.palette.appGreyTextColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20.w),
              ],
            ),
          );
        });
      },
    );
  }

  Future<void> _showMyDialog(Widget widget) async {
    return showDialog<void>(
      context: context,
      barrierColor: const Color.fromARGB(1, 255, 255, 255),
      barrierDismissible: false,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}
