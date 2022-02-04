import 'package:delivery_app/views/views.dart'
    show CheckAuthView, EditUserView, LoginView, RegisterView;
import 'package:flutter/material.dart' show BuildContext, Widget, WidgetBuilder;

Map<String, Widget Function(BuildContext)> loginRegisterRouter =
    <String, WidgetBuilder>{
  LoginView.routerName: (BuildContext context) => const LoginView(),
  RegisterView.routerName: (BuildContext context) => const RegisterView(),
  CheckAuthView.routerName: (BuildContext context) => const CheckAuthView(),
  EditUserView.routerName: (BuildContext context) => const EditUserView(),
};
