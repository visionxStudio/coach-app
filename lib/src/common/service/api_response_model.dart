import 'dart:convert';

class ApiResponse {
  String status;
  String message;
  final dynamic payload;
  final String? metadata;
  ApiResponse({
    required this.status,
    required this.message,
    required this.payload,
    this.metadata,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'payload': payload,
      'meta_data': metadata,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      status: map['status'],
      message: map['message'],
      payload: map['payload'],
      metadata: map['meta_data'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source));
}
