import 'dart:convert' show json;

import 'package:delivery_app/models/models.dart'
    show
        AddressGetResponseModel,
        AddressResponseModel,
        DataAddress,
        DataProduct,
        DataProductShopp,
        ShoppAllResponseModel,
        ShoppResponseModel;
import 'package:delivery_app/utils/utils.dart'
    show EnvUtil, GeolocatorUtil, SecureStorageUtil;
import 'package:flutter/material.dart'
    show ChangeNotifier, FormState, GlobalKey;
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class ShoppProvider extends ChangeNotifier {
  DataProduct? _product;
  int? _price;
  int _total = 0;
  int _count = 1;
  final String _baseUrl = EnvUtil.uriApi;
  bool _isLoading = false;
  final Map<String, ShoppResponseModel?> _shopp = {};
  final List<DataProductShopp> orders = [];
  bool isUpdateOrder = false;
  int totalOrder = 0;
  Map<String, dynamic> _placemarksCopy = {
    'barrioForm': '',
    'directionForm': '',
  };
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DataAddress? fristAddress;
  final List<DataAddress> addresses = [];

  Map<String, dynamic> _placemarks = {
    'barrioForm': '',
    'directionForm': '',
  };

  void reset() {
    _product = null;
    _price = null;
    _total = 0;
    _count = 1;
    _isLoading = false;
    _shopp.clear();
    orders.clear();
    isUpdateOrder = false;
    totalOrder = 0;
    _placemarksCopy = {
      'barrioForm': '',
      'directionForm': '',
    };
    _placemarks = {
      'barrioForm': '',
      'directionForm': '',
    };
    fristAddress = null;
    addresses.clear();
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  set total(int value) {
    _total = value;
    notifyListeners();
  }

  int get total => _total;

  set count(int value) {
    _count = value;
    notifyListeners();
  }

  int get count => _count;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set product(DataProduct product) {
    _product = product;
    _price = product.price;
  }

  void sumCount() {
    count++;
    total = _price! * count;
    notifyListeners();
  }

  void subtractCount() {
    count--;
    total = _price! * count;
    notifyListeners();
  }

  Future<ShoppResponseModel> addToCart() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse('$_baseUrl/shopp/create');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': await SecureStorageUtil.get('token') ?? '',
    };

    Map<String, dynamic> formData = {
      'product': _product!.id,
      'total': _total == 0 ? _price : _total,
      'count': _count,
    };

    final res =
        await http.post(url, headers: headers, body: json.encode(formData));

    final data = ShoppResponseModel.fromJson(res.body);

    if (data.success) {
      if (_shopp[data.data!.product.id] != null) {
        _shopp.remove(data.data!.product.id);
      }
    }
    isLoading = false;
    notifyListeners();
    return data;
  }

  Future<ShoppResponseModel> updateProduct() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse('$_baseUrl/shopp/update');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': await SecureStorageUtil.get('token') ?? '',
    };

    Map<String, dynamic> formData = {
      'id': _product!.id,
      'total': total == 0 ? _price : total,
      'count': count,
    };

    final res =
        await http.put(url, headers: headers, body: json.encode(formData));

    final data = ShoppResponseModel.fromJson(res.body);

    if (data.success) {
      if (_shopp[_product!.id] != null) {
        _shopp.remove(_product!.id);
      }
      orders.clear();
    }
    isLoading = false;
    notifyListeners();
    return data;
  }

  Future<ShoppResponseModel> deleteProduct(
      {int? index, String? idProduct}) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse('$_baseUrl/shopp/delete');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': await SecureStorageUtil.get('token') ?? '',
    };

    Map<String, dynamic> formData = {
      'id': index == null ? _product!.id : idProduct,
    };

    final res =
        await http.delete(url, headers: headers, body: json.encode(formData));

    final data = ShoppResponseModel.fromJson(res.body);
    if (data.success &&
        _shopp[index == null ? _product!.id : idProduct] != null) {
      _shopp.remove(index == null ? _product!.id : idProduct);
    }

    if (index != null) orders.removeAt(index);
    isLoading = false;
    if (idProduct != null) {
      orders.removeWhere((element) => element.product.id == idProduct);
    }
    notifyListeners();
    return data;
  }

  Future<ShoppResponseModel> getOneShopp({required String idProduct}) async {
    if (_shopp[idProduct] == null) {
      final url = Uri.parse('$_baseUrl/shopp/$idProduct');

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': await SecureStorageUtil.get('token') ?? '',
      };

      final res = await http.get(url, headers: headers);
      final resJson = ShoppResponseModel.fromJson(res.body);
      _shopp[idProduct] = resJson;
      if (resJson.success) {
        orders.add(resJson.data!);
      }
      notifyListeners();
    }

    return _shopp[idProduct]!;
  }

  Future<List<DataProductShopp>> getAllShopp() async {
    if (orders.isEmpty) {
      isUpdateOrder = false;
      final url = Uri.parse('$_baseUrl/shopp/all');

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': await SecureStorageUtil.get('token') ?? '',
      };

      final res = await http.get(url, headers: headers);
      final data = ShoppAllResponseModel.fromJson(res.body);
      orders.addAll(data.data!);
      notifyListeners();
    }

    totalOrder = 0;
    for (final element in orders) {
      totalOrder += element.total;
    }

    return orders;
  }

  Future<void> changeCount(int index, {required bool sum}) async {
    isUpdateOrder = true;
    if (sum) {
      orders[index].count++;
      orders[index].total = orders[index].count * orders[index].product.price;
    } else {
      orders[index].count--;
      orders[index].total = orders[index].count * orders[index].product.price;
    }
    notifyListeners();
  }

  Future<ShoppResponseModel> updateProductAll(
      {bool changeStatus = false}) async {
    isLoading = true;
    notifyListeners();
    Uri url;
    if (changeStatus) {
      url = Uri.parse('$_baseUrl/shopp/updateAll');
    } else {
      url = Uri.parse('$_baseUrl/shopp/updateAllCountoAndTotal');
    }

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': await SecureStorageUtil.get('token') ?? '',
    };

    Map<String, dynamic> formData = {
      'products': [...orders]
    };

    final res =
        await http.put(url, headers: headers, body: json.encode(formData));

    final data = ShoppResponseModel.fromJson(res.body);

    if (data.success) {
      _shopp.clear();
    }
    isLoading = false;
    notifyListeners();
    return data;
  }

  Future<Position> getPosition() async {
    final geolocator = GeolocatorUtil();
    return geolocator.determinePosition();
  }

  set placemarksCopy(Map<String, dynamic> value) {
    _placemarksCopy.addAll(value);
    notifyListeners();
  }

  Map<String, dynamic> get placemarksCopy => _placemarksCopy;
  Map<String, dynamic> get placemarks => _placemarks;

  void setPlacemarks() {
    _placemarks = _placemarksCopy;
    notifyListeners();
  }

  void resetPlacemarksCopy() {
    _placemarksCopy = {
      'barrioForm': '',
      'directionForm': '',
    };
    notifyListeners();
  }

  void resetPlacemarksAll() {
    _placemarks = {
      'barrioForm': '',
      'directionForm': '',
    };
    _placemarksCopy = {
      'barrioForm': '',
      'directionForm': '',
    };
    notifyListeners();
  }

  void setForm(String name, String value) {
    _placemarksCopy[name] = value;
  }

  Future<AddressResponseModel> createAddress() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('$_baseUrl/address/add');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': await SecureStorageUtil.get('token') ?? '',
    };

    final res =
        await http.post(url, headers: headers, body: json.encode(_placemarks));

    final data = AddressResponseModel.fromJson(res.body);

    if (data.success) {
      resetPlacemarksAll();
      formKey.currentState!.reset();
      addresses.add(data.data!);
      fristAddress = data.data!;
    }

    isLoading = false;
    notifyListeners();
    return data;
  }

  Future<List<DataAddress>> getAddress() async {
    if (addresses.isEmpty) {
      final url = Uri.parse('$_baseUrl/address/');

      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Authorization': await SecureStorageUtil.get('token') ?? '',
      };

      final res = await http.get(url, headers: headers);
      final data = AddressGetResponseModel.fromJson(res.body);
      if (data.success) {
        addresses.addAll(data.data);
        if (addresses.isNotEmpty) fristAddress = addresses.first;
      } else {
        addresses.clear();
        fristAddress = null;
      }
    }
    return addresses;
  }

  Future<AddressResponseModel> addAddressShopp() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('$_baseUrl/address/add/shopp');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': await SecureStorageUtil.get('token') ?? '',
    };

    final res = await http.post(url,
        headers: headers, body: json.encode({'addressId': fristAddress!.id}));
    final data = AddressResponseModel.fromJson(res.body);

    isLoading = false;
    notifyListeners();

    return data;
  }
}
