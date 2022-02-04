import 'package:delivery_app/providers/providers.dart' show RegisterProvider;
import 'package:delivery_app/widgets/widgets.dart'
    show BaseView, FormRegisterWidget, HeroRegisterWidget;
import 'package:flutter/material.dart'
    show BuildContext, Key, Scaffold, StatelessWidget, Widget;
import 'package:provider/provider.dart' show Provider;

class RegisterView extends StatelessWidget {
  static const String routerName = '/register';
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterProvider _registerProvider =
        Provider.of<RegisterProvider>(context);
    return Scaffold(
        body: BaseView(
      title: 'Registro',
      hero: HeroRegisterWidget(
        registerProvider: _registerProvider,
      ),
      form: FormRegisterWidget(
        registerProvider: _registerProvider,
      ),
    ));
  }
}
