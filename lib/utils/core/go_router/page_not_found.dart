import 'package:flutter/material.dart';
import 'package:travelbox/l10n/gen/l10n.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).txt_no_page_found,
      ),
    );
  }
}
