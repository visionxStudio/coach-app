import 'dart:convert';

class ReactionModel {
  final int id;
  final int reactid;
  final String react;
  ReactionModel({
    required this.id,
    required this.reactid,
    required this.react,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'reactid': reactid,
      'react': react,
    };
  }

  factory ReactionModel.fromMap(Map<String, dynamic> map) {
    return ReactionModel(
      id: map['id'],
      reactid: map['reactid'],
      react: map['react'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReactionModel.fromJson(String source) =>
      ReactionModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ReactionModel(id: $id, reactid: $reactid, react: $react)';

  ReactionModel copyWith({
    int? id,
    int? reactid,
    String? react,
  }) {
    return ReactionModel(
      id: id ?? this.id,
      reactid: reactid ?? this.reactid,
      react: react ?? this.react,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReactionModel &&
        other.id == id &&
        other.reactid == reactid &&
        other.react == react;
  }

  @override
  int get hashCode => id.hashCode ^ reactid.hashCode ^ react.hashCode;
}
