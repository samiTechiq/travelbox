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
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

import '../../../../data/resources/r.dart';
import '../../../../utils/widgets/default_app_bar.dart';

class CoverQuoteDesktop extends StatefulWidget {
  final List<Map<String, dynamic>> includedCountries;
  final List<Map<String, dynamic>> excludedCountries;

  const CoverQuoteDesktop({
    Key? key,
    required this.includedCountries,
    required this.excludedCountries,
  }) : super(key: key);

  @override
  State<CoverQuoteDesktop> createState() => _CoverQuoteDesktopState();
}

class _CoverQuoteDesktopState extends State<CoverQuoteDesktop> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CoverQuoteViewModel>();
    final loginViewModel = context.watch<LoginViewmodel>();
    return Scaffold(
      backgroundColor: R.palette.appBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GenericAppBarDesktop(
                          showLanguageIcon:
                              loginViewModel.loginState ? false : true,
                          onTrailingPressed: () {
                            _showMyDialog();
                          },
                          leading: Padding(
                            padding: EdgeInsets.only(left: 25.w),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: R.palette.mediumBlack,
                            ),
                          ),
                          onLeadingPressed: () {
                            sl<Navigation>().goBack(context);
                          },
                          trailing: loginViewModel.loginState
                              ? SizedBox(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 25.w),
                                    child: IconButton(
                                      icon: SvgPicture.asset(
                                        R.assets.graphics.person2.path,
                                        height: 60.h,
                                        width: 60.w,
                                      ),
                                      onPressed: () {
                                        sl<Navigation>()
                                            .push(context, Routes.profileRoute);
                                      },
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          isClickable: false,
                        ),
                        SizedBox(
                          width: 0.35.sw,
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
                              SubHeading2(
                                AppLocalizations.of(context).greeting,
                                fontSize: 34,
                                color: R.palette.appHeadingTextBlackColor,
                                fontFamily: R.theme.larkenLightFontFamily,
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SubHeading2(
                                AppLocalizations.of(context).how_can_i_help,
                                fontSize: 34,
                                color: R.palette.appHeadingTextBlackColor,
                                fontFamily: R.theme.larkenLightFontFamily,
                                fontWeight: FontWeight.w400,
                                height: 1.2,
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              if (!viewModel.isLoading &&
                                  viewModel.coverList.isNotEmpty) ...[
                                ListView.separated(
                                  itemBuilder: (context, index) {
                                    final cover = viewModel.coverList[index];
                                    return ExpansionCard(
                                      isSelected:
                                          viewModel.selectedCover.coverId ==
                                              cover.coverId,
                                      includedCountries:
                                          widget.includedCountries,
                                      excludedCountries:
                                          widget.excludedCountries,
                                      cover: cover,
                                      heading: cover.name,
                                      subHeading: cover.shortDescription ?? '',
                                      textFieldHint:
                                          AppLocalizations.of(context)
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
                              CoverShimmer()
                                  .showCoverShimmer(viewModel.isLoading),
                              SizedBox(
                                height: 30.0.h,
                              ),
                              CoverShimmer()
                                  .showCoverShimmer(viewModel.isLoading),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 1.0.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SubHeading2(
                                      AppLocalizations.of(context).i_live_in,
                                      fontFamily: R.theme.interRegular,
                                      fontSize: 16,
                                      color: R.palette.textFieldHintGreyColor,
                                    ),
                                    SubHeading2(
                                      '${viewModel.selectedCountry.name}. ',
                                      fontFamily: R.theme.interRegular,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: R.palette.mediumBlack,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showSheet(context,
                                            viewModel.countryList, viewModel);
                                      },
                                      child: SubHeading2(
                                        AppLocalizations.of(context).change,
                                        color: R.palette.appPrimaryBlue,
                                        fontFamily: R.theme.interRegular,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              GenericButton(
                                width: 0.35.sw,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    sl<Navigation>()
                                        .push(context, Routes.basicInfo);
                                  }
                                },
                                fontSize: 20,
                                text:
                                    AppLocalizations.of(context).get_your_quote,
                                isEnable: viewModel.timeframeSelected !=
                                    AvailableCoversTimeFrame.none,
                              ),
                              // SizedBox(
                              //   height: 20.h,
                              // ),
                              // Center(
                              //   child: SubHeading(
                              //     AppLocalizations.of(context).friend_refer,
                              //     fontSize: 5,
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            backgroundColor: R.palette.appWhiteColor,
            surfaceTintColor: R.palette.transparent,
            child: SizedBox(
              width: 0.433.sw,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              sl<Navigation>().goBack(context);
                            },
                            child: Image.asset(
                              R.assets.graphics.cross.path,
                              height: 14.h,
                            ),
                          ),
                        ),
                        SubHeading(
                          AppLocalizations.of(context).select_country,
                          color: R.palette.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: counties.length,
                      itemBuilder: (BuildContext context, int index) {
                        CountryData country = counties[index];
                        return InkWell(
                          onTap: () {
                            viewModel.setCountry(country);
                            if (country.code == viewModel.selectedCountry.code) {
                              sl<Navigation>().goBack(context);
                              return;
                            }
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
                                  vertical: 6.h, horizontal: 14.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                    width: 30.h,
                                    child: Image.asset(country.image ?? ''),
                                  ),
                                  SizedBox(width: 5.w),
                                  SubHeading(
                                    country.name,
                                    color: R.palette.lightGray,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 6.w),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const LanguageDialog();
      },
    );
  }
}
