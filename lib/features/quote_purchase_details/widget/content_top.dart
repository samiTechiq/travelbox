import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/features/questions/views/start_end_picker_screen/widget/titile_widget_builder.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class ContentTop extends StatelessWidget {
  const ContentTop({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: ContentTopMobile(),
      desktopLayout: ContentTopDesktop(),
    );
  }
}

class ContentTopMobile extends StatelessWidget {
  const ContentTopMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading(
            AppLocalizations.of(context).details_about_your_policy,
            fontSize: 32,
            fontWeight: FontWeight.w400,
            fontFamily: R.theme.larkenLightFontFamily,
            color: R.palette.appHeadingTextBlackColor,
          ),
          SizedBox(
            height: 12.h,
          ),
          TitleWidgetBuilder(
            timeFrame: sl<CoverQuoteViewModel>().timeframeSelected,
          ),
        ],
      ),
    );
  }
}

class ContentTopDesktop extends StatelessWidget {
  const ContentTopDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Heading(
            AppLocalizations.of(context).here_your_quote,
            fontSize: 11,
            fontWeight: FontWeight.w400,
            fontFamily: R.theme.larkenLightFontFamily,
            color: R.palette.appHeadingTextBlackColor,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: TitleWidgetBuilder(
            timeFrame: sl<CoverQuoteViewModel>().timeframeSelected,
            fontSize: 7.5,
          ),
        ),
      ],
    );
  }
}