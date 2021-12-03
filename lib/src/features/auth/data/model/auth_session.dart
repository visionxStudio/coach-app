import 'dart:convert';

import 'package:digicoach/src/common/service/shared_pref_provider.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_session.freezed.dart';
part 'auth_session.g.dart';

@freezed
class AuthSession with _$AuthSession {
  const factory AuthSession({
    required String token,
  }) = _AuthSession;

  factory AuthSession.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionFromJson(json);

  static AuthSession? fromStorage() {
    final authSession = SharedPrefProvider.instance.getString('authSession');
    if (authSession == null) return null;
    return AuthSession.fromJson(
        jsonDecode(authSession) as Map<String, dynamic>);
  }

  static Future<void> toStorage(AuthSession session) async {
    await SharedPrefProvider.instance
        .setString('authSession', jsonEncode(session));
  }
}
