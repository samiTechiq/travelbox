import 'package:flutter/cupertino.dart';
import 'package:travelbox/features/cover_quote/viewmodel/cover_quote_viewmodel.dart';

class CountiesOptionBuilder extends StatelessWidget {
  final String name;
  final DestinationRegionAnnual region;
  final WidgetBuilder onAsiaSelected;
  final WidgetBuilder onWorldSelected;

  const CountiesOptionBuilder(
      {Key? key,
      required this.name,
      required this.onAsiaSelected,
      required this.onWorldSelected,
      required this.region})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (name.toLowerCase().contains('annual')) {
      switch (region) {
        case DestinationRegionAnnual.asia:
          return onAsiaSelected(context);
        case DestinationRegionAnnual.world:
          return onWorldSelected(context);
        case DestinationRegionAnnual.none:
          return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }
}
