import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final wellProvider =
    ChangeNotifierProvider.autoDispose((ref) => WellProvider());

class WellProvider extends ChangeNotifier {}
