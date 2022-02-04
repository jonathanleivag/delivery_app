// To parse this JSON data, do
//
//     final productResponseModel = productResponseModelFromMap(jsonString);

import 'dart:convert';

class ProductResponseModel {
  ProductResponseModel({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  DataProduct? data;
  String? token;

  factory ProductResponseModel.fromJson(String str) =>
      ProductResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductResponseModel(
        message: json["message"],
        success: json["success"],
        data: DataProduct.fromMap(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data!.toMap(),
        "token": token,
      };
}

class ProductByCategoryResponseModel {
  ProductByCategoryResponseModel({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  List<DataProduct>? data;
  dynamic token;

  factory ProductByCategoryResponseModel.fromJson(String str) =>
      ProductByCategoryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductByCategoryResponseModel.fromMap(Map<String, dynamic> json) =>
      ProductByCategoryResponseModel(
        message: json["message"],
        success: json["success"],
        data: List<DataProduct>.from(
            json["data"].map((x) => DataProduct.fromMap(x))),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": List<DataProduct>.from(data!.map((x) => x.toMap())),
        "token": token,
      };
}

class DataProduct {
  DataProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image1,
    this.image2,
    this.image3,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String name;
  String description;
  int price;
  String image1;
  String? image2;
  String? image3;
  CategoryProducto category;
  DateTime createdAt;
  DateTime updatedAt;

  factory DataProduct.fromJson(String str) =>
      DataProduct.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataProduct.fromMap(Map<String, dynamic> json) => DataProduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        category:  CategoryProducto.fromMap(json["category"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "category": category.toMap(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class CategoryProducto {
  CategoryProducto({
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

  factory CategoryProducto.fromJson(String str) =>
      CategoryProducto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryProducto.fromMap(Map<String, dynamic> json) =>
      CategoryProducto(
        id: json["_id"],
        category: json["category"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "category": category,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
