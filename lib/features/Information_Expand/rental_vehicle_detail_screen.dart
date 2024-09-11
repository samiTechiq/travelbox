import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/l10n/gen/l10n.dart';
import 'package:travelbox/utils/core/go_router/routes_navigation.dart';
import 'package:travelbox/utils/extensions/string_ext.dart';
import 'package:travelbox/utils/widgets/app_button.dart';
import 'package:travelbox/utils/widgets/app_text.dart';

class RentalVehicle extends StatelessWidget {
  const RentalVehicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.palette.appBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 39.h,
                        ),
                        Container(
                          decoration: R.theme.genericCardDecoration,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 28.w, right: 16.22.w),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: SubHeading(
                                        AppLocalizations.of(context).excess_cover,
                                        fontWeight: FontWeight.w600,
                                        maxLines: 3,
                                        color: R.palette.darkBlack,
                                        fontSize: 24,
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          sl<Navigation>().goBack(context);
                                        },
                                        child: Image.asset(
                                          R.assets.graphics.cross.path,
                                          width: 18.24.w,
                                          height: 18.24.w,
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GenericButton(
                onPressed: () {},
                text: '${AppLocalizations.of(context).add_to_plan_for} HK\$200'.hardcoded,
              ),
              SizedBox(
                height: 22.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
