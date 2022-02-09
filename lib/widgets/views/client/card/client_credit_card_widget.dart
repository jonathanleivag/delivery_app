import 'package:delivery_app/providers/providers.dart';
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show
        Alignment,
        BuildContext,
        Color,
        Colors,
        Key,
        LinearGradient,
        StatelessWidget,
        TileMode,
        Widget;
import 'package:flutter_credit_card/flutter_credit_card.dart'
    show CreditCardWidget, Glassmorphism;
import 'package:provider/provider.dart';

class ClientCreditCardWidget extends StatelessWidget {
  const ClientCreditCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CreditCardProvider _creditCardProvider =
        Provider.of<CreditCardProvider>(context);
    Glassmorphism _glassmorphismConfig() {
      return Glassmorphism(
        blurX: 02,
        blurY: 04,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          tileMode: TileMode.mirror,
          colors: <Color>[
            ColorTheme.primaryColor,
            Colors.red[300]!,
            Colors.red[400]!,
          ],
          stops: const <double>[
            0.5,
            0.9,
            0.1,
          ],
        ),
      );
    }

    return CreditCardWidget(
      cardNumber: _creditCardProvider.cardNumber,
      expiryDate: _creditCardProvider.expiryDate,
      cardHolderName: _creditCardProvider.cardHolderName,
      cvvCode: _creditCardProvider.cvvCode,
      cardBgColor: ColorTheme.primaryColor,
      showBackView: _creditCardProvider.showBackView,
      obscureCardNumber: false,
      obscureCardCvv: false,
      isHolderNameVisible: true,
      isSwipeGestureEnabled: true,
      labelCardHolder: 'NOMBRE DEL TITULAR',
      animationDuration: const Duration(milliseconds: 1000),
      glassmorphismConfig: _glassmorphismConfig(),
      onCreditCardWidgetChange:
          // ignore: non_constant_identifier_names
          (CreditCardBrand) {}, //true when you want to show cvv(back) view
    );
  }
}
