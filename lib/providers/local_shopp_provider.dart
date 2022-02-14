import 'package:delivery_app/models/models.dart'
    show
        DataProductByPurchaseId,
        DataUserShopp,
        LocalNumberOrderResponse,
        LocalProductByPurchaseIdResponse,
        LocalProductByPurchaseIdTotalResponse,
        LocalPurchaseIdResponse,
        LocalUserShoppResponse;
import 'package:delivery_app/utils/utils.dart' show EnvUtil, SecureStorageUtil;
import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:http/http.dart' as http;

class LocalShoppProvider extends ChangeNotifier {
  final String _baseUrl = EnvUtil.uriApi;
  bool _isLoading = false;
  final Map<String, List<String>> _purchaseIds = {};
  final Map<String, List<int>> _numberOrder = {};
  final Map<String, List<DataUserShopp>?> _userShopp = {};
  String _purchaseId = '';
  final Map<String, List<DataProductByPurchaseId>> productByPurchaseId = {};
  final Map<String, int> productByPurchaseIdTotal = {};

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set purchaseId(String value) {
    _purchaseId = value;
  }

  Future<List<String>> getLocalShopp({
    required String state,
  }) async {
    if (_purchaseIds[state] == null) {
      _purchaseIds[state] = [];
    }

    if (_purchaseIds[state]!.isEmpty) {
      final url = Uri.parse('$_baseUrl/shopp/purchaseIdByState/$state');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': await SecureStorageUtil.get('token') ?? '',
      };
      final res = await http.get(url, headers: headers);
      final data = LocalPurchaseIdResponse.fromJson(res.body);
      if (data.success) {
        _purchaseIds[state]!.addAll(data.data!);
      }
    }
    return _purchaseIds[state]!;
  }

  Future<DataUserShopp> getUserShopp({
    required String purchaseId,
  }) async {
    if (_userShopp[purchaseId] == null) {
      _userShopp[purchaseId] = [];
    }

    if (_userShopp[purchaseId]!.isEmpty) {
      final url = Uri.parse('$_baseUrl/shopp/userShopp/$purchaseId');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': await SecureStorageUtil.get('token') ?? '',
      };
      final res = await http.get(url, headers: headers);
      final data = LocalUserShoppResponse.fromJson(res.body);
      if (data.success) {
        _userShopp[purchaseId]!.add(data.data!);
      }
    }
    return _userShopp[purchaseId]![0];
  }

  Future<int> getNumberOrder({
    required String purchaseId,
  }) async {
    if (_numberOrder[purchaseId] == null) {
      _numberOrder[purchaseId] = [];
    }

    if (_numberOrder[purchaseId]!.isEmpty) {
      final url = Uri.parse('$_baseUrl/shopp/numberOrder/$purchaseId');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': await SecureStorageUtil.get('token') ?? '',
      };
      final res = await http.get(url, headers: headers);
      final data = LocalNumberOrderResponse.fromJson(res.body);
      if (data.success) {
        _numberOrder[purchaseId]!.addAll(data.data!);
      }
    }
    return _numberOrder[purchaseId]![0];
  }

  Future<List<DataProductByPurchaseId>> getProductByPurchaseId() async {
    if (productByPurchaseId[_purchaseId] == null) {
      productByPurchaseId[_purchaseId] = [];
    }
    if (productByPurchaseId[_purchaseId]!.isEmpty) {
      final url = Uri.parse('$_baseUrl/shopp/productByPurchaseId/$_purchaseId');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': await SecureStorageUtil.get('token') ?? '',
      };
      final res = await http.get(url, headers: headers);
      final data = LocalProductByPurchaseIdResponse.fromJson(res.body);
      if (data.success) {
        productByPurchaseId[_purchaseId]!.addAll(data.data!);
      }
    }
    return productByPurchaseId[_purchaseId]!;
  }

  Future<int> getProductByPurchaseIdTotal() async {
    if (productByPurchaseIdTotal[_purchaseId] == null) {
      productByPurchaseIdTotal[_purchaseId] = 0;
    }
    if (productByPurchaseIdTotal[_purchaseId]! == 0) {
      final url =
          Uri.parse('$_baseUrl/shopp/productByPurchaseIdTotal/$_purchaseId');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': await SecureStorageUtil.get('token') ?? '',
      };
      final res = await http.get(url, headers: headers);
      final data = LocalProductByPurchaseIdTotalResponse.fromJson(res.body);
      if (data.success) {
        productByPurchaseIdTotal[_purchaseId] = data.data!;
      }
    }
    return productByPurchaseIdTotal[_purchaseId]!;
  }
}
