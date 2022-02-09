import 'dart:convert';

import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart' show EnvUtil, SecureStorageUtil;
import 'package:flutter/material.dart'
    show ChangeNotifier, FormState, GlobalKey;
import 'package:http/http.dart' as http;

class CreditCardProvider extends ChangeNotifier {
  String _cardNumber = '';
  String _cardHolderName = '';
  String _expiryDate = '';
  String _cvvCode = '';
  String _cardType = '';
  bool _showBackView = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String _baseUrl = EnvUtil.uriApi;
  CardTokensResponseModel? _cardTokens;

  bool get showBackView => _showBackView;

  set showBackView(bool value) {
    _showBackView = value;
    notifyListeners();
  }

  String get cardNumber => _cardNumber;

  set cardNumber(String value) {
    _cardNumber = value;
    notifyListeners();
  }

  String get cardHolderName => _cardHolderName;

  set cardHolderName(String value) {
    _cardHolderName = value;
    notifyListeners();
  }

  String get expiryDate => _expiryDate;

  set expiryDate(String value) {
    _expiryDate = value;
    notifyListeners();
  }

  String get cvvCode => _cvvCode;

  set cvvCode(String value) {
    _cvvCode = value;
    notifyListeners();
  }

  String get cardType => _cardType;

  set cardType(String value) {
    _cardType = value;
    notifyListeners();
  }

  Future<void> cardTokens() async {
    final url = Uri.parse('$_baseUrl/pay/public-key');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': await SecureStorageUtil.get('token') ?? '',
    };
    final res = await http.get(url, headers: headers);

    final data = PublicKeyResponseModel.fromJson(res.body);
    if (data.success) {
    await _token(key: data.data!);
    }
  }

  Future<void> _token({required String key}) async {
    final url =
        Uri.parse('https://api.mercadopago.com/v1/card_tokens?public_key=$key');

    Map<String, String> headers = {'Content-Type': 'application/json'};

    final DateTime now = DateTime.now();
    final List yearNowArray = now.year.toString().split('');
    final int yearNow = int.parse(yearNowArray[0] + yearNowArray[1]);

    Map<String, dynamic> formData = {
      "card_number": _cardNumber.replaceAll(' ', ''),
      "cardholder": {"name": _cardHolderName},
      "security_code": _cvvCode,
      "expiration_month": int.parse(_expiryDate.split('/')[0]),
      "expiration_year": int.parse('$yearNow${_expiryDate.split('/')[1]}'),
    };
    final res =
        await http.post(url, headers: headers, body: json.encode(formData));

    final CardTokensResponseModel data =
        CardTokensResponseModel.fromJson(res.body);
    _cardTokens = data;
  }

  Future<InstallmentsResponeseModel> installments ({required int amount}) async {
    final url = Uri.parse('$_baseUrl/pay/installments');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': await SecureStorageUtil.get('token') ?? '',
    };

 Map<String, dynamic> formData = {
      "bin": _cardTokens!.firstSixDigits,
      "amount": amount,
    };

    final res = await http.post(url, headers: headers, body: json.encode(formData));

    final data = InstallmentsResponeseModel.fromJson(res.body);
    return data;
  }
}
