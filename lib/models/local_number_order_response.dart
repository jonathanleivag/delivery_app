// To parse this JSON data, do
//
//     final localNumberOrderResponse = localNumberOrderResponseFromMap(jsonString);

import 'dart:convert';

class LocalNumberOrderResponse {
  LocalNumberOrderResponse({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  List<int>? data;
  dynamic token;

  factory LocalNumberOrderResponse.fromJson(String str) =>
      LocalNumberOrderResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalNumberOrderResponse.fromMap(Map<String, dynamic> json) =>
      LocalNumberOrderResponse(
        message: json["message"],
        success: json["success"],
        data: List<int>.from(json["data"].map((x) => x)),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data != null ? List<dynamic>.from(data!.map((x) => x)) : null,
        "token": token,
      };
}
