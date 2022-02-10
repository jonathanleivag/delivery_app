import 'dart:convert' show json;

import 'package:delivery_app/models/models.dart'
    show CategoryAllResponseModel, CategoryResponseModel;
import 'package:delivery_app/utils/utils.dart' show EnvUtil, SecureStorageUtil;
import 'package:flutter/material.dart'
    show ChangeNotifier, FormState, GlobalKey;
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map<String, String?> formData = {'category': '', 'description': ''};
  final String _baseUrl = EnvUtil.uriApi;
  bool _isLoading = false;
  Map<String, List> categories = {'categories': []};

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void resetForm() {
    formKey.currentState?.reset();
    formData = {'category': '', 'description': ''};
    notifyListeners();
  }

  Future<CategoryResponseModel> createCategory() async {
    isLoading = true;

    final url = Uri.parse('$_baseUrl/category/create');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': await SecureStorageUtil.get('token') ?? '',
    };

    final res =
        await http.post(url, headers: headers, body: json.encode(formData));

    final resp = CategoryResponseModel.fromJson(res.body);
    categories['categories']!
        .add({'label': resp.data!.category, 'value': resp.data!.id});
    isLoading = false;

    return resp;
  }

  Future<Map<String, List>> getCategories() async {
    if (categories['categories']!.isEmpty) {
      final url = Uri.parse('$_baseUrl/category/get/all');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      final res = await http.get(url, headers: headers);
      final data = CategoryAllResponseModel.fromJson(res.body);
      if (data.success) {
        for (var element in data.data!) {
          categories['categories']!
              .add({'label': element.category, 'value': element.id});
        }
      }
    }
    return categories;
  }

  void resetCategory() {
    categories = {'categories': []};
    notifyListeners();
  }
}
