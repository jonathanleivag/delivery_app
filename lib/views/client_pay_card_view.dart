import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/widgets/widgets.dart'
    show
        ClientCreditCardButtonWidget,
        ClientCreditCardFormWidget,
        ClientCreditCardWidget;
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Key,
        ListView,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;

class ClientPayCardView extends StatelessWidget {
  const ClientPayCardView({Key? key}) : super(key: key);

  static const String routerName = '/client/pay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago'),
        backgroundColor: ColorTheme.primaryColor,
      ),
      body: ListView(
        children: const [
          ClientCreditCardWidget(),
          ClientCreditCardFormWidget(),
        ],
      ),
      bottomNavigationBar: const ClientCreditCardButtonWidget(),
    );
  }
}
