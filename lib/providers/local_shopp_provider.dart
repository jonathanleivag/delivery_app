import 'package:delivery_app/models/models.dart'
    show LocalNumberOrderResponse, LocalPurchaseIdResponse, LocalUserShoppResponse, DataUserShopp;
import 'package:delivery_app/utils/utils.dart' show EnvUtil, SecureStorageUtil;
import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:http/http.dart' as http;

class LocalShoppProvider extends ChangeNotifier {
  final String _baseUrl = EnvUtil.uriApi;
  bool _isLoading = false;
  final Map<String, List<String>> _purchaseIds = {};
  final Map<String, List<int>> _numberOrder = {};
  final Map<String, List<DataUserShopp>?> _userShopp = {};

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
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
      _userShopp[purchaseId] = [] ;
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

  Future<int> getNumberOrder ({
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
}
