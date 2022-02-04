// To parse this JSON data, do
//
//     final userCreateResponseModel = userCreateResponseModelFromMap(jsonString);

import 'dart:convert';

class UserCreateResponseModel {
  UserCreateResponseModel(
      {this.message, required this.success, this.data, this.token});

  String? message;
  bool success;
  Data? data;
  String? token;

  factory UserCreateResponseModel.fromJson(String str) =>
      UserCreateResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCreateResponseModel.fromMap(Map<String, dynamic> json) =>
      UserCreateResponseModel(
        message: json["message"],
        success: json["success"],
        data: json["data"] != null ? Data.fromMap(json["data"]) : null,
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data?.toMap(),
        "token": token,
      };
}

class UserAllResponseModel {
  UserAllResponseModel(
      {this.message, required this.success, this.data, this.token});

  String? message;
  bool success;
  List<Data>? data;
  String? token;

  factory UserAllResponseModel.fromJson(String str) =>
      UserAllResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAllResponseModel.fromMap(Map<String, dynamic> json) =>
      UserAllResponseModel(
        message: json["message"],
        success: json["success"],
        data: List<Data>.from(json["data"].map((x) => Data.fromMap(x))),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": List<Data>.from(data!.map((x) => x.toMap())),
        "token": token,
      };
}

class Data {
  Data({
    required this.email,
    required this.name,
    required this.lastName,
    required this.phone,
    required this.id,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  String email;
  String name;
  String lastName;
  String phone;
  String id;
  String? image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        email: json["email"],
        name: json["name"],
        lastName: json["lastName"],
        phone: json["phone"],
        id: json["id"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "name": name,
        "lastName": lastName,
        "phone": phone,
        "id": id,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

// To parse this JSON data, do
//
//     final tokenResponseModel = tokenResponseModelFromMap(jsonString);

class TokenResponseModel {
    TokenResponseModel({
        this.message,
       required this.success,
        this.data,
        this.token,
    });

    String? message;
    bool success;
    DataToken? data;
    dynamic token;

    factory TokenResponseModel.fromJson(String str) => TokenResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TokenResponseModel.fromMap(Map<String, dynamic> json) => TokenResponseModel(
        message: json["message"],
        success: json["success"],
        data: DataToken.fromMap(json["data"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data!.toMap(),
        "token": token,
    };
}

class DataToken {
    DataToken({
       required this.id,
       required this.email,
       required this.name,
       required this.lastName,
        this.iat,
        this.exp,
    });

    String id;
    String email;
    String name;
    String lastName;
    int? iat;
    int? exp;

    factory DataToken.fromJson(String str) => DataToken.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DataToken.fromMap(Map<String, dynamic> json) => DataToken(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        lastName: json["lastName"],
        iat: json["iat"],
        exp: json["exp"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "name": name,
        "lastName": lastName,
        "iat": iat,
        "exp": exp,
    };
}
