import 'dart:convert' show json;
import 'dart:io' show File;

import 'package:delivery_app/models/models.dart'
    show Data, UserCreateResponseModel;
import 'package:delivery_app/utils/utils.dart' show EnvUtil, SecureStorageUtil;
import 'package:flutter/material.dart'
    show ChangeNotifier, FormState, GlobalKey;
import 'package:http/http.dart' as http;

class ProfileProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String _img = '';
  final String _baseUrl = EnvUtil.uriApi;
  File? _newPictureFile;
  bool _isLoading = false;

  Map<String, String?> formData = {
    'id': '',
    'email': '',
    'name': '',
    'lastName': '',
    'phone': '',
    'createdAt': '',
    'updatedAt': '',
  };

  Future<void> loadUser() async {
    final userString = await SecureStorageUtil.get('user');
    final Data user = Data.fromJson(userString!);
    if (user.image != null && _img == '') _img = user.image!;
  }

  Future<Map<String, String?>> userFormData() async {
    final userString = await SecureStorageUtil.get('user');
    final Data user = Data.fromJson(userString!);
    final userMap = user.toMap();
    formData.forEach((key, value) {
      if (value == '') {
        formData[key] = userMap[key];
      }
    });
    return formData;
  }

  Future<void> resetFormData() async {
    final userString = await SecureStorageUtil.get('user');
    final Data user = Data.fromJson(userString!);
    final userMap = user.toMap();
    formData.forEach((key, value) {
      formData[key] = userMap[key];
    });
  }

  set img(String value) {
    _img = value;
    notifyListeners();
  }

  String get img => _img;

  Future<String?> _uploadImage() async {
    if (_newPictureFile != null) {
      final url = Uri.parse(
          'https://api.cloudinary.com/v1_1/${EnvUtil.cloudName}/image/upload?upload_preset=${EnvUtil.uploadPreset}');
      final imageUploadRequest = http.MultipartRequest('POST', url);
      final file =
          await http.MultipartFile.fromPath('file', _newPictureFile!.path);
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
      _newPictureFile = null;
      return json.decode(resp.body)['secure_url'];
    }
  }

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  Future<UserCreateResponseModel> updateUser() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('$_baseUrl/user/update');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': await SecureStorageUtil.get('token') ?? '',
    };

    final userString = await SecureStorageUtil.get('user');
    final Data user = Data.fromJson(userString!);

    if (user.image != _img) {
      _newPictureFile = File.fromUri(Uri(path: _img));
      final String? urlImage = await _uploadImage();
      if (urlImage != null) {
        formData['image'] = urlImage;
      }
    }

    final res =
        await http.put(url, headers: headers, body: json.encode(formData));

    final newUser = UserCreateResponseModel.fromJson(res.body);

    if (newUser.success) {
      await SecureStorageUtil.set('user', newUser.data!.toJson());
      await SecureStorageUtil.set('token', newUser.token!);
    }

    isLoading = false;
    return newUser;
  }
}
