import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelbox/utils/widgets/phone_field/countries.dart';
import 'package:travelbox/utils/widgets/phone_field/helpers.dart';

class PickerDialogStyle {
  final Color? backgroundColor;

  final TextStyle? countryCodeStyle;

  final TextStyle? countryNameStyle;

  final Widget? listTileDivider;

  final EdgeInsets? listTilePadding;

  final EdgeInsets? padding;

  final Color? searchFieldCursorColor;

  final InputDecoration? searchFieldInputDecoration;

  final EdgeInsets? searchFieldPadding;

  final double? width;

  PickerDialogStyle({
    this.backgroundColor,
    this.countryCodeStyle,
    this.countryNameStyle,
    this.listTileDivider,
    this.listTilePadding,
    this.padding,
    this.searchFieldCursorColor,
    this.searchFieldInputDecoration,
    this.searchFieldPadding,
    this.width,
  });
}

class CountryPickerDialog extends StatefulWidget {
  final List<Country> countryList;
  final Country selectedCountry;
  final ValueChanged<Country> onCountryChanged;
  final String searchText;
  final TextStyle? searchTextStyle;
  final List<Country> filteredCountries;
  final PickerDialogStyle? style;
  final String languageCode;

  const CountryPickerDialog({
    Key? key,
    required this.searchText,
    required this.languageCode,
    required this.countryList,
    required this.onCountryChanged,
    required this.selectedCountry,
    required this.filteredCountries,
    this.style,
    this.searchTextStyle,
  }) : super(key: key);

  @override
  State<CountryPickerDialog> createState() => _CountryPickerDialogState();
}

class _CountryPickerDialogState extends State<CountryPickerDialog> {
  late List<Country> _filteredCountries;
  late Country _selectedCountry;

  @override
  void initState() {
    _selectedCountry = widget.selectedCountry;
    _filteredCountries = widget.filteredCountries.toList()
      ..sort(
        (a, b) => a
            .localizedName(widget.languageCode)
            .compareTo(b.localizedName(widget.languageCode)),
      );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final width = widget.style?.width ?? mediaWidth;
    const defaultHorizontalPadding = 40.0;
    const defaultVerticalPadding = 24.0;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: EdgeInsets.symmetric(
          vertical: defaultVerticalPadding,
          horizontal: mediaWidth > (width + defaultHorizontalPadding * 2)
              ? (mediaWidth - width) / 2
              : defaultHorizontalPadding),
      backgroundColor: widget.style?.backgroundColor ?? Colors.white,
      surfaceTintColor: Colors.transparent,
      child: Container(
        width: kIsWeb
            ? MediaQuery.of(context).size.width < 520
                ? 0.85.sw
                : 0.45.sw
            : null,
        padding: widget.style?.padding ??
            EdgeInsets.symmetric(
              horizontal: kIsWeb
                  ? MediaQuery.of(context).size.width < 520
                      ? 10.w
                      : 0
                  : 25.w,
              vertical: kIsWeb
                  ? MediaQuery.of(context).size.width < 520
                      ? 5.h
                      : 15.h
                  : 10.h,
            ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: widget.style?.searchFieldPadding ??
                  EdgeInsets.symmetric(
                    horizontal: kIsWeb ? MediaQuery.of(context).size.width < 520 ? 5.h : 10.w : 0,
                  ),
              child: TextField(
                cursorColor: widget.style?.searchFieldCursorColor,
                decoration: widget.style?.searchFieldInputDecoration ??
                    InputDecoration(
                      labelText: widget.searchText,
                      labelStyle: widget.searchTextStyle,
                      contentPadding: EdgeInsets.zero,
                    ),
                onChanged: (value) {
                  _filteredCountries = widget.countryList.stringSearch(value)
                    ..sort(
                      (a, b) => a
                          .localizedName(widget.languageCode)
                          .compareTo(b.localizedName(widget.languageCode)),
                    );
                  if (mounted) setState(() {});
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filteredCountries.length,
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        _selectedCountry = _filteredCountries[index];
                        widget.onCountryChanged(_selectedCountry);
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            kIsWeb ? SizedBox(width: 10.w) : const SizedBox(),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0.r),
                              child: Image.asset(
                                'assets/flags/${_filteredCountries[index].code.toLowerCase()}.png',
                                package: 'intl_phone_field',
                                width:
                                MediaQuery.of(context).size.width > 520 ? 26 : 21.w,
                                height:
                                MediaQuery.of(context).size.width > 520 ? 26 : 21.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: kIsWeb ? 15 : 10),
                            Expanded(
                              child: Text(
                                _filteredCountries[index]
                                    .localizedName(widget.languageCode),
                                style: widget.style?.countryNameStyle ??
                                    const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                              ),
                            ),
                            Text(
                              '+${_filteredCountries[index].dialCode}',
                              style: widget.style?.countryCodeStyle ??
                                  const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: kIsWeb ? 12 : 10),
                            ),
                            kIsWeb ? SizedBox(width: 10.w) : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
