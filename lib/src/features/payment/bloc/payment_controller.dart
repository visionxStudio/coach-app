import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final paymentControllerProvider =
    ChangeNotifierProvider<PaymentControllerProvider>(
        (_) => PaymentControllerProvider());

class PaymentControllerProvider extends ChangeNotifier {
  bool isAddingCard = false;

  String cardNumber = "";

  void toggleIsAddingCard({required bool value}) {
    isAddingCard = value;

    notifyListeners();
  }

  String formatCardNumber({required String cardNumber}) {
    // TODO implementation of format card logic and return string into the main Ui
    return cardNumber;
  }
}
