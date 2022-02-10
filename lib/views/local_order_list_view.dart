import 'package:delivery_app/providers/providers.dart' show MenuProvider;
import 'package:delivery_app/widgets/widgets.dart'
    show DrawerWidget, LocalTabBarProductListWidget, MenuIconWidget;
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Colors,
        Container,
        DefaultTabController,
        EdgeInsets,
        Key,
        Padding,
        PreferredSize,
        Scaffold,
        Size,
        StatelessWidget,
        TabBarView,
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

    return DefaultTabController(
      length: states.length,
      child: Scaffold(
        key: _menuProvider.scaffoldKey,
        appBar: AppBar(
            leading: const MenuIconWidget(),
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: LocalTabBarProductListWidget(
                    states: states,
                  ),
                ),
              ),
            )),
        drawer: const DrawerWidget(menu: []),
        body: TabBarView(
          children: states.map(
            (Map<String, String> state) {
              return Text(state['value']!);
            },
          ).toList(),
        ),
      ),
    );
  }
}
