import 'dart:convert';
import 'package:digicoach/src/features/message/data/reaction_model.dart';

class MessageModel {
  final int id;
  final int senderId;
  final int reciverId;
  final String message;
  final bool seen;
  final bool deliver;
  final DateTime messageTime;
  ReactionModel? reaction;
  MessageModel({
    required this.id,
    required this.senderId,
    required this.reciverId,
    required this.message,
    required this.seen,
    required this.deliver,
    required this.messageTime,
    this.reaction,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'reciverId': reciverId,
      'message': message,
      'seen': seen,
      'deliver': deliver,
      'messageTime': messageTime.millisecondsSinceEpoch,
      'reaction': reaction?.toMap(),
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id'],
      senderId: map['senderId'],
      reciverId: map['reciverId'],
      message: map['message'],
      seen: map['seen'],
      deliver: map['deliver'],
      messageTime: DateTime.fromMillisecondsSinceEpoch(map['messageTime']),
      reaction: map['reaction'] != null
          ? ReactionModel.fromMap(map['reaction'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageModel &&
        other.id == id &&
        other.senderId == senderId &&
        other.reciverId == reciverId &&
        other.message == message &&
        other.seen == seen &&
        other.deliver == deliver &&
        other.messageTime == messageTime &&
        other.reaction == reaction;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        senderId.hashCode ^
        reciverId.hashCode ^
        message.hashCode ^
        seen.hashCode ^
        deliver.hashCode ^
        messageTime.hashCode ^
        reaction.hashCode;
  }

  @override
  String toString() {
    return 'MessageModel(id: $id, senderId: $senderId, reciverId: $reciverId, message: $message, seen: $seen, deliver: $deliver, messageTime: $messageTime, reaction: $reaction)';
  }

  MessageModel copyWith({
    int? id,
    int? senderId,
    int? reciverId,
    String? message,
    bool? seen,
    bool? deliver,
    DateTime? messageTime,
    ReactionModel? reaction,
  }) {
    return MessageModel(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      reciverId: reciverId ?? this.reciverId,
      message: message ?? this.message,
      seen: seen ?? this.seen,
      deliver: deliver ?? this.deliver,
      messageTime: messageTime ?? this.messageTime,
      reaction: reaction ?? this.reaction,
    );
  }
}
