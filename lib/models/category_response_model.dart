// To parse this JSON data, do
//
//     final categoryResponseModel = categoryResponseModelFromMap(jsonString);

import 'dart:convert';

class CategoryResponseModel {
  CategoryResponseModel({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  DataCategory? data;
  String? token;

  factory CategoryResponseModel.fromJson(String str) =>
      CategoryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryResponseModel.fromMap(Map<String, dynamic> json) =>
      CategoryResponseModel(
        message: json["message"],
        success: json["success"],
        data: json["data"] != null ? DataCategory.fromMap(json["data"]) : null,
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data?.toMap(),
        "token": token,
      };
}

class CategoryAllResponseModel {
  CategoryAllResponseModel({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  List<DataCategory>? data;
  String? token;

  factory CategoryAllResponseModel.fromJson(String str) =>
      CategoryAllResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryAllResponseModel.fromMap(Map<String, dynamic> json) =>
      CategoryAllResponseModel(
        message: json["message"],
        success: json["success"],
        data: List<DataCategory>.from(
            json["data"].map((x) => DataCategory.fromMap(x))),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": List<DataCategory>.from(data!.map((x) => x.toMap())),
        "token": token,
      };
}

class DataCategory {
  DataCategory({
    required this.id,
    required this.category,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String category;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory DataCategory.fromJson(String str) =>
      DataCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataCategory.fromMap(Map<String, dynamic> json) => DataCategory(
        id: json["id"],
        category: json["category"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category": category,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
