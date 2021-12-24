import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageProvider =
    ChangeNotifierProvider<LanguageContoller>((_) => LanguageContoller());

class LanguageContoller extends ChangeNotifier {
  List<String> selectedLanguage = [];

  void addLanguage(String language) {
    if (selectedLanguage.contains(language)) {
      selectedLanguage.remove(language);
    } else {
      selectedLanguage.addAll([language]);
    }
    notifyListeners();
  }
}
