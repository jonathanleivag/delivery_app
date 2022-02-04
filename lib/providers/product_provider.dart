import 'dart:convert' show json;
import 'dart:io' show File;

import 'package:delivery_app/models/models.dart'
    show DataProduct, ProductByCategoryResponseModel, ProductResponseModel;
import 'package:delivery_app/utils/utils.dart' show EnvUtil, SecureStorageUtil;
import 'package:flutter/material.dart'
    show ChangeNotifier, FormState, GlobalKey;
import 'package:http/http.dart' as http;

class ProductProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final String _baseUrl = EnvUtil.uriApi;
  Map<String, dynamic> formData = {
    'name': '',
    'description': '',
    'price': '',
    'image1': '',
    'image2': '',
    'image3': '',
    'category': '',
  };
  Map<String, String?> formDataImage = {
    'image1': '',
    'image2': '',
    'image3': '',
  };

  File? image1;
  File? image2;
  File? image3;

  bool _isLoading = false;

  String? category;

  final Map<String, List<DataProduct>> _productsByCategory = {};
  late DataProduct _selectedProduct;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setImage(image, value) {
    formDataImage[image] = value;
    if (image == 'image1') {
      image1 = File(value);
    } else if (image == 'image2') {
      image2 = File(value);
    } else if (image == 'image3') {
      image3 = File(value);
    }
    notifyListeners();
  }

  void resetFormData() {
    formKey.currentState!.reset();
    formData = {
      'name': '',
      'description': '',
      'price': '',
      'image1': '',
      'image2': '',
      'image3': '',
      'category': category ?? '',
    };
    formDataImage = {
      'image1': '',
      'image2': '',
      'image3': '',
    };

    notifyListeners();
  }

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  Future<List<DataProduct>> getProductByCategory(String category) async {
    if (_productsByCategory[category] == null) {
      _productsByCategory[category] = [];
    }

    if (_productsByCategory[category]!.isEmpty) {
      final url = Uri.parse('$_baseUrl/product/category/$category');
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': await SecureStorageUtil.get('token') ?? '',
      };
      final res = await http.get(url, headers: headers);
      final resProductByCategory =
          ProductByCategoryResponseModel.fromJson(res.body);

      if (resProductByCategory.success) {
        _productsByCategory[category]!.addAll(resProductByCategory.data!);
      }
    }
    return _productsByCategory[category]!;
  }

  Future<ProductResponseModel> onSubmit() async {
    _isLoading = true;
    notifyListeners();
    final url = Uri.parse('$_baseUrl/product/create');

    if (formDataImage['image1'] != null || formDataImage['image1'] != '') {
      final path = await uploadImage(image1);
      formData['image1'] = path;
    }

    if (formDataImage['image2'] != null || formDataImage['image2'] != '') {
      final path = await uploadImage(image2);
      formData['image2'] = path;
    }

    if (formDataImage['image3'] != null || formDataImage['image3'] != '') {
      final path = await uploadImage(image3);
      formData['image3'] = path;
    }

    final price = formData['price']!.replaceAll(' ', '');

    formData['price'] = int.parse(price);

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': await SecureStorageUtil.get('token') ?? '',
    };

    final res =
        await http.post(url, headers: headers, body: json.encode(formData));
    resetFormData();
    _isLoading = false;
    final resJson = ProductResponseModel.fromJson(res.body);

    if (resJson.success &&
        _productsByCategory[resJson.data!.category.id] != null) {
      _productsByCategory[resJson.data!.category.id]!.add(resJson.data!);
    }
    notifyListeners();
    return resJson;
  }

  Future<String?> uploadImage(File? img) async {
    if (img != null) {
      final url = Uri.parse(
          'https://api.cloudinary.com/v1_1/${EnvUtil.cloudName}/image/upload?upload_preset=${EnvUtil.uploadPreset}');
      final imageUploadRequest = http.MultipartRequest('POST', url);
      final file = await http.MultipartFile.fromPath('file', img.path);
      imageUploadRequest.files.add(file);
      final streamResponse = await imageUploadRequest.send();
      final resp = await http.Response.fromStream(streamResponse);
      if (resp.statusCode != 201 && resp.statusCode != 200) {
        // ignore: avoid_print
        print('Algo salio mal');
        // ignore: avoid_print
        print(resp.body);
        return null;
      }
      img = null;
      return json.decode(resp.body)['secure_url'];
    }
  }

  set selectedProduct(DataProduct product) {
    _selectedProduct = product;
    notifyListeners();
  }

  DataProduct get selectedProduct => _selectedProduct;
}
