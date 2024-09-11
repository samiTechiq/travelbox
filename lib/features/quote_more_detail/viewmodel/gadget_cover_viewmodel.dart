import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/data/enum/gadget_cover_state.dart';
import 'package:travelbox/features/quote_more_detail/view/model/gadget_cover.dart';

@LazySingleton()
class GadgetCoverViewModel extends ChangeNotifier {
  String _gadgetCover = '';
  GadgetCoverState _gadgetCoverState = GadgetCoverState.none;

  String get gadgetCover => _gadgetCover;

  GadgetCoverState get gadgetCoverState => _gadgetCoverState;

  void _setGadgetCover(GadgetCover gadgetCover) {
    _gadgetCover = gadgetCover.title;
    _gadgetCoverState = gadgetCover.state;
    notifyListeners();
  }

  void toggleSelected(GadgetCover data, List<GadgetCover> list) {
    for (var element in list) {
      element.isSelected = false;
    }
    data.isSelected = !data.isSelected;
    _setGadgetCover(data);
    notifyListeners();
  }
}
