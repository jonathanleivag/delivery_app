import 'package:flutter/material.dart'
    show BoxFit, BuildContext, Key, StatelessWidget, Widget;
import 'package:lottie/lottie.dart' show Lottie;

class IconRole extends StatelessWidget {
  const IconRole({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    String _route() {
      String data = '';

      switch (icon) {
        case 'admin':
          data = 'assets/json/admin.json';
          break;
        case 'client':
          data = 'assets/json/client.json';
          break;
        case 'local':
          data = 'assets/json/local.json';
          break;
        case 'delivery':
          data = 'assets/json/delivery0.json';
          break;
        default:
          data = 'assets/json/delivery.json';
      }
      return data;
    }

    return Lottie.asset(
      _route(),
      width: 120,
      height: 120,
      fit: BoxFit.fill,
    );
  }
}
