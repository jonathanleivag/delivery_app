import 'package:delivery_app/router/client/client_router.dart';
import 'package:delivery_app/router/delivery/delivery_router.dart';
import 'package:delivery_app/router/local/local_router.dart';
import 'package:delivery_app/router/login_register_router.dart';
import 'package:flutter/material.dart' show BuildContext, Widget, WidgetBuilder;

class Routes {
  Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{};
  Routes() {
    routes.addAll({
      ...loginRegisterRouter,
      ...clientRouter,
      ...localRouter,
      ...deliveryRouter
    });
  }
}
