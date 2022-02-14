// To parse this JSON data, do
//
//     final localProductByPurchaseIdTotalResponse = localProductByPurchaseIdTotalResponseFromMap(jsonString);

import 'dart:convert';

class LocalProductByPurchaseIdTotalResponse {
  LocalProductByPurchaseIdTotalResponse({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  int? data;
  String? token;

  factory LocalProductByPurchaseIdTotalResponse.fromJson(String str) =>
      LocalProductByPurchaseIdTotalResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalProductByPurchaseIdTotalResponse.fromMap(
          Map<String, dynamic> json) =>
      LocalProductByPurchaseIdTotalResponse(
        message: json["message"],
        success: json["success"],
        data: json["data"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data,
        "token": token,
      };
}
