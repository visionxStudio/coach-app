import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final datePickerControllerProvider =
    ChangeNotifierProvider.autoDispose<DatePickerController>(
        (_) => DatePickerController());

class DatePickerController extends ChangeNotifier {
  DateTime dateTime = DateTime(DateTime.now().year);
  bool isDateChanged = false;

  void changeDateTime({required DateTime date}) {
    isDateChanged = true;
    dateTime = date;
    notifyListeners();
  }
}
