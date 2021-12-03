import 'package:digicoach/src/common/utils/storage/base_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainappProvider = ChangeNotifierProvider((_) => MainAppProvider());

class MainAppProvider extends ChangeNotifier {
  String token = '';

  init() async {
    // httpService.init();
    token = await shareprefrence.read("token");
  }
}
