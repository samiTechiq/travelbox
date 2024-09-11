import 'package:flutter/material.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/const/const_data.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/quote_more_detail/view/widget/terms_and_policy_popup.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/extensions/date_time_ext.dart';
import 'package:travelbox/utils/widgets/app_rich_text.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class CopyRightBottom extends StatelessWidget {
  const CopyRightBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: CopyRightBottomMobile(),
      desktopLayout: CopyRightBottomDesktop(),
    );
  }
}

class CopyRightBottomDesktop extends StatelessWidget {
  const CopyRightBottomDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: R.palette.bgBlack,
      child: Padding(
        padding: EdgeInsets.only(left: 99, right: 148, top: 81, bottom: 81),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(
              AppLocalizations.of(context).lbl_contact_us_copyright,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: R.palette.white,
              maxLines: 10,
              fontFamily: R.theme.roboto,
            ),
            SizedBox(
              height: 7,
            ),
            SubHeading(
              AppLocalizations.of(context).lbl_contact_us_copyright_2,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: R.palette.white,
              maxLines: 10,
              fontFamily: R.theme.roboto,
            ),
            SizedBox(
              height: 30,
            ),
            SubHeading(
              AppLocalizations.of(context).lbl_contact_us_copyright_3,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: R.theme.roboto,
              color: R.palette.white,
              maxLines: 10,
            ),
            SizedBox(
              height: 30,
            ),
            TermsAndCondtions(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: R.theme.roboto,
              color: R.palette.white,
              title: '${AppLocalizations.of(context).txt_our} ',
              link: AppLocalizations.of(context).txt_privacy_policy,
              subTitle: AppLocalizations.of(context).txt_termsConditions,
              onPrivacyPress: () {
                _showDialog(
                  context,
                  TermsAndPolicyPopup(
                    title: AppLocalizations.of(context).txt_privacy_policy,
                    subtitle: AppLocalizations.of(context).txt_effective_date(
                        DateTime(2024, 1, 1).formatToDoPattern),
                    content: termsData,
                  ),
                );
              },
              onTermPress: () {
                _showDialog(
                  context,
                  TermsAndPolicyPopup(
                    title: AppLocalizations.of(context).txt_termsConditions,
                    subtitle: AppLocalizations.of(context).txt_effective_date(
                        DateTime(2024, 1, 1).formatToDoPattern),
                    content: termsData,
                  ),
                );
              },
              endTextSpan: TextSpan(
                text: ' ${AppLocalizations.of(context).txt_apply}.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: R.theme.interRegular,
                  fontSize: 14,
                  color: R.palette.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, Widget dialog) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}

class CopyRightBottomMobile extends StatelessWidget {
  const CopyRightBottomMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: R.palette.bgBlack,
      child: Padding(
        padding: EdgeInsets.only(left: 26, right: 30, top: 85, bottom: 77),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHeading(
              AppLocalizations.of(context).lbl_contact_us_copyright,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: R.palette.white,
              maxLines: 10,
              fontFamily: R.theme.roboto,
            ),
            SizedBox(
              height: 8,
            ),
            SubHeading(
              AppLocalizations.of(context).lbl_contact_us_copyright_2,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: R.palette.white,
              maxLines: 10,
              fontFamily: R.theme.roboto,
            ),
            SizedBox(
              height: 40,
            ),
            SubHeading(
              AppLocalizations.of(context).lbl_contact_us_copyright_3,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: R.palette.white,
              maxLines: 10,
              fontFamily: R.theme.roboto,
            ),
            SizedBox(
              height: 40,
            ),
            TermsAndCondtions(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: R.theme.roboto,
              color: R.palette.white,
              title: '${AppLocalizations.of(context).txt_our} ',
              link: AppLocalizations.of(context).txt_privacy_policy,
              subTitle: AppLocalizations.of(context).txt_termsConditions,
              onPrivacyPress: () {
                _showDialog(
                  context,
                  TermsAndPolicyPopup(
                    title: AppLocalizations.of(context).txt_termsConditions,
                    subtitle: AppLocalizations.of(context).txt_effective_date(
                        DateTime(2024, 1, 1).formatToDoPattern),
                    content: termsData,
                  ),
                );
              },
              onTermPress: () {
                _showDialog(
                  context,
                  TermsAndPolicyPopup(
                    title: AppLocalizations.of(context).txt_privacy_policy,
                    subtitle: AppLocalizations.of(context).txt_effective_date(
                        DateTime(2024, 1, 1).formatToDoPattern),
                    content: termsData,
                  ),
                );
              },
              endTextSpan: TextSpan(
                text: ' ${AppLocalizations.of(context).txt_apply}.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: R.theme.interRegular,
                  fontSize: 14,
                  color: R.palette.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, Widget dialog) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}
