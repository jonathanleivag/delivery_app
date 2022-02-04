import 'dart:convert' show json;

import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/utils/utils.dart';
import 'package:flutter/material.dart'
    show ChangeNotifier, FormState, GlobalKey;
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  Map<String, String> _formData = {
    'email': '',
    'password': '',
  };

  final String _baseUrl = EnvUtil.uriApi;

  List<DataRole> _roles = [];

  set roles(List<DataRole> role) {
    _roles = role;
    notifyListeners();
  }

  List<DataRole> get roles => _roles;

  set formData(Map<String, String> value) {
    _formData = value;
    notifyListeners();
  }

  Map<String, String> get formData => _formData;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  void resetForm() {
    formKey.currentState?.reset();
    _formData = {
      'email': '',
      'password': '',
    };
    notifyListeners();
  }

// Uso el modelo de UserConResponseModel porque es igual que la respuesta del login

  Future<UserCreateResponseModel> _login() async {
    final url = Uri.parse('$_baseUrl/user/login');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final res =
        await http.post(url, headers: headers, body: json.encode(_formData));
    final data = UserCreateResponseModel.fromJson(res.body);

    return data;
  }

  Future<TokenResponseModel> _verifyToken({required String token}) async {
    final url = Uri.parse('$_baseUrl/user/verify');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    final res = await http.get(url, headers: headers);

    final data = TokenResponseModel.fromJson(res.body);

    return data;
  }

  Future<RoleResponseModel> getRoleUser({required String token}) async {
    final data = await _verifyToken(token: token);

    final url = Uri.parse('$_baseUrl/role/get/user');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final res = await http.post(url,
        headers: headers, body: json.encode({'id': data.data?.id ?? ''}));
    return RoleResponseModel.fromJson(res.body);
  }

  Future<UserCreateResponseModel> onSubmit() async {
    isLoading = true;
    final data = await _login();
    isLoading = false;
    return data;
  }

  Future<String> readToken() async =>
      await SecureStorageUtil.get('token') ?? '';

  Future<String> readRole() async => await SecureStorageUtil.get('role') ?? '';

  Future<Data?> readUser() async => await SecureStorageUtil.get('user') != null
      ? Data.fromJson(await SecureStorageUtil.get('user') ?? '')
      : null;
}
