import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:digicoach/src/common/constants/api_link.dart';
import 'package:digicoach/src/common/service/repo.dart';
import 'package:digicoach/src/common/service/shared_pref_provider.dart';
import 'package:digicoach/src/features/auth/data/model/auth_session.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepoProvider = Provider((ref) => AuthRepository());

abstract class IAuthRepository {
  Future<AuthSession?> getUser();
  Future<void> login({required String email, required String password});
  Future<bool> loginWithFacebook();
  Future<bool> loginWithTwitter();
  Future<bool> loginWithGoogle();
  Future<String> logout();
}

class AuthRepository extends Repo implements IAuthRepository {
  @override
  Future<AuthSession?> getUser() async {
    try {
      return AuthSession.fromStorage();
    } catch (_) {
      await SharedPrefProvider.instance.clear();
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    // get device model
    final deviceInfo = DeviceInfoPlugin();
    late String deviceModel;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceModel = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceModel = iosInfo.utsname.machine;
    } else {
      deviceModel = '';
    }

    // login
    await client.post(
      ApiLink.login,
      data: {"email": email, "password": password, "device_name": deviceModel},
    ).then(
      (response) async {
        final data = response;
        await Future.wait([
          AuthSession.toStorage(AuthSession.fromJson(data['payload'])),
        ]);
      },
    );
  }

  @override
  Future<String> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<bool> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<bool> loginWithTwitter() {
    // TODO: implement loginWithTwitter
    throw UnimplementedError();
  }
}
