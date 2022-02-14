// To parse this JSON data, do
//
//     final localPurchaseIdResponse = localPurchaseIdResponseFromMap(jsonString);

import 'dart:convert';

class LocalPurchaseIdResponse {
  LocalPurchaseIdResponse({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  List<String>? data;
  dynamic token;

  factory LocalPurchaseIdResponse.fromJson(String str) =>
      LocalPurchaseIdResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalPurchaseIdResponse.fromMap(Map<String, dynamic> json) =>
      LocalPurchaseIdResponse(
        message: json["message"],
        success: json["success"],
        data: json["data"] != null ? List<String>.from(json["data"].map((x) => x)):null,
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data != null ? List<dynamic>.from(data!.map((x) => x)) : null,
        "token": token,
      };
}
