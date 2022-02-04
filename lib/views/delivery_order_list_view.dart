import 'package:delivery_app/providers/providers.dart';
import 'package:delivery_app/utils/utils.dart' show SecureStorageUtil;
import 'package:delivery_app/widgets/widgets.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Icon,
        IconButton,
        Icons,
        Key,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;
import 'package:provider/provider.dart';

class DeliveryOrderView extends StatelessWidget {
  const DeliveryOrderView({Key? key}) : super(key: key);
  static const String routerName = '/delivery-order';

  @override
  Widget build(BuildContext context) {
        final MenuProvider _menuProvider = Provider.of<MenuProvider>(context);

    logout() {
      SecureStorageUtil.logout(context);
    }

    return Scaffold(
      key: _menuProvider.scaffoldKey,
      appBar: AppBar(
        title: const Text('Delivery Order'),
      ),
      drawer: const DrawerWidget(menu: []),
      body: Center(
        child: IconButton(
          onPressed: logout,
          icon: const Icon(Icons.exit_to_app),
        ),
      ),
    );
  }
}
