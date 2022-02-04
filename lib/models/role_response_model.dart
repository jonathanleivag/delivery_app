// To parse this JSON data, do
//
//     final roleResponseModel = roleResponseModelFromMap(jsonString);

import 'dart:convert';

class RoleResponseModel {
  RoleResponseModel({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  List<DataRole>? data;
  String? token;

  factory RoleResponseModel.fromJson(String str) =>
      RoleResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RoleResponseModel.fromMap(Map<String, dynamic> json) =>
      RoleResponseModel(
        message: json["message"],
        success: json["success"],
        data: json["data"] != null ? List<DataRole>.from(json["data"].map((x) => DataRole.fromMap(x))): null,
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data != null ? List<DataRole>.from(data!.map((x) => x.toMap())): null,
        "token": token,
      };
}

class DataRole {
  DataRole({
    required this.id,
    required this.user,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  User user;
  Role role;
  DateTime createdAt;
  DateTime updatedAt;

  factory DataRole.fromJson(String str) => DataRole.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataRole.fromMap(Map<String, dynamic> json) => DataRole(
        id: json["id"],
        user: User.fromMap(json["user"]),
        role: Role.fromMap(json["role"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user": user.toMap(),
        "role": role.toMap(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class Role {
  Role({
    required this.id,
    required this.name,
    this.image,
    this.route,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String name;
  String? image;
  String? route;
  DateTime createdAt;
  DateTime updatedAt;

  factory Role.fromJson(String str) => Role.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Role.fromMap(Map<String, dynamic> json) => Role(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        route: json["route"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "image": image,
        "route": route,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class User {
  User({
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

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
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
