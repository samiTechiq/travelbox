import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:travelbox/data/di/dependeny_injection.dart';
import 'package:travelbox/features/cover_quote/view/desktop/cover_quote_desktop.dart';
import 'package:travelbox/features/cover_quote/view/mobile/cover_quote_mobile.dart';
import 'package:travelbox/features/cover_quote/view/tablet/cover_quote_tablet.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';
import 'package:travelbox/utils/widgets/responsive_layout.dart';

class CoverQuote extends StatefulWidget {
  static const id = '/coverQuote_screen';

  const CoverQuote({Key? key}) : super(key: key);

  @override
  State<CoverQuote> createState() => _CoverQuoteState();
}

class _CoverQuoteState extends State<CoverQuote> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<CoverQuoteViewModel>(),
      builder: (context, child) {
        return const CoverQuoteContent();
      },
    );
  }
}

class CoverQuoteContent extends StatefulWidget {
  const CoverQuoteContent({
    super.key,
  });

  @override
  State<CoverQuoteContent> createState() => _CoverQuoteContentState();
}

class _CoverQuoteContentState extends State<CoverQuoteContent> {
  List<Map<String, dynamic>> includedCountries = [];
  List<Map<String, dynamic>> excludedCountries = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await loadIncludedCountriesJson();
      await loadExcludedCountriesJson();
    });
    context.read<CoverQuoteViewModel>().getCountries('en', 'US');
    context.read<CoverQuoteViewModel>().getCoverQuote('en', 'US');
  }

  loadIncludedCountriesJson() async {
    String data =
        await rootBundle.loadString('assets/data/included_countries.json');
    final jsonResult = jsonDecode(data);
    setState(() {
      includedCountries = List.from(jsonResult);
    });
  }

  loadExcludedCountriesJson() async {
    String data =
        await rootBundle.loadString('assets/data/excluded_countries.json');
    final jsonResult = jsonDecode(data);
    setState(() {
      excludedCountries = List.from(jsonResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: CoverQuoteMobile(
        includedCountries: includedCountries,
        excludedCountries: excludedCountries,
      ),
      desktopLayout: CoverQuoteDesktop(
        includedCountries: includedCountries,
        excludedCountries: excludedCountries,
      ),
      tabletLayout: CoverQuoteTablet(
        includedCountries: includedCountries,
        excludedCountries: excludedCountries,
      ),
    );
  }
}
