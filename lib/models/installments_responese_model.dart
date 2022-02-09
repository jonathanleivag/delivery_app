// To parse this JSON data, do
//
//     final installmentsResponeseModel = installmentsResponeseModelFromMap(jsonString);

import 'dart:convert';

class InstallmentsResponeseModel {
  InstallmentsResponeseModel({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  DataInstallments? data;
  String? token;

  factory InstallmentsResponeseModel.fromJson(String str) =>
      InstallmentsResponeseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InstallmentsResponeseModel.fromMap(Map<String, dynamic> json) =>
      InstallmentsResponeseModel(
        message: json["message"],
        success: json["success"],
        data: json["data"] != null ? DataInstallments.fromMap(json["data"]): null,
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data?.toMap(),
        "token": token,
      };
}

class DataInstallments {
  DataInstallments({
    this.paymentMethodId,
    this.paymentTypeId,
    this.issuer,
    this.processingMode,
    this.merchantAccountId,
    this.payerCosts,
    this.agreements,
  });

  String? paymentMethodId;
  String? paymentTypeId;
  Issuer? issuer;
  String? processingMode;
  dynamic merchantAccountId;
  List<PayerCost>? payerCosts;
  dynamic agreements;

  factory DataInstallments.fromJson(String str) =>
      DataInstallments.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataInstallments.fromMap(Map<String, dynamic> json) =>
      DataInstallments(
        paymentMethodId: json["payment_method_id"],
        paymentTypeId: json["payment_type_id"],
        issuer: Issuer.fromMap(json["issuer"]),
        processingMode: json["processing_mode"],
        merchantAccountId: json["merchant_account_id"],
        payerCosts: List<PayerCost>.from(
            json["payer_costs"].map((x) => PayerCost.fromMap(x))),
        agreements: json["agreements"],
      );

  Map<String, dynamic> toMap() => {
        "payment_method_id": paymentMethodId,
        "payment_type_id": paymentTypeId,
        "issuer": issuer?.toMap(),
        "processing_mode": processingMode,
        "merchant_account_id": merchantAccountId,
        "payer_costs": payerCosts != null
            ? List<dynamic>.from(payerCosts!.map((x) => x.toMap()))
            : null,
        "agreements": agreements,
      };
}

class Issuer {
  Issuer({
    this.id,
    this.name,
    this.secureThumbnail,
    this.thumbnail,
  });

  String? id;
  String? name;
  String? secureThumbnail;
  String? thumbnail;

  factory Issuer.fromJson(String str) => Issuer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Issuer.fromMap(Map<String, dynamic> json) => Issuer(
        id: json["id"],
        name: json["name"],
        secureThumbnail: json["secure_thumbnail"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "secure_thumbnail": secureThumbnail,
        "thumbnail": thumbnail,
      };
}

class PayerCost {
  PayerCost({
    this.installments,
    this.installmentRate,
    this.discountRate,
    this.reimbursementRate,
    this.labels,
    this.installmentRateCollector,
    this.minAllowedAmount,
    this.maxAllowedAmount,
    this.recommendedMessage,
    this.installmentAmount,
    this.totalAmount,
    this.paymentMethodOptionId,
  });

  int? installments;
  int? installmentRate;
  int? discountRate;
  dynamic reimbursementRate;
  List<String>? labels;
  List<String>? installmentRateCollector;
  int? minAllowedAmount;
  int? maxAllowedAmount;
  String? recommendedMessage;
  double? installmentAmount;
  int? totalAmount;
  String? paymentMethodOptionId;

  factory PayerCost.fromJson(String str) => PayerCost.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PayerCost.fromMap(Map<String, dynamic> json) => PayerCost(
        installments: json["installments"],
        installmentRate: json["installment_rate"],
        discountRate: json["discount_rate"],
        reimbursementRate: json["reimbursement_rate"],
        labels: List<String>.from(json["labels"].map((x) => x)),
        installmentRateCollector:
            List<String>.from(json["installment_rate_collector"].map((x) => x)),
        minAllowedAmount: json["min_allowed_amount"],
        maxAllowedAmount: json["max_allowed_amount"],
        recommendedMessage: json["recommended_message"],
        installmentAmount: json["installment_amount"].toDouble(),
        totalAmount: json["total_amount"],
        paymentMethodOptionId: json["payment_method_option_id"],
      );

  Map<String, dynamic> toMap() => {
        "installments": installments,
        "installment_rate": installmentRate,
        "discount_rate": discountRate,
        "reimbursement_rate": reimbursementRate,
        "labels":
            labels != null ? List<dynamic>.from(labels!.map((x) => x)) : null,
        "installment_rate_collector": installmentRateCollector != null
            ? List<dynamic>.from(installmentRateCollector!.map((x) => x))
            : null,
        "min_allowed_amount": minAllowedAmount,
        "max_allowed_amount": maxAllowedAmount,
        "recommended_message": recommendedMessage,
        "installment_amount": installmentAmount,
        "total_amount": totalAmount,
        "payment_method_option_id": paymentMethodOptionId,
      };
}
