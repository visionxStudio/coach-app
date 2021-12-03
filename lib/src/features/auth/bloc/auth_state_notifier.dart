import 'dart:async';

import 'package:digicoach/src/features/auth/data/auth_repositiories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_state_notifier.freezed.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (ref) => AuthStateNotifier(ref.watch(authRepoProvider)));

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this._authRepo) : super(const _Unknown()) {
    scheduleMicrotask(() => checkAuthState());
  }

  final AuthRepository _authRepo;

  Future<void> checkAuthState() async {
    final result = await _authRepo.getUser();
    // await Future.delayed(const Duration(seconds: 1));
    if (result == null) {
      state = const _Unauthenticated();
    } else {
      state = const _Authenticated();
    }
  }
}
