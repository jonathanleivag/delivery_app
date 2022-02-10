// To parse this JSON data, do
//
//     final paymentCreditCard = paymentCreditCardFromMap(jsonString);

import 'dart:convert';

class PaymentCreditCard {
  PaymentCreditCard({
    this.message,
    required this.success,
    this.data,
    this.token,
  });

  String? message;
  bool success;
  DataPaymentCreditCard? data;
  String? token;

  factory PaymentCreditCard.fromJson(String str) =>
      PaymentCreditCard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentCreditCard.fromMap(Map<String, dynamic> json) =>
      PaymentCreditCard(
        message: json["message"],
        success: json["success"],
        data: DataPaymentCreditCard.fromMap(json["data"]),
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "success": success,
        "data": data?.toMap(),
        "token": token,
      };
}

class DataPaymentCreditCard {
  DataPaymentCreditCard({
    this.body,
    this.response,
    this.status,
    this.idempotency,
  });

  Body? body;
  Body? response;
  int? status;
  String? idempotency;

  factory DataPaymentCreditCard.fromJson(String str) =>
      DataPaymentCreditCard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataPaymentCreditCard.fromMap(Map<String, dynamic> json) =>
      DataPaymentCreditCard(
        body: Body.fromMap(json["body"]),
        response: Body.fromMap(json["response"]),
        status: json["status"],
        idempotency: json["idempotency"],
      );

  Map<String, dynamic> toMap() => {
        "body": body?.toMap(),
        "response": response?.toMap(),
        "status": status,
        "idempotency": idempotency,
      };
}

class Body {
  Body({
    this.id,
    this.dateCreated,
    this.dateApproved,
    this.dateLastUpdated,
    this.dateOfExpiration,
    this.moneyReleaseDate,
    this.operationType,
    this.issuerId,
    this.paymentMethodId,
    this.paymentTypeId,
    this.status,
    this.statusDetail,
    this.currencyId,
    this.description,
    this.liveMode,
    this.sponsorId,
    this.authorizationCode,
    this.moneyReleaseSchema,
    this.taxesAmount,
    this.counterCurrency,
    this.brandId,
    this.shippingAmount,
    this.posId,
    this.storeId,
    this.integratorId,
    this.platformId,
    this.corporationId,
    this.collectorId,
    this.payer,
    this.marketplaceOwner,
    this.metadata,
    this.additionalInfo,
    this.order,
    this.externalReference,
    this.transactionAmount,
    this.transactionAmountRefunded,
    this.couponAmount,
    this.differentialPricingId,
    this.deductionSchema,
    this.installments,
    this.transactionDetails,
    this.feeDetails,
    this.chargesDetails,
    this.captured,
    this.binaryMode,
    this.callForAuthorizeId,
    this.statementDescriptor,
    this.card,
    this.notificationUrl,
    this.refunds,
    this.processingMode,
    this.merchantAccountId,
    this.merchantNumber,
    this.pointOfInteraction,
  });

  int? id;
  DateTime? dateCreated;
  DateTime? dateApproved;
  DateTime? dateLastUpdated;
  dynamic dateOfExpiration;
  DateTime? moneyReleaseDate;
  String? operationType;
  String? issuerId;
  String? paymentMethodId;
  String? paymentTypeId;
  String? status;
  String? statusDetail;
  String? currencyId;
  dynamic description;
  bool? liveMode;
  dynamic sponsorId;
  dynamic authorizationCode;
  dynamic moneyReleaseSchema;
  int? taxesAmount;
  dynamic counterCurrency;
  dynamic brandId;
  int? shippingAmount;
  dynamic posId;
  dynamic storeId;
  dynamic integratorId;
  dynamic platformId;
  dynamic corporationId;
  int? collectorId;
  Payer? payer;
  dynamic marketplaceOwner;
  Metadata? metadata;
  AdditionalInfo? additionalInfo;
  Metadata? order;
  dynamic externalReference;
  int? transactionAmount;
  int? transactionAmountRefunded;
  int? couponAmount;
  dynamic differentialPricingId;
  dynamic deductionSchema;
  int? installments;
  TransactionDetails? transactionDetails;
  List<FeeDetail>? feeDetails;
  List<dynamic>? chargesDetails;
  bool? captured;
  bool? binaryMode;
  dynamic callForAuthorizeId;
  String? statementDescriptor;
  CardPayment? card;
  dynamic notificationUrl;
  List<dynamic>? refunds;
  String? processingMode;
  dynamic merchantAccountId;
  dynamic merchantNumber;
  PointOfInteraction? pointOfInteraction;

  factory Body.fromJson(String str) => Body.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Body.fromMap(Map<String, dynamic> json) => Body(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateApproved: DateTime.parse(json["date_approved"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        dateOfExpiration: json["date_of_expiration"],
        moneyReleaseDate: DateTime.parse(json["money_release_date"]),
        operationType: json["operation_type"],
        issuerId: json["issuer_id"],
        paymentMethodId: json["payment_method_id"],
        paymentTypeId: json["payment_type_id"],
        status: json["status"],
        statusDetail: json["status_detail"],
        currencyId: json["currency_id"],
        description: json["description"],
        liveMode: json["live_mode"],
        sponsorId: json["sponsor_id"],
        authorizationCode: json["authorization_code"],
        moneyReleaseSchema: json["money_release_schema"],
        taxesAmount: json["taxes_amount"],
        counterCurrency: json["counter_currency"],
        brandId: json["brand_id"],
        shippingAmount: json["shipping_amount"],
        posId: json["pos_id"],
        storeId: json["store_id"],
        integratorId: json["integrator_id"],
        platformId: json["platform_id"],
        corporationId: json["corporation_id"],
        collectorId: json["collector_id"],
        payer: Payer.fromMap(json["payer"]),
        marketplaceOwner: json["marketplace_owner"],
        metadata: Metadata.fromMap(json["metadata"]),
        additionalInfo: AdditionalInfo.fromMap(json["additional_info"]),
        order: Metadata.fromMap(json["order"]),
        externalReference: json["external_reference"],
        transactionAmount: json["transaction_amount"],
        transactionAmountRefunded: json["transaction_amount_refunded"],
        couponAmount: json["coupon_amount"],
        differentialPricingId: json["differential_pricing_id"],
        deductionSchema: json["deduction_schema"],
        installments: json["installments"],
        transactionDetails:
            TransactionDetails.fromMap(json["transaction_details"]),
        feeDetails: List<FeeDetail>.from(
            json["fee_details"].map((x) => FeeDetail.fromMap(x))),
        chargesDetails:
            List<dynamic>.from(json["charges_details"].map((x) => x)),
        captured: json["captured"],
        binaryMode: json["binary_mode"],
        callForAuthorizeId: json["call_for_authorize_id"],
        statementDescriptor: json["statement_descriptor"],
        card: CardPayment.fromMap(json["card"]),
        notificationUrl: json["notification_url"],
        refunds: List<dynamic>.from(json["refunds"].map((x) => x)),
        processingMode: json["processing_mode"],
        merchantAccountId: json["merchant_account_id"],
        merchantNumber: json["merchant_number"],
        pointOfInteraction:
            PointOfInteraction.fromMap(json["point_of_interaction"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "date_created": dateCreated?.toIso8601String(),
        "date_approved": dateApproved?.toIso8601String(),
        "date_last_updated": dateLastUpdated?.toIso8601String(),
        "date_of_expiration": dateOfExpiration,
        "money_release_date": moneyReleaseDate?.toIso8601String(),
        "operation_type": operationType,
        "issuer_id": issuerId,
        "payment_method_id": paymentMethodId,
        "payment_type_id": paymentTypeId,
        "status": status,
        "status_detail": statusDetail,
        "currency_id": currencyId,
        "description": description,
        "live_mode": liveMode,
        "sponsor_id": sponsorId,
        "authorization_code": authorizationCode,
        "money_release_schema": moneyReleaseSchema,
        "taxes_amount": taxesAmount,
        "counter_currency": counterCurrency,
        "brand_id": brandId,
        "shipping_amount": shippingAmount,
        "pos_id": posId,
        "store_id": storeId,
        "integrator_id": integratorId,
        "platform_id": platformId,
        "corporation_id": corporationId,
        "collector_id": collectorId,
        "payer": payer?.toMap(),
        "marketplace_owner": marketplaceOwner,
        "metadata": metadata?.toMap(),
        "additional_info": additionalInfo?.toMap(),
        "order": order?.toMap(),
        "external_reference": externalReference,
        "transaction_amount": transactionAmount,
        "transaction_amount_refunded": transactionAmountRefunded,
        "coupon_amount": couponAmount,
        "differential_pricing_id": differentialPricingId,
        "deduction_schema": deductionSchema,
        "installments": installments,
        "transaction_details": transactionDetails?.toMap(),
        "fee_details": feeDetails != null
            ? List<dynamic>.from(feeDetails!.map((x) => x.toMap()))
            : null,
        "charges_details": chargesDetails != null
            ? List<dynamic>.from(chargesDetails!.map((x) => x))
            : null,
        "captured": captured,
        "binary_mode": binaryMode,
        "call_for_authorize_id": callForAuthorizeId,
        "statement_descriptor": statementDescriptor,
        "card": card?.toMap(),
        "notification_url": notificationUrl,
        "refunds":
            refunds != null ? List<dynamic>.from(refunds!.map((x) => x)) : null,
        "processing_mode": processingMode,
        "merchant_account_id": merchantAccountId,
        "merchant_number": merchantNumber,
        "point_of_interaction": pointOfInteraction!.toMap(),
      };
}

class AdditionalInfo {
  AdditionalInfo({
    this.availableBalance,
    this.nsuProcessadora,
    this.authenticationCode,
  });

  dynamic availableBalance;
  dynamic nsuProcessadora;
  dynamic authenticationCode;

  factory AdditionalInfo.fromJson(String str) =>
      AdditionalInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdditionalInfo.fromMap(Map<String, dynamic> json) => AdditionalInfo(
        availableBalance: json["available_balance"],
        nsuProcessadora: json["nsu_processadora"],
        authenticationCode: json["authentication_code"],
      );

  Map<String, dynamic> toMap() => {
        "available_balance": availableBalance,
        "nsu_processadora": nsuProcessadora,
        "authentication_code": authenticationCode,
      };
}

class CardPayment {
  CardPayment({
    this.id,
    this.firstSixDigits,
    this.lastFourDigits,
    this.expirationMonth,
    this.expirationYear,
    this.dateCreated,
    this.dateLastUpdated,
    this.cardholder,
  });

  dynamic id;
  String? firstSixDigits;
  String? lastFourDigits;
  int? expirationMonth;
  int? expirationYear;
  DateTime? dateCreated;
  DateTime? dateLastUpdated;
  CardholderPayment? cardholder;

  factory CardPayment.fromJson(String str) => CardPayment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardPayment.fromMap(Map<String, dynamic> json) => CardPayment(
        id: json["id"],
        firstSixDigits: json["first_six_digits"],
        lastFourDigits: json["last_four_digits"],
        expirationMonth: json["expiration_month"],
        expirationYear: json["expiration_year"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateLastUpdated: DateTime.parse(json["date_last_updated"]),
        cardholder: CardholderPayment.fromMap(json["cardholder"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_six_digits": firstSixDigits,
        "last_four_digits": lastFourDigits,
        "expiration_month": expirationMonth,
        "expiration_year": expirationYear,
        "date_created": dateCreated?.toIso8601String(),
        "date_last_updated": dateLastUpdated?.toIso8601String(),
        "cardholder": cardholder?.toMap(),
      };
}

class CardholderPayment {
  CardholderPayment({
    this.name,
    this.identification,
  });

  String? name;
  IdentificationPayment? identification;

  factory CardholderPayment.fromJson(String str) =>
      CardholderPayment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CardholderPayment.fromMap(Map<String, dynamic> json) => CardholderPayment(
        name: json["name"],
        identification: IdentificationPayment.fromMap(json["identification"]),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "identification": identification?.toMap(),
      };
}

class IdentificationPayment {
  IdentificationPayment({
    this.number,
    this.type,
  });

  String? number;
  String? type;

  factory IdentificationPayment.fromJson(String str) =>
      IdentificationPayment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IdentificationPayment.fromMap(Map<String, dynamic> json) => IdentificationPayment(
        number: json["number"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "number": number,
        "type": type,
      };
}

class FeeDetail {
  FeeDetail({
    this.type,
    this.amount,
    this.feePayer,
  });

  String? type;
  int? amount;
  String? feePayer;

  factory FeeDetail.fromJson(String str) => FeeDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeeDetail.fromMap(Map<String, dynamic> json) => FeeDetail(
        type: json["type"],
        amount: json["amount"],
        feePayer: json["fee_payer"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "amount": amount,
        "fee_payer": feePayer,
      };
}

class Metadata {
  Metadata();

  factory Metadata.fromJson(String str) => Metadata.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Metadata.fromMap(Map<String, dynamic> json) => Metadata();

  Map<String, dynamic> toMap() => {};
}

class Payer {
  Payer({
    this.firstName,
    this.lastName,
    this.email,
    this.identification,
    this.phone,
    this.type,
    this.entityType,
    this.id,
  });

  dynamic firstName;
  dynamic lastName;
  String? email;
  IdentificationPayment? identification;
  Phone? phone;
  dynamic type;
  dynamic entityType;
  String? id;

  factory Payer.fromJson(String str) => Payer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Payer.fromMap(Map<String, dynamic> json) => Payer(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        identification: IdentificationPayment.fromMap(json["identification"]),
        phone: Phone.fromMap(json["phone"]),
        type: json["type"],
        entityType: json["entity_type"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "identification": identification?.toMap(),
        "phone": phone?.toMap(),
        "type": type,
        "entity_type": entityType,
        "id": id,
      };
}

class Phone {
  Phone({
    this.areaCode,
    this.number,
    this.extension,
  });

  dynamic areaCode;
  dynamic number;
  dynamic extension;

  factory Phone.fromJson(String str) => Phone.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Phone.fromMap(Map<String, dynamic> json) => Phone(
        areaCode: json["area_code"],
        number: json["number"],
        extension: json["extension"],
      );

  Map<String, dynamic> toMap() => {
        "area_code": areaCode,
        "number": number,
        "extension": extension,
      };
}

class PointOfInteraction {
  PointOfInteraction({
    this.type,
    this.businessInfo,
  });

  String? type;
  BusinessInfo? businessInfo;

  factory PointOfInteraction.fromJson(String str) =>
      PointOfInteraction.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PointOfInteraction.fromMap(Map<String, dynamic> json) =>
      PointOfInteraction(
        type: json["type"],
        businessInfo: BusinessInfo.fromMap(json["business_info"]),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "business_info": businessInfo?.toMap(),
      };
}

class BusinessInfo {
  BusinessInfo({
    this.unit,
    this.subUnit,
  });

  String? unit;
  String? subUnit;

  factory BusinessInfo.fromJson(String str) =>
      BusinessInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BusinessInfo.fromMap(Map<String, dynamic> json) => BusinessInfo(
        unit: json["unit"],
        subUnit: json["sub_unit"],
      );

  Map<String, dynamic> toMap() => {
        "unit": unit,
        "sub_unit": subUnit,
      };
}

class TransactionDetails {
  TransactionDetails({
    this.paymentMethodReferenceId,
    this.netReceivedAmount,
    this.totalPaidAmount,
    this.overpaidAmount,
    this.externalResourceUrl,
    this.installmentAmount,
    this.financialInstitution,
    this.payableDeferralPeriod,
    this.acquirerReference,
  });

  dynamic paymentMethodReferenceId;
  int? netReceivedAmount;
  int? totalPaidAmount;
  int? overpaidAmount;
  dynamic externalResourceUrl;
  double? installmentAmount;
  dynamic financialInstitution;
  dynamic payableDeferralPeriod;
  dynamic acquirerReference;

  factory TransactionDetails.fromJson(String str) =>
      TransactionDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransactionDetails.fromMap(Map<String, dynamic> json) =>
      TransactionDetails(
        paymentMethodReferenceId: json["payment_method_reference_id"],
        netReceivedAmount: json["net_received_amount"],
        totalPaidAmount: json["total_paid_amount"],
        overpaidAmount: json["overpaid_amount"],
        externalResourceUrl: json["external_resource_url"],
        installmentAmount: json["installment_amount"].toDouble(),
        financialInstitution: json["financial_institution"],
        payableDeferralPeriod: json["payable_deferral_period"],
        acquirerReference: json["acquirer_reference"],
      );

  Map<String, dynamic> toMap() => {
        "payment_method_reference_id": paymentMethodReferenceId,
        "net_received_amount": netReceivedAmount,
        "total_paid_amount": totalPaidAmount,
        "overpaid_amount": overpaidAmount,
        "external_resource_url": externalResourceUrl,
        "installment_amount": installmentAmount,
        "financial_institution": financialInstitution,
        "payable_deferral_period": payableDeferralPeriod,
        "acquirer_reference": acquirerReference,
      };
}
