// To parse this JSON data, do
//
//     final localUserShoppResponse = localUserShoppResponseFromMap(jsonString);

import 'dart:convert';

class LocalUserShoppResponse {
  LocalUserShoppResponse({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  DataUserShopp? data;
  String? token;

  factory LocalUserShoppResponse.fromJson(String str) =>
      LocalUserShoppResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LocalUserShoppResponse.fromMap(Map<String, dynamic> json) =>
      LocalUserShoppResponse(
        message: json["message"],
        success: json["success"],
        data:json["data"] != null ? DataUserShopp.fromMap(json["data"]): null,
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data?.toMap(),
        "token": token,
      };
}

class DataUserShopp {
  DataUserShopp({
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
  String product;
  UserLocalShopp user;
  DateTime createdAt;
  DateTime updatedAt;
  AddressUserShopp address;
  int norder;
  String purchaseId;

  factory DataUserShopp.fromJson(String str) =>
      DataUserShopp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataUserShopp.fromMap(Map<String, dynamic> json) => DataUserShopp(
        id: json["id"],
        state: json["state"],
        count: json["count"],
        total: json["total"],
        product: json["product"],
        user: UserLocalShopp.fromMap(json["user"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        address: AddressUserShopp.fromMap(json["address"]),
        norder: json["norder"],
        purchaseId: json["purchaseId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "state": state,
        "count": count,
        "total": total,
        "product": product,
        "user": user.toMap(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "address": address.toMap(),
        "norder": norder,
        "purchaseId": purchaseId,
      };
}

class AddressUserShopp {
  AddressUserShopp({
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

  factory AddressUserShopp.fromJson(String str) =>
      AddressUserShopp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddressUserShopp.fromMap(Map<String, dynamic> json) =>
      AddressUserShopp(
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

class UserLocalShopp {
  UserLocalShopp({
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

  factory UserLocalShopp.fromJson(String str) =>
      UserLocalShopp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserLocalShopp.fromMap(Map<String, dynamic> json) => UserLocalShopp(
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
