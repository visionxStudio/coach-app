import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final genderProvider = ChangeNotifierProvider<GenderController>(
  (ref) => GenderController(),
);

class GenderController extends ChangeNotifier {
  int selectedGenderIndex = 0;

  void changeGenderIndex(int index) {
    selectedGenderIndex = index;
    notifyListeners();
  }
}
