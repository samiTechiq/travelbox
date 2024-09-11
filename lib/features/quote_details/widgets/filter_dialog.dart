import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_details/viewmodel/quote_detail_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/checkbox/app_square_box.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: FilterDialogMobile(),
      desktopLayout: FilterDialogDesktop(),
    );
  }
}

class FilterDialogMobile extends StatefulWidget {
  const FilterDialogMobile({super.key});

  @override
  State<FilterDialogMobile> createState() => _FilterDialogMobileState();
}

class _FilterDialogMobileState extends State<FilterDialogMobile> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<QuoteDetailViewModel>(),
      builder: (context, child) {
        final viewModel = context.watch<QuoteDetailViewModel>();
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          backgroundColor: R.palette.white,
          surfaceTintColor: R.palette.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
            child: Stack(
              children: [
                Positioned(
                  top: 3,
                  right: 0,
                  child: InkWell(
                    onTap: () {
                      sl<Navigation>().goBack(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Image.asset(
                        R.assets.graphics.cross.path,
                        height: 17.h,
                        width: 17.w,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).filter_your_results,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: R.palette.appHeadingTextBlackColor,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).optional_extras,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: R.palette.appHeadingTextBlackColor,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Column(
                          children: [
                            ExtraItem(
                              title: AppLocalizations.of(context).show_all,
                              extraValue: viewModel.isShowAll,
                              onCheckedExtraItem: () {
                                viewModel.toggleShowAll();
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context).cruise_cover,
                              extraValue: viewModel.isCruiseCover,
                              onCheckedExtraItem: () {
                                viewModel.toggleCruiseCover();
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context).excess_cover,
                              extraValue: viewModel.isRentalCover,
                              onCheckedExtraItem: () {
                                viewModel.toggleRentalCover();
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context)
                                  .rental_protection,
                              extraValue: viewModel.isRentalProtection,
                              onCheckedExtraItem: () {
                                viewModel.toggleRentalProtection();
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context).golf_cover,
                              extraValue: viewModel.isGolfCover,
                              onCheckedExtraItem: () {
                                viewModel.toggleGolfCover();
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context)
                                  .adventure_extreme,
                              extraValue: viewModel.isAdventureExtreme,
                              onCheckedExtraItem: () {
                                viewModel.toggleAdventure();
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context).winter_sports,
                              extraValue: viewModel.isWinterProtection,
                              onCheckedExtraItem: () {
                                viewModel.toggleWinterProtection();
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context)
                                  .personal_protection,
                              extraValue: viewModel.isPersonalProtection,
                              onCheckedExtraItem: () {
                                viewModel.togglePersonalProtection();
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context).gadget_cover,
                              extraValue: viewModel.isGadgetCover,
                              onCheckedExtraItem: () {
                                viewModel.toggleGadgetCover();
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ExtraItem(
                              title:
                                  AppLocalizations.of(context).pet_care_cover,
                              extraValue: viewModel.isPetCareCover,
                              onCheckedExtraItem: () {
                                viewModel.togglePetCareCover();
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SubHeading(
                          AppLocalizations.of(context).include_exclude_show,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: R.palette.appHeadingTextBlackColor,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 0.4.sw,
                              // height: 58.h,
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    viewModel.resetFilters();
                                  },
                                  child: SubHeading(
                                    AppLocalizations.of(context).reset_filters,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: R.palette.appHeadingTextBlackColor,
                                  ),
                                ),
                              ),
                            ),
                            GenericButton(
                              radius: 10.r,
                              width: 0.4.sw,
                              // height: 58.h,
                              onPressed: () async {
                                sl<Navigation>().goBack(context);
                              },
                              text: AppLocalizations.of(context).update_results,
                              fontSize: 18,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class FilterDialogDesktop extends StatefulWidget {
  const FilterDialogDesktop({super.key});

  @override
  State<FilterDialogDesktop> createState() => _FilterDialogDesktopState();
}

class _FilterDialogDesktopState extends State<FilterDialogDesktop> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<QuoteDetailViewModel>(),
      builder: (context, child) {
        final viewModel = context.watch<QuoteDetailViewModel>();
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          backgroundColor: R.palette.white,
          surfaceTintColor: R.palette.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.w),
            child: SizedBox(
              width: 0.4.sw,
              child: Column(
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
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                  SubHeading(
                    AppLocalizations.of(context).filter_your_results,
                    fontWeight: FontWeight.w600,
                    fontSize: 7,
                    color: R.palette.appHeadingTextBlackColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SubHeading(
                    AppLocalizations.of(context).optional_extras,
                    fontWeight: FontWeight.w600,
                    fontSize: 5,
                    color: R.palette.appHeadingTextBlackColor,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 40,
                        child: Column(
                          children: [
                            ExtraItem(
                              title: AppLocalizations.of(context).show_all,
                              extraValue: viewModel.isShowAll,
                              onCheckedExtraItem: () {
                                viewModel.toggleShowAll();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context).cruise_cover,
                              extraValue: viewModel.isCruiseCover,
                              onCheckedExtraItem: () {
                                viewModel.toggleCruiseCover();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context).excess_cover,
                              extraValue: viewModel.isRentalCover,
                              onCheckedExtraItem: () {
                                viewModel.toggleRentalCover();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context)
                                  .rental_protection,
                              extraValue: viewModel.isRentalProtection,
                              onCheckedExtraItem: () {
                                viewModel.toggleRentalProtection();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context).golf_cover,
                              extraValue: viewModel.isGolfCover,
                              onCheckedExtraItem: () {
                                viewModel.toggleGolfCover();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      const Expanded(flex: 5, child: SizedBox()),
                      Expanded(
                        flex: 55,
                        child: Column(
                          children: [
                            ExtraItem(
                              title: AppLocalizations.of(context)
                                  .adventure_extreme,
                              extraValue: viewModel.isAdventureExtreme,
                              onCheckedExtraItem: () {
                                viewModel.toggleAdventure();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context).winter_sports,
                              extraValue: viewModel.isWinterProtection,
                              onCheckedExtraItem: () {
                                viewModel.toggleWinterProtection();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context)
                                  .personal_protection,
                              extraValue: viewModel.isPersonalProtection,
                              onCheckedExtraItem: () {
                                viewModel.togglePersonalProtection();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ExtraItem(
                              title: AppLocalizations.of(context).gadget_cover,
                              extraValue: viewModel.isGadgetCover,
                              onCheckedExtraItem: () {
                                viewModel.toggleGadgetCover();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ExtraItem(
                              title:
                                  AppLocalizations.of(context).pet_care_cover,
                              extraValue: viewModel.isPetCareCover,
                              onCheckedExtraItem: () {
                                viewModel.togglePetCareCover();
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SubHeading(
                    AppLocalizations.of(context).include_exclude_show,
                    fontWeight: FontWeight.w600,
                    fontSize: 5,
                    color: R.palette.appHeadingTextBlackColor,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            viewModel.resetFilters();
                          },
                          child: SubHeading(
                            AppLocalizations.of(context).reset_filters,
                            fontWeight: FontWeight.w600,
                            fontSize: 5,
                            color: R.palette.appHeadingTextBlackColor,
                          ),
                        ),
                      ),
                      GenericButton(
                        width: 60,
                        height: 42,
                        onPressed: () async {
                          sl<Navigation>().goBack(context);
                        },
                        text: AppLocalizations.of(context).update_results,
                        fontSize: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ExtraItem extends StatelessWidget {
  final String title;
  final VoidCallback? onCheckedExtraItem;
  final bool extraValue;

  const ExtraItem({
    super.key,
    this.title = "",
    this.onCheckedExtraItem,
    this.extraValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onCheckedExtraItem,
        child: Row(
          children: [
            SquareBox(
              checkValue: extraValue,
              squareBoxSize: kIsWeb
                  ? MediaQuery.of(context).size.width < 520
                      ? 18.w
                      : 5
                  : 20.h,
              iconSize: kIsWeb
                  ? MediaQuery.of(context).size.width < 520
                      ? 18.w
                      : 4
                  : 13.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width < 520 ? 7.w : 8.w,
            ),
            SubHeading(
              title,
              fontWeight: FontWeight.w400,
              fontSize: kIsWeb
                  ? MediaQuery.of(context).size.width < 520
                      ? 18
                      : 5
                  : 14.sp,
              color: R.palette.mediumBlack,
            ),
          ],
        ),
      ),
    );
  }
}
