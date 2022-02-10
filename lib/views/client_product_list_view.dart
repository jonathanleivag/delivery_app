import 'package:delivery_app/providers/providers.dart'
    show MenuProvider, CategoryProvider;
import 'package:delivery_app/widgets/widgets.dart'
    show
        ClientBodyProductListWidget,
        ClientSearchProductListWidget,
        ClientShoppingBagProductListWidget,
        ClientTabBarProductListWidget,
        DrawerWidget,
        MenuIconWidget,
        NoItemWidget,
        Progress;
import 'package:flutter/material.dart'
    show
        AppBar,
        AsyncSnapshot,
        BuildContext,
        Colors,
        Column,
        Container,
        DefaultTabController,
        EdgeInsets,
        FutureBuilder,
        Icon,
        Icons,
        Key,
        ListTile,
        Padding,
        PreferredSize,
        Scaffold,
        Size,
        StatelessWidget,
        Text,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientProductListView extends StatelessWidget {
  static String routerName = "/client/product/list";
  const ClientProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuProvider _menuProvider = Provider.of<MenuProvider>(context);
    final CategoryProvider _categoryProvider =
        Provider.of<CategoryProvider>(context);

    DrawerWidget _drawer() {
      return const DrawerWidget(
        menu: [
          ListTile(
            title: Text('Mis pedidos'),
            trailing: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      );
    }

    return FutureBuilder(
      future: _categoryProvider.getCategories(),
      builder: (context, AsyncSnapshot<Map<String, List>> snapshot) {
        Widget data = const Progress();
        if (!snapshot.hasData) data = const Progress();
        if (snapshot.data != null) {
          final categories = snapshot.data!['categories'];
          data = DefaultTabController(
            length: categories!.length,
            child: Scaffold(
              appBar: AppBar(
                leading: const MenuIconWidget(),
                backgroundColor: Colors.white,
                elevation: 0,
                actions: const [
                  ClientShoppingBagProductListWidget(),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(135),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: ClientSearchProductListWidget(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClientTabBarProductListWidget(
                            categories: categories,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              drawer: _drawer(),
              key: _menuProvider.scaffoldKey,
              body: categories.isNotEmpty
                  ? ClientBodyProductListWidget(categories: categories)
                  : const NoItemWidget(
                      text: 'No hay producto para mostrar',
                    ),
            ),
          );
        }
        return data;
      },
    );
  }
}
