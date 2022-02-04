import 'dart:convert' show json;
import 'dart:io' show File;

import 'package:delivery_app/models/models.dart' show UserCreateResponseModel;
import 'package:delivery_app/utils/utils.dart' show EnvUtil;
import 'package:flutter/material.dart'
    show ChangeNotifier, FormState, GlobalKey;
import 'package:http/http.dart' as http;

class RegisterProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final String _baseUrl = EnvUtil.uriApi;
  File? _newPictureFile;
  String _img = '';

  Map<String, String?> formData = <String, String>{
    'email': '',
    'name': '',
    'lastName': '',
    'phone': '',
    'password': '',
    'confirmPassword': '',
  };

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  void resetForm() {
    formKey.currentState?.reset();
    formData = <String, String>{
      'email': '',
      'name': '',
      'lastName': '',
      'phone': '',
      'password': '',
      'confirmPassword': '',
    };

    _img = '';

    notifyListeners();
  }

  Future<void> _updateImage() async {
    if (_img != '') {
      _newPictureFile = File.fromUri(Uri(path: _img));
      final String? urlImage = await uploadImage();
      if (urlImage != null) {
        formData['image'] = urlImage;
      }
    }
  }

  Future<UserCreateResponseModel> _register() async {
    final url = Uri.parse('$_baseUrl/user/new');
    await _updateImage();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final res =
        await http.post(url, headers: headers, body: json.encode(formData));
    return UserCreateResponseModel.fromJson(res.body);
  }

  Future<UserCreateResponseModel> onSubmit() async {
    isLoading = true;
    notifyListeners();
    final data = await _register();
    isLoading = false;
    return data;
  }

  set img(String value) {
    _img = value;
    notifyListeners();
  }

  String get img => _img;

  Future<String?> uploadImage() async {
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
}
