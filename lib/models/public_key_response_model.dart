// To parse this JSON data, do
//
//     final publicKeyResponseModel = publicKeyResponseModelFromMap(jsonString);

import 'dart:convert';

class PublicKeyResponseModel {
  PublicKeyResponseModel({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  String? data;
  String? token;

  factory PublicKeyResponseModel.fromJson(String str) =>
      PublicKeyResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PublicKeyResponseModel.fromMap(Map<String, dynamic> json) =>
      PublicKeyResponseModel(
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
