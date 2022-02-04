import 'package:delivery_app/providers/providers.dart' show CreditCardProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show
        BorderSide,
        BuildContext,
        InputDecoration,
        Key,
        OutlineInputBorder,
        StatelessWidget,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;
import 'package:flutter_credit_card/flutter_credit_card.dart'
    show CreditCardForm, CreditCardModel;

class ClientCreditCardFormWidget extends StatelessWidget {
  const ClientCreditCardFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CreditCardProvider _creditCardProvider =
        Provider.of<CreditCardProvider>(context);

    InputDecoration _inputDecoration({
      required String labelText,
      required String hintText,
    }) {
      return InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorTheme.primaryColor,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorTheme.primaryColor,
            width: 2,
          ),
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: ColorTheme.primaryColor,
        ),
        hintText: hintText,
      );
    }

    void _onCreditCardModelChange(CreditCardModel data) {
      _creditCardProvider.cardHolderName = data.cardHolderName.toUpperCase();
      _creditCardProvider.cardNumber = data.cardNumber;
      _creditCardProvider.expiryDate = data.expiryDate;
      _creditCardProvider.cvvCode = data.cvvCode;
      _creditCardProvider.showBackView = data.isCvvFocused;
    }

    return CreditCardForm(
      formKey: _creditCardProvider.formKey,
      onCreditCardModelChange: _onCreditCardModelChange,
      themeColor: ColorTheme.primaryColor,
      cursorColor: ColorTheme.primaryColor,
      obscureCvv: false,
      obscureNumber: false,
      isHolderNameVisible: true,
      isCardNumberVisible: true,
      isExpiryDateVisible: true,
      cvvValidationMessage: "CVV de tarjeta no valido",
      dateValidationMessage: "Fecha de tarjeta no valida",
      numberValidationMessage: "Numero de tarjeta no valido",
      cardNumberDecoration: _inputDecoration(
        labelText: 'Número de tarjeta',
        hintText: 'XXXX XXXX XXXX XXXX',
      ),
      expiryDateDecoration: _inputDecoration(
        labelText: 'Fecha de expiración',
        hintText: 'MM/AA',
      ),
      cvvCodeDecoration: _inputDecoration(
        labelText: 'CVV',
        hintText: 'XXX',
      ),
      cardHolderDecoration: _inputDecoration(
        labelText: 'Nombre del titular',
        hintText: 'xxxxxxxxxx xxxxxx xxxxx',
      ),
      cardHolderName: '',
      cardNumber: '',
      cvvCode: '',
      expiryDate: '',
    );
  }
}
