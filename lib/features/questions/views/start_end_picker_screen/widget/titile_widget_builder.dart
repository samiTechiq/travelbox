import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

class TitleWidgetBuilder extends StatelessWidget {
  final AvailableCoversTimeFrame timeFrame;
  final double fontSize;
  final double imageSize;

  const TitleWidgetBuilder({
    Key? key,
    required this.timeFrame,
    this.fontSize = 24,
    this.imageSize = 52,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (timeFrame) {
      case AvailableCoversTimeFrame.annual:
        return Row(
          children: [
            Image.asset(
              R.assets.graphics.shield.path,
              height: kIsWeb ? MediaQuery.of(context).size.width < 520 ? 56.h : 56 : 56.0.h,
              width: kIsWeb ? MediaQuery.of(context).size.width < 520 ? 52.w : 52 : 52.0.w,
            ),
            SizedBox(
              width: kIsWeb ? 9.w : 2.0.w,
            ),
            Flexible(
              child: SubHeading(
                AppLocalizations.of(context).annual_trip_cover,
                fontWeight: FontWeight.w600,
                color: R.palette.darkBlack,
                fontSize: fontSize,
              ),
            ),
          ],
        );

      case AvailableCoversTimeFrame.single:
        return Row(
          children: [
            Image.asset(
              R.assets.graphics.shield.path,
              height: kIsWeb ? MediaQuery.of(context).size.width < 520 ? 42 : 56 : 56.0.h,
              width: kIsWeb ? MediaQuery.of(context).size.width < 520 ? 42 : 52 : 52.0.w,
            ),
            SizedBox(
              width: kIsWeb ? 3 : 2.0.w,
            ),
            Flexible(
              child: SubHeading(
                AppLocalizations.of(context).single_trip_cover,
                fontWeight: FontWeight.w600,
                color: R.palette.darkBlack,
                fontSize: fontSize,
              ),
            )
          ],
        );

      default:
        return const Text('');
    }
  }
}
