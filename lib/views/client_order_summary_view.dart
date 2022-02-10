import 'package:delivery_app/providers/credit_card_provider.dart'
    show CreditCardProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/views/views.dart';
import 'package:flutter/material.dart'
    show BorderRadius, BoxFit, BuildContext, ClipPath, Colors, Column, Container, EdgeInsets, ElevatedButton, FontWeight, Icon, Icons, Key, MainAxisAlignment, Navigator, RoundedRectangleBorder, Row, SafeArea, Scaffold, SingleChildScrollView, SizedBox, StatelessWidget, Text, TextAlign, TextStyle, Widget;
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart'
    show OvalBottomBorderClipper;
import 'package:lottie/lottie.dart' show Lottie;
import 'package:provider/provider.dart' show Provider;

class ClientOrderSummaryView extends StatelessWidget {
  const ClientOrderSummaryView({
    Key? key,
    this.isError = false,
  }) : super(key: key);

  final bool isError;

  static const String routerName = '/client/order/summary';
  static const String routerNameError = '/client/order/summary/Error';

  @override
  Widget build(BuildContext context) {
    final CreditCardProvider _creditCardProvider =
        Provider.of<CreditCardProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                width: double.infinity,
                height: 250,
                color: ColorTheme.primaryColor,
                child: SafeArea(
                  child: Column(
                    children: [
                      Lottie.asset(
                        isError
                            ? 'assets/json/error.json'
                            : 'assets/json/check.json',
                        width: 150,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        isError
                            ? 'Fallo de transacción'
                            : 'Gracias por tu compra',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Text(
                isError
                    ? 'Tu pago fue rechabado'
                    : 'Tu order fue procesada exitosamente usando (${_creditCardProvider.paymentMethodId?.toUpperCase()} ****${_creditCardProvider.cardTokens0?.lastFourDigits})',
                style: _textStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: Text(
                isError
                    ? 'Elige otra tarjeta u otro medio de pago'
                    : 'Mira el estado de tu compra en la sección de "Mis pedidos"',
                style: _textStyle(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.all(30),
        child: ElevatedButton(
          onPressed: () {
            _creditCardProvider.resetForm();
            Navigator.of(context).pushNamedAndRemoveUntil(
              ClientProductListView.routerName,
              (route) => false,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_forward_ios),
              SizedBox(width: 10),
              Text(
                'Finalizar pedido',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: ColorTheme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _textStyle() {
    return const TextStyle(
      fontSize: 17,
    );
  }
}
