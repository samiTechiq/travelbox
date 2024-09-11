import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_constants.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class CoveredBox extends StatelessWidget {
  const CoveredBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: CoveredBoxMobile(),
      desktopLayout: CoveredBoxDesktop(),
    );
  }
}

class CoveredBoxDesktop extends StatelessWidget {
  const CoveredBoxDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingVM = context.watch<OnboardingViewModel>();

    return DecoratedBox(
      decoration: BoxDecoration(color: R.palette.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(100, 110, 100, 110),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context).whats_covered,
              style: R.theme.robotoW600.copyWith(
                fontSize: 42,
                color: R.palette.appHeadingTextBlackColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              AppLocalizations.of(context).txt_covered_description,
              textAlign: TextAlign.center,
              textScaler: TextScaler.linear(1.1),
              style: R.theme.robotoTextStyle.copyWith(
                fontSize: 16,
                color: R.palette.appHeadingTextBlackColor,
                height: 1.6,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 62,
            ),
            LayoutGrid(columnSizes: [1.fr, 1.fr, 1.fr, 1.fr], rowSizes: const [auto],
              columnGap: 20,
              children: onboardingVM.insurancePolicies
                  .mapIndexed(
                    (index, policy) => CoveredItem(
                      image: SvgPicture.asset(policy.coverImage ?? ''),
                      label: policy.title,
                      content: policy.policies
                          .map(
                            (policyDetail) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: policy.isExtras ? 4.0 : 6),
                                child: SvgPicture.asset(policy
                                    .isExtras
                                    ? R.assets.graphics.icExtra.path
                                    : R.assets.graphics.icCheck.path),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  policyDetail,
                                  textAlign: TextAlign.start,
                                  maxLines: 3,
                                  textScaler: TextScaler.linear(1.1),
                                  overflow: TextOverflow.ellipsis,
                                  style: R.theme.robotoTextStyle
                                      .copyWith(
                                      fontSize: 16,
                                      color: R.palette
                                          .appHeadingTextBlackColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                          .toList(),
                    ),
              )
                  .toList(),
            ),
            // SizedBox(
            //   width: double.infinity,
            //   height: 404,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     mainAxisSize: MainAxisSize.max,
            //     children: onboardingVM.insurancePolicies
            //         .mapIndexed(
            //           (index, policy) => Expanded(
            //             child: Padding(
            //               padding: EdgeInsets.only(
            //                 left: index > 0 &&
            //                         index <
            //                             onboardingVM.insurancePolicies.length
            //                     ? 10
            //                     : 0,
            //                 right: index >= 0 &&
            //                         index <
            //                             onboardingVM.insurancePolicies.length
            //                     ? 10
            //                     : 0,
            //               ),
            //               child: CoveredItem(
            //                 image: SvgPicture.asset(policy.coverImage ?? ''),
            //                 label: policy.title,
            //                 content: policy.policies
            //                     .map(
            //                       (policyDetail) => Padding(
            //                         padding: const EdgeInsets.only(bottom: 8.0),
            //                         child: Row(
            //                           mainAxisSize: MainAxisSize.min,
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.start,
            //                           crossAxisAlignment:
            //                               CrossAxisAlignment.start,
            //                           children: [
            //                             Padding(
            //                               padding: EdgeInsets.only(
            //                                   top: policy.isExtras ? 4.0 : 6),
            //                               child: SvgPicture.asset(policy
            //                                       .isExtras
            //                                   ? R.assets.graphics.icExtra.path
            //                                   : R.assets.graphics.icCheck.path),
            //                             ),
            //                             const SizedBox(
            //                               width: 8,
            //                             ),
            //                             Expanded(
            //                               child: Text(
            //                                 policyDetail,
            //                                 textAlign: TextAlign.start,
            //                                 maxLines: 3,
            //                                 overflow: TextOverflow.ellipsis,
            //                                 style: R.theme.robotoTextStyle
            //                                     .copyWith(
            //                                         fontSize: 16,
            //                                         color: R.palette
            //                                             .appHeadingTextBlackColor),
            //                               ),
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                     )
            //                     .toList(),
            //               ),
            //             ),
            //           ),
            //         )
            //         .toList(),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class CoveredBoxMobile extends StatelessWidget {
  const CoveredBoxMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingVM = context.watch<OnboardingViewModel>();

    return DecoratedBox(
      decoration: BoxDecoration(color: R.palette.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 110, 25, 110),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context).whats_covered,
              style: R.theme.robotoW600.copyWith(
                fontSize: 34,
                color: R.palette.appHeadingTextBlackColor,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              AppLocalizations.of(context).txt_covered_description,
              textAlign: TextAlign.center,
              style: R.theme.robotoTextStyle.copyWith(
                fontSize: 16,
                color: R.palette.appHeadingTextBlackColor,
                height: 1.6,
              ),
            ),
            const SizedBox(
              height: 62,
            ),
            ...onboardingVM.insurancePolicies
                .mapIndexed(
                  (index, policy) => Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: CoveredItem(
                      image: SvgPicture.asset(policy.coverImage ?? ''),
                      label: policy.title,
                      content: policy.policies
                          .map(
                            (policyDetail) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: policy.isExtras ? 4.0 : 6),
                                    child: SvgPicture.asset(policy.isExtras
                                        ? R.assets.graphics.icExtra.path
                                        : R.assets.graphics.icCheck.path),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      policyDetail,
                                      textAlign: TextAlign.start,
                                      maxLines: 3,
                                      textScaler: TextScaler.linear(1.1),
                                      overflow: TextOverflow.ellipsis,
                                      style: R.theme.robotoTextStyle.copyWith(
                                          fontSize: 16,
                                          color: R.palette
                                              .appHeadingTextBlackColor),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                )
                .toList(),
            const SizedBox(
              height: 60,
            ),
            AppButton.generic(
              text: AppLocalizations.of(context)
                  .btn_checking_pricing_and_coverage,
              textColor: R.palette.white,
              fontFamily: R.theme.interRegular,
              textSize: 15,
              onPressed: () {
                sl<Navigation>().push(context, Routes.coverQuoteRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CoveredItem extends StatelessWidget {
  final Widget? image;
  final String label;
  final List<Widget>? content;

  const CoveredItem({
    super.key,
    this.image,
    required this.label,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: R.palette.textFieldBorderGreyColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (image != null) ...[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: R.palette.cottonBollBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SizedBox(
                  width: 85,
                  height: 85,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: image,
                  ),
                ),
              ),
              const SizedBox(
                height: 27,
              ),
            ],
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  textScaler: TextScaler.linear(1.2),
                  style: R.theme.robotoW600.copyWith(
                    fontSize: 22,
                    color: R.palette.mediumBlack,
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                ...content ?? [],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
