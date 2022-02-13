import 'package:delivery_app/providers/providers.dart' show MenuProvider;
import 'package:delivery_app/views/views.dart' show LocalCreateCategoryView, LocalCreateProductView, LocalOrderListView;
import 'package:delivery_app/widgets/widgets.dart'
    show
        DrawerWidget,
        LocalOrderListStateWidget,
        LocalOrderListTabBarViewWidget,
        MenuIconWidget;
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Colors,
        DefaultTabController,
        Icon,
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

    const List<Map<String, String>> states = [
      {'label': 'Pendiente', 'value': 'pending'},
      {'label': 'Aceptado', 'value': 'accepted'},
      {'label': 'Rechazado', 'value': 'rejected'},
      {'label': 'Enviado', 'value': 'dispatched'},
      {'label': 'Recibió', 'value': 'received'},
    ];

    List<ListTile> menu = [
      ListTile(
        title: const Text('Crear categoría'),
        trailing: const Icon(Icons.list_alt),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(
            LocalCreateCategoryView.routerName,
          );
        },
      ),
      ListTile(
        title: const Text('Crear producto'),
        trailing: const Icon(Icons.local_pizza),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed(
            LocalCreateProductView.routerName,
          );
        },
      ),
    ];

    return DefaultTabController(
      length: states.length,
      child: Scaffold(
        key: _menuProvider.scaffoldKey,
        appBar: AppBar(
          leading: const MenuIconWidget(),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const LocalOrderListStateWidget(states: states),
        ),
        drawer: DrawerWidget(
          menu: menu,
        ),
        body: const LocalOrderListTabBarViewWidget(states: states),
      ),
    );
  }
}
