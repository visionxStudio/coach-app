import 'dart:convert';
import 'package:digicoach/src/features/message/data/message_model.dart';
import 'package:flutter/foundation.dart';

class UserModel {
  final int id;
  final String name;
  final String profile;
  final bool onlineStatus;
  String lastmessage;
  final DateTime msgTime;
  final List<MessageModel>? message;
  UserModel({
    required this.id,
    required this.name,
    required this.profile,
    required this.onlineStatus,
    required this.lastmessage,
    required this.msgTime,
    this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profile': profile,
      'onlineStatus': onlineStatus,
      'lastmessage': lastmessage,
      'msgTime': msgTime.millisecondsSinceEpoch,
      'message': message?.map((x) => x.toMap()).toList(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      profile: map['profile'],
      onlineStatus: map['onlineStatus'],
      lastmessage: map['lastmessage'],
      msgTime: DateTime.fromMillisecondsSinceEpoch(map['msgTime']),
      message: map['message'] != null
          ? List<MessageModel>.from(
              map['message']?.map((x) => MessageModel.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  UserModel copyWith({
    int? id,
    String? name,
    String? profile,
    bool? onlineStatus,
    String? lastmessage,
    DateTime? msgTime,
    List<MessageModel>? message,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      profile: profile ?? this.profile,
      onlineStatus: onlineStatus ?? this.onlineStatus,
      lastmessage: lastmessage ?? this.lastmessage,
      msgTime: msgTime ?? this.msgTime,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, profile: $profile, onlineStatus: $onlineStatus, lastmessage: $lastmessage, msgTime: $msgTime, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.profile == profile &&
        other.onlineStatus == onlineStatus &&
        other.lastmessage == lastmessage &&
        other.msgTime == msgTime &&
        listEquals(other.message, message);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        profile.hashCode ^
        onlineStatus.hashCode ^
        lastmessage.hashCode ^
        msgTime.hashCode ^
        message.hashCode;
  }
}
