import 'package:digicoach/src/common/utils/storage/base_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navbarControllerProvider =
    ChangeNotifierProvider<NavbarController>((_) => NavbarController());

class NavbarController extends ChangeNotifier {
  bool isCoach = false;

  Future<void> getIsCoach() async {
    isCoach = shareprefrence.readBool("isCoach");
    notifyListeners();
  }
}
