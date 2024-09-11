import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/data/resources/r.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/utils/widgets/app_text.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class ExpansionRow extends StatelessWidget {
  final String tileTitle;
  final String? subTile;
  final String? subTileData;
  final String? linkText;
  final List<CoverItems>? data;
  final int? listCount;
  final Function()? onTap;

  const ExpansionRow(
      {super.key,
      required this.tileTitle,
      this.subTile,
      this.linkText,
      this.onTap,
      this.listCount,
      this.subTileData,
      this.data});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileLayout: ExpansionRowMobile(
          tileTitle: tileTitle,
          subTile: subTile,
          linkText: linkText,
          onTap: onTap,
          listCount: listCount,
          subTileData: subTileData,
          data: data,
        ),
        desktopLayout: ExpansionRowDesktop(
          tileTitle: tileTitle,
          subTile: subTile,
          linkText: linkText,
          onTap: onTap,
          listCount: listCount,
          subTileData: subTileData,
          data: data,
        ));
  }
}

class ExpansionRowMobile extends StatefulWidget {
  final String tileTitle;
  final String? subTile;
  final String? subTileData;
  final String? linkText;
  final List<CoverItems>? data;
  final int? listCount;
  final Function()? onTap;

  const ExpansionRowMobile(
      {Key? key,
      required this.tileTitle,
      this.subTile,
      this.linkText,
      this.onTap,
      this.listCount,
      this.subTileData,
      this.data})
      : super(key: key);

  @override
  State<ExpansionRowMobile> createState() => _ExpansionRowMobileState();
}

class _ExpansionRowMobileState extends State<ExpansionRowMobile> {
  bool expandPlusTile = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubHeading(
              widget.tileTitle,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: R.palette.darkBlack,
            ),
            IconButton(
                onPressed: () {
                  if (expandPlusTile) {
                    setState(() {
                      expandPlusTile = false;
                    });
                  } else {
                    setState(() {
                      expandPlusTile = true;
                    });
                  }
                },
                icon: Image.asset(
                  expandPlusTile
                      ? R.assets.graphics.minusImage.path
                      : R.assets.graphics.addImage.path,
                  width: 16.w,
                ))
          ],
        ),
        if (widget.data != null) ...[
          Visibility(
            visible: expandPlusTile,
            child: ListView.builder(
              itemCount: widget.data?.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: widget.data != null,
                      child: SizedBox(
                        height: index == 0 ? 0.h : 17.h,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Visibility(
                            visible: widget.data?[index].name != null,
                            child: SubHeading(
                              widget.data![index].name!,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: R.palette.darkBlack,
                            ),
                          ),
                        ),
                        SubHeading(
                          "${widget.data?[index].amountCovered?.currency ?? ''}${widget.data?[index].amountCovered?.amount ?? ''} ",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: R.palette.darkBlack,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
        Visibility(
            visible: expandPlusTile,
            child: SizedBox(
              height: 30.h,
            )),
        Visibility(
          visible: expandPlusTile,
          child: InkWell(
            onTap: widget.onTap,
            child: SubHeading(
              widget.linkText ?? "",
              fontSize: 14,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w400,
              color: R.palette.appPrimaryBlue,
            ),
          ),
        ),
      ],
    );
  }
}

class ExpansionRowDesktop extends StatefulWidget {
  final String tileTitle;
  final String? subTile;
  final String? subTileData;
  final String? linkText;
  final List<CoverItems>? data;
  final int? listCount;
  final Function()? onTap;

  const ExpansionRowDesktop(
      {Key? key,
      required this.tileTitle,
      this.subTile,
      this.linkText,
      this.onTap,
      this.listCount,
      this.subTileData,
      this.data})
      : super(key: key);

  @override
  State<ExpansionRowDesktop> createState() => _ExpansionRowDesktopState();
}

class _ExpansionRowDesktopState extends State<ExpansionRowDesktop> {
  bool expandPlusTile = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubHeading(
              widget.tileTitle,
              fontSize: 5,
              fontWeight: FontWeight.w500,
              color: R.palette.darkBlack,
            ),
            IconButton(
                onPressed: () {
                  if (expandPlusTile) {
                    setState(() {
                      expandPlusTile = false;
                    });
                  } else {
                    setState(() {
                      expandPlusTile = true;
                    });
                  }
                },
                icon: Image.asset(
                  expandPlusTile
                      ? R.assets.graphics.minusImage.path
                      : R.assets.graphics.addImage.path,
                  width: 4.w,
                ))
          ],
        ),
        if (widget.data != null) ...[
          Visibility(
            visible: expandPlusTile,
            child: ListView.builder(
              itemCount: widget.data?.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: widget.data != null,
                      child: SizedBox(
                        height: index == 0 ? 0.h : 17.h,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Visibility(
                            // visible: widget.data?[index].name != null,
                            child: SubHeading(
                              widget.data?[index].name ?? "AHmad",
                              fontSize: 4,
                              fontWeight: FontWeight.w400,
                              color: R.palette.darkBlack,
                            ),
                          ),
                        ),
                        Flexible(
                          child: SubHeading(
                            "${widget.data?[index].amountCovered?.currency ?? 'PKR'}${widget.data?[index].amountCovered?.amount ?? '100'} ",
                            fontSize: 4,
                            fontWeight: FontWeight.w400,
                            color: R.palette.darkBlack,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
        Visibility(
            visible: expandPlusTile,
            child: SizedBox(
              height: 30.h,
            )),
        Visibility(
          visible: expandPlusTile,
          child: InkWell(
            onTap: widget.onTap,
            child: SubHeading(
              widget.linkText ?? "",
              fontSize: 4,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w400,
              color: R.palette.appPrimaryBlue,
            ),
          ),
        ),
      ],
    );
  }
}
