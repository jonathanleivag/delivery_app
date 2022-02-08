// To parse this JSON data, do
//
//     final cardTokensResponseModel = cardTokensResponseModelFromMap(jsonString);

import 'dart:convert';

class CardTokensResponseModel {
  CardTokensResponseModel({
    this.id,
    this.publicKey,
    this.firstSixDigits,
    this.expirationMonth,
    this.expirationYear,
    this.lastFourDigits,
    this.cardholder,
    this.status,
    this.dateCreated,
    this.dateLastUpdated,
    this.dateDue,
    this.luhnValidation,
    this.liveMode,
    this.requireEsc,
    this.cardNumberLength,
    this.securityCodeLength,
  });

  String? id;
  String? publicKey;
  String? firstSixDigits;
  int? expirationMonth;
  int? expirationYear;
  String? lastFourDigits;
  Cardholder? cardholder;
  String? status;
  DateTime? dateCreated;
  DateTime? dateLastUpdated;
  DateTime? dateDue;
  bool? luhnValidation;
  bool? liveMode;
  bool? requireEsc;
  int? cardNumberLength;
  int? securityCodeLength;

  factory CardTokensResponseModel.fromJson(String str) =>
      CardTokensResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardTokensResponseModel.fromMap(Map<String, dynamic> json) =>
      CardTokensResponseModel(
        id: json["id"],
        publicKey: json["public_key"],
        firstSixDigits: json["first_six_digits"],
        expirationMonth: json["expiration_month"],
        expirationYear: json["expiration_year"],
        lastFourDigits: json["last_four_digits"],
        cardholder: Cardholder.fromMap(json["cardholder"]),
        status: json["status"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        dateDue: DateTime.parse(json["date_due"]),
        luhnValidation: json["luhn_validation"],
        liveMode: json["live_mode"],
        requireEsc: json["require_esc"],
        cardNumberLength: json["card_number_length"],
        securityCodeLength: json["security_code_length"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "public_key": publicKey,
        "first_six_digits": firstSixDigits,
        "expiration_month": expirationMonth,
        "expiration_year": expirationYear,
        "last_four_digits": lastFourDigits,
        "cardholder": cardholder?.toMap(),
        "status": status,
        "date_created": dateCreated?.toIso8601String(),
        "date_last_updated": dateLastUpdated?.toIso8601String(),
        "date_due": dateDue?.toIso8601String(),
        "luhn_validation": luhnValidation,
        "live_mode": liveMode,
        "require_esc": requireEsc,
        "card_number_length": cardNumberLength,
        "security_code_length": securityCodeLength,
      };
}

class Cardholder {
  Cardholder({
    this.identification,
    this.name,
  });

  Identification? identification;
  String? name;

  factory Cardholder.fromJson(String str) =>
      Cardholder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cardholder.fromMap(Map<String, dynamic> json) => Cardholder(
        identification: Identification.fromMap(json["identification"]),
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "identification": identification?.toMap(),
        "name": name,
      };
}

class Identification {
  Identification();

  factory Identification.fromJson(String str) =>
      Identification.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Identification.fromMap(Map<String, dynamic> json) => Identification();

  Map<String, dynamic> toMap() => {};
}
