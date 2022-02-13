// To parse this JSON data, do
//
//     final shoppResponseModel = shoppResponseModelFromMap(jsonString);

import 'dart:convert';

class ShoppResponseModel {
  ShoppResponseModel({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  DataProductShopp? data;
  String? token;

  factory ShoppResponseModel.fromJson(String str) =>
      ShoppResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShoppResponseModel.fromMap(Map<String, dynamic> json) =>
      ShoppResponseModel(
        message: json["message"],
        success: json["success"],
        data: json["data"] != null
            ? DataProductShopp.fromMap(json["data"])
            : null,
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data?.toMap(),
        "token": token,
      };
}

class ShoppAllResponseModel {
  ShoppAllResponseModel({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  List<DataProductShopp>? data;
  String? token;

  factory ShoppAllResponseModel.fromJson(String str) =>
      ShoppAllResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShoppAllResponseModel.fromMap(Map<String, dynamic> json) =>
      ShoppAllResponseModel(
        message: json["message"],
        success: json["success"],
        data: List<DataProductShopp>.from(
            json["data"].map((x) => DataProductShopp.fromMap(x))),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": List<DataProductShopp>.from(data!.map((x) => x.toMap())),
        "token": token,
      };
}

class DataProductShopp {
  DataProductShopp({
    required this.id,
    required this.state,
    required this.count,
    required this.total,
    required this.product,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String state;
  int count;
  int total;
  ProductShopp product;
  UserShopp user;
  DateTime createdAt;
  DateTime updatedAt;

  factory DataProductShopp.fromJson(String str) =>
      DataProductShopp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataProductShopp.fromMap(Map<String, dynamic> json) =>
      DataProductShopp(
        id: json["id"],
        state: json["state"],
        count: json["count"],
        total: json["total"],
        product: ProductShopp.fromMap(json["product"]),
        user: UserShopp.fromMap(json["user"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "state": state,
        "count": count,
        "total": total,
        "product": product.toMap(),
        "user": user.toMap(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class ProductShopp {
  ProductShopp({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String name;
  String description;
  int price;
  String image1;
  dynamic image2;
  dynamic image3;
  CategoryShopp category;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductShopp.fromJson(String str) =>
      ProductShopp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductShopp.fromMap(Map<String, dynamic> json) => ProductShopp(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        category: CategoryShopp.fromMap(json["category"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
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

class CategoryShopp {
  CategoryShopp({
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

  factory CategoryShopp.fromJson(String str) =>
      CategoryShopp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryShopp.fromMap(Map<String, dynamic> json) => CategoryShopp(
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

class UserShopp {
  UserShopp({
    required this.id,
    required this.email,
    required this.name,
    required this.lastName,
    required this.phone,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String email;
  String name;
  String lastName;
  String phone;
  String? image;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserShopp.fromJson(String str) => UserShopp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserShopp.fromMap(Map<String, dynamic> json) => UserShopp(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        lastName: json["lastName"],
        phone: json["phone"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "email": email,
        "name": name,
        "lastName": lastName,
        "phone": phone,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
