import 'dart:io';
import 'dart:async';
import 'package:device_info/device_info.dart';
import 'package:digicoach/src/common/constants/api_link.dart';
import 'package:digicoach/src/common/service/repo.dart';
import 'package:digicoach/src/common/service/shared_pref_provider.dart';
import 'package:digicoach/src/common/utils/storage/base_storage.dart';
import 'package:digicoach/src/features/auth/data/model/auth_session.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepoProvider = Provider((ref) => AuthRepository());

abstract class IAuthRepository {
  Future<AuthSession?> getUser();
  Future<void> login({required String mobileNumber, required String idToken});
  Future<void> signupWithPhone({required String mobileNumber});
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
  Future<void> signupWithPhone({required String mobileNumber}) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: mobileNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential authCredential) async {
          // await FirebaseAuth.instance.signInWithCredential(authCredential);
        },
        verificationFailed: (FirebaseAuthException authException) {},
        codeSent: (String verificationId, int? resendToken) async {
          shareprefrence.remove("verificationId");
          await shareprefrence.save("verificationId", verificationId);
        },
        codeAutoRetrievalTimeout: (String s) {},
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> login(
      {required String mobileNumber, required String idToken}) async {
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

    try {
      await client.post(
        ApiLink.login,
        data: {
          "phone": mobileNumber,
          "id_token": idToken,
          "device_name": deviceModel
        },
      ).then(
        (response) async {
          final data = response;
          await Future.wait([
            AuthSession.toStorage(AuthSession.fromJson(data['payload'])),
          ]);
          SharedPrefProvider.instance
              .setString("token", data['payload']['token']);
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> logout() {
    throw UnimplementedError();
  }

  @override
  Future<bool> loginWithFacebook() {
    throw UnimplementedError();
  }

  @override
  Future<bool> loginWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<bool> loginWithTwitter() {
    throw UnimplementedError();
  }
}
