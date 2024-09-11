import 'package:travelbox/data/enum/gadget_cover_state.dart';

class GadgetCover {
  final String title;
  bool isSelected;
  final GadgetCoverState state;

  GadgetCover({
    required this.title,
    this.isSelected = false,
    required this.state,
  });
}
