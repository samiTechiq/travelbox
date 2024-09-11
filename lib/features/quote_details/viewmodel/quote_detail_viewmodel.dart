import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:travelbox/features/questions/model/quote_model.dart';
import 'package:travelbox/features/quote_details/model/order_model.dart';

import '../usecase/order_usecase.dart';

@LazySingleton()
class QuoteDetailViewModel extends ChangeNotifier {
  final GetOrderUsecase getOrderUsecase;
  double totalPrice = 0.0;
  String? currency;
  late OrderModel order;
  bool isShowAll = true;
  bool isCruiseCover = true;
  bool isRentalCover = true;
  bool isRentalProtection = true;
  bool isGolfCover = true;
  bool isAdventureExtreme = true;
  bool isWinterProtection = true;
  bool isPersonalProtection = true;
  bool isGadgetCover = true;
  bool isPetCareCover = true;

  String? _selectedPlan;

  List<String> selectedAddOn = [];

  bool isAddOnSelected(String id) {
    return selectedAddOn.contains(id);
  }

  void updateAddOn(String id, double price) {
    if (selectedAddOn.contains(id)) {
      selectedAddOn.remove(id);
      removeFromPrice(price);
    } else {
      selectedAddOn.add(id);
      addToPrice(price);
    }
  }

  void toggleShowAll() {
    isShowAll = !isShowAll;
    if (isShowAll) {
      isCruiseCover = true;
      isRentalCover = true;
      isRentalProtection = true;
      isGolfCover = true;
      isAdventureExtreme = true;
      isWinterProtection = true;
      isPersonalProtection = true;
      isGadgetCover = true;
      isPetCareCover = true;
    } else {
      isCruiseCover = false;
      isRentalCover = false;
      isRentalProtection = false;
      isGolfCover = false;
      isAdventureExtreme = false;
      isWinterProtection = false;
      isPersonalProtection = false;
      isGadgetCover = false;
      isPetCareCover = false;
    }
    notifyListeners();
  }

  void _validateShowAllCheckBox() {
    if (isCruiseCover &&
        isRentalCover &&
        isRentalProtection &&
        isGolfCover &&
        isAdventureExtreme &&
        isWinterProtection &&
        isPersonalProtection &&
        isGadgetCover &&
        isPetCareCover) {
      isShowAll = true;
    } else {
      isShowAll = false;
    }
  }

  void toggleCruiseCover() {
    isCruiseCover = !isCruiseCover;
    _validateShowAllCheckBox();
    notifyListeners();
  }

  void toggleRentalCover() {
    isRentalCover = !isRentalCover;
    _validateShowAllCheckBox();
    notifyListeners();
  }

  void toggleRentalProtection() {
    isRentalProtection = !isRentalProtection;
    _validateShowAllCheckBox();
    notifyListeners();
  }

  void toggleGolfCover() {
    isGolfCover = !isGolfCover;
    _validateShowAllCheckBox();
    notifyListeners();
  }

  void toggleAdventure() {
    isAdventureExtreme = !isAdventureExtreme;
    _validateShowAllCheckBox();
    notifyListeners();
  }

  void toggleWinterProtection() {
    isWinterProtection = !isWinterProtection;
    _validateShowAllCheckBox();
    notifyListeners();
  }

  void togglePersonalProtection() {
    isPersonalProtection = !isPersonalProtection;
    _validateShowAllCheckBox();
    notifyListeners();
  }

  void toggleGadgetCover() {
    isGadgetCover = !isGadgetCover;
    _validateShowAllCheckBox();
    notifyListeners();
  }

  void togglePetCareCover() {
    isPetCareCover = !isPetCareCover;
    _validateShowAllCheckBox();
    notifyListeners();
  }

  void resetFilters() {
    isShowAll = true;
    isCruiseCover = true;
    isRentalCover = true;
    isRentalProtection = true;
    isGolfCover = true;

    isAdventureExtreme = true;
    isWinterProtection = true;
    isPersonalProtection = true;
    isGadgetCover = true;
    isPetCareCover = true;
    notifyListeners();
  }

  QuoteDetailViewModel({required this.getOrderUsecase});

  Quote? selectedQuote;

  void setQuote(Quote val) {
    selectedQuote = val;
    totalPrice = val.quotePrice?.amount?.toDouble() ?? 0.0;
    currency = val.quotePrice?.currency ?? '';
    notifyListeners();
  }

  void addToPrice(double value) {
    totalPrice = totalPrice + value;
    notifyListeners();
  }

  void removeFromPrice(double value) {
    totalPrice = totalPrice - value;
    notifyListeners();
  }

  Future<OrderModel?> getOrder() async {
    if (selectedQuote == null) return null;
    try {
      final GetOrderRequest getOrderRequest = GetOrderRequest(
          language: 'en', country: 'US', quoteId: selectedQuote!.quoteId!);
      final result = await getOrderUsecase(getOrderRequest);
      order = result;
      notifyListeners();
      return result;
    } catch (e) {
      return null;
    }
  }

  String? get selectedPlan => _selectedPlan;

  void setSelectedPlan(String? plan, double planPrice) {
    if (_selectedPlan == plan) {
      _selectedPlan = null;
      removeFromPrice(planPrice);
    } else {
      _selectedPlan = plan;
      addToPrice(planPrice);
    }
    notifyListeners();
  }
}
