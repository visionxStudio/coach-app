import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customTabControllerProvider =
    ChangeNotifierProvider.autoDispose<CustomTabController>(
        (_) => CustomTabController());

class CustomTabController extends ChangeNotifier {
  int index = 0;

  void changeIndex({required int value}) {
    index = value;
    notifyListeners();
  }
}
