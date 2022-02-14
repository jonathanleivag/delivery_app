// To parse this JSON data, do
//
//     final localProductByPurchaseIdResponse = localProductByPurchaseIdResponseFromMap(jsonString);

import 'dart:convert';

class LocalProductByPurchaseIdResponse {
  LocalProductByPurchaseIdResponse({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  List<DataProductByPurchaseId>? data;
  dynamic token;

  factory LocalProductByPurchaseIdResponse.fromJson(String str) =>
      LocalProductByPurchaseIdResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalProductByPurchaseIdResponse.fromMap(Map<String, dynamic> json) =>
      LocalProductByPurchaseIdResponse(
        message: json["message"],
        success: json["success"],
        data: List<DataProductByPurchaseId>.from(json["data"].map((x) => DataProductByPurchaseId.fromMap(x))),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toMap()))
            : null,
        "token": token,
      };
}

class DataProductByPurchaseId {
  DataProductByPurchaseId({
    required this.id,
    required this.state,
    required this.count,
    required this.total,
    required this.product,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
    required this.norder,
    required this.purchaseId,
  });

  String id;
  String state;
  int count;
  int total;
  ProductByPurchaseId product;
  UserProductByPurchaseId user;
  DateTime createdAt;
  DateTime updatedAt;
  AddressProductByPurchaseId address;
  int norder;
  String purchaseId;

  factory DataProductByPurchaseId.fromJson(String str) => DataProductByPurchaseId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataProductByPurchaseId.fromMap(Map<String, dynamic> json) => DataProductByPurchaseId(
        id: json["id"],
        state: json["state"],
        count: json["count"],
        total: json["total"],
        product: ProductByPurchaseId.fromMap(json["product"]),
        user: UserProductByPurchaseId.fromMap(json["user"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        address: AddressProductByPurchaseId.fromMap(json["address"]),
        norder: json["norder"],
        purchaseId: json["purchaseId"],
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
        "address": address.toMap(),
        "norder": norder,
        "purchaseId": purchaseId,
      };
}

class AddressProductByPurchaseId {
  AddressProductByPurchaseId({
    required this.id,
    this.address,
    this.street,
    this.city,
    this.country,
    this.department,
    this.direction,
    required this.directionForm,
    required this.barrioForm,
    required this.latitude,
    required this.longitude,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String? address;
  String? street;
  String? city;
  String? country;
  String? department;
  String? direction;
  String directionForm;
  String barrioForm;
  double latitude;
  double longitude;
  String user;
  DateTime createdAt;
  DateTime updatedAt;

  factory AddressProductByPurchaseId.fromJson(String str) => AddressProductByPurchaseId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddressProductByPurchaseId.fromMap(Map<String, dynamic> json) => AddressProductByPurchaseId(
        id: json["_id"],
        address: json["address"],
        street: json["street"],
        city: json["city"],
        country: json["country"],
        department: json["department"],
        direction: json["direction"],
        directionForm: json["directionForm"],
        barrioForm: json["barrioForm"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        user: json["user"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "address": address,
        "street": street,
        "city": city,
        "country": country,
        "department": department,
        "direction": direction,
        "directionForm": directionForm,
        "barrioForm": barrioForm,
        "latitude": latitude,
        "longitude": longitude,
        "user": user,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class ProductByPurchaseId {
  ProductByPurchaseId({
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
  String category;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductByPurchaseId.fromJson(String str) => ProductByPurchaseId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductByPurchaseId.fromMap(Map<String, dynamic> json) => ProductByPurchaseId(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        category: json["category"],
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
        "category": category,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class UserProductByPurchaseId {
  UserProductByPurchaseId({
    required this.id,
    required this.email,
    required this.name,
    this.lastName,
    required this.phone,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String email;
  String name;
  String? lastName;
  String phone;
  String? image;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserProductByPurchaseId.fromJson(String str) => UserProductByPurchaseId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserProductByPurchaseId.fromMap(Map<String, dynamic> json) => UserProductByPurchaseId(
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
