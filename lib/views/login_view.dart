import 'package:delivery_app/providers/providers.dart' show LoginProvider;
import 'package:delivery_app/widgets/widgets.dart'
    show FormLoginWidget, HeroLoginWidget, BaseView;
import 'package:flutter/material.dart'
    show BuildContext, Key, Scaffold, StatelessWidget, Widget;
import 'package:provider/provider.dart' show ChangeNotifierProvider;

class LoginView extends StatelessWidget {
  static const String routerName = '/login';
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => LoginProvider(),
        child: const BaseView(
          title: 'Login',
          hero: HeroLoginWidget(),
          form: FormLoginWidget(),
        ),
      ),
    );
  }
}
