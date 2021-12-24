import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectAccountProvider = ChangeNotifierProvider<ConnectAccountController>(
    (_) => ConnectAccountController());

class ConnectAccountController extends ChangeNotifier {}
