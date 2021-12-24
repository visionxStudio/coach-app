import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homepageControllerProvider =
    ChangeNotifierProvider<HomePageController>((_) => HomePageController());

class HomePageController extends ChangeNotifier {
  int switchIndex = 0;

  void changeIndex(int index) {
    switchIndex = index;
    notifyListeners();
  }
}
