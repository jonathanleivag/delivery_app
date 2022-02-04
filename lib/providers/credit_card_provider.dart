import 'package:flutter/material.dart'
    show ChangeNotifier, FormState, GlobalKey;

class CreditCardProvider extends ChangeNotifier {
  String _cardNumber = '';
  String _cardHolderName = '';
  String _expiryDate = '';
  String _cvvCode = '';
  String _cardType = '';
  bool _showBackView = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
}
