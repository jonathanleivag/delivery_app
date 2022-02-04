import 'package:delivery_app/providers/providers.dart' show MenuProvider;
import 'package:delivery_app/utils/utils.dart' show SecureStorageUtil;
import 'package:delivery_app/views/views.dart'
    show LocalCreateCategoryView, LocalCreateProductView;
import 'package:delivery_app/widgets/widgets.dart'
    show DrawerWidget, MenuIconWidget;
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        Icon,
        IconButton,
        Icons,
        Key,
        ListTile,
        Navigator,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;
import 'package:provider/provider.dart' show Provider;

class LocalOrderListView extends StatelessWidget {
  const LocalOrderListView({Key? key}) : super(key: key);

  static const String routerName = '/local_order_list_view';

  @override
  Widget build(BuildContext context) {
    final MenuProvider _menuProvider = Provider.of<MenuProvider>(context);

    logout() {
      SecureStorageUtil.logout(context);
    }

    return Scaffold(
      key: _menuProvider.scaffoldKey,
      appBar: AppBar(
        leading: const MenuIconWidget(),
      ),
      drawer: DrawerWidget(menu: [
        ListTile(
          title: const Text('Crear categoría'),
          trailing: const Icon(Icons.list_alt),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(LocalCreateCategoryView.routerName);
          },
        ),
        ListTile(
          title: const Text('Crear producto'),
          trailing: const Icon(Icons.local_pizza),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(LocalCreateProductView.routerName);
          },
        ),
      ]),
      body: Center(
        child: IconButton(
          onPressed: logout,
          icon: const Icon(Icons.exit_to_app),
        ),
      ),
    );
  }
}
