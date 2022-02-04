// To parse this JSON data, do
//
//     final addressResponseModel = addressResponseModelFromMap(jsonString);

import 'dart:convert';

class AddressResponseModel {
  AddressResponseModel({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  DataAddress? data;
  String? token;

  factory AddressResponseModel.fromJson(String str) =>
      AddressResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddressResponseModel.fromMap(Map<String, dynamic> json) =>
      AddressResponseModel(
        message: json["message"],
        success: json["success"],
        data: json["data"] != null ? DataAddress.fromMap(json["data"]): null,
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data?.toMap(),
        "token": token,
      };
}

class AddressGetResponseModel {
  AddressGetResponseModel({
    this.message,
    required this.success,
    required this.data,
    this.token,
  });

  String? message;
  bool success;
  List<DataAddress> data;
  String? token;

  factory AddressGetResponseModel.fromJson(String str) =>
      AddressGetResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddressGetResponseModel.fromMap(Map<String, dynamic> json) =>
      AddressGetResponseModel(
        message: json["message"],
        success: json["success"],
        data: List<DataAddress>.from(
            json["data"].map((x) => DataAddress.fromMap(x))),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "token": token,
      };
}

class DataAddress {
  DataAddress({
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
  UserAddress user;
  DateTime createdAt;
  DateTime updatedAt;

  factory DataAddress.fromJson(String str) =>
      DataAddress.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataAddress.fromMap(Map<String, dynamic> json) => DataAddress(
        id: json["id"],
        address: json["address"],
        street: json["street"],
        city: json["city"],
        country: json["country"],
        department: json["department"],
        direction: json["direction"],
        directionForm: json["directionForm"],
        barrioForm: json["barrioForm"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        user: UserAddress.fromMap(json["user"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
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
        "user": user.toMap(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class UserAddress {
  UserAddress({
    required this.id,
    required this.email,
    required this.name,
    required this.lastName,
    required this.phone,
    required this.image,
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

  factory UserAddress.fromJson(String str) =>
      UserAddress.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAddress.fromMap(Map<String, dynamic> json) => UserAddress(
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
