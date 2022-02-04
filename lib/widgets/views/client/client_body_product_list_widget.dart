import 'package:delivery_app/models/models.dart' show DataProduct;
import 'package:delivery_app/providers/providers.dart' show ProductProvider;
import 'package:delivery_app/widgets/widgets.dart'
    show ClientCardProductListWidget, NoItemWidget;
import 'package:flutter/material.dart'
    show
        AsyncSnapshot,
        BuildContext,
        Container,
        EdgeInsets,
        FutureBuilder,
        GridView,
        Key,
        SliverGridDelegateWithFixedCrossAxisCount,
        StatelessWidget,
        TabBarView,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientBodyProductListWidget extends StatelessWidget {
  const ClientBodyProductListWidget({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List? categories;

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
    return TabBarView(
      children: categories!.map((category) {
        return FutureBuilder(
          future: _productProvider.getProductByCategory(category['value']),
          builder: (context, AsyncSnapshot<List<DataProduct>> snapshot) {
            Widget data = Container();
            if (!snapshot.hasData) data = Container();
            if (snapshot.data != null) {
              final product = snapshot.data!;
              if (product.isEmpty) {
                data = const NoItemWidget(text: 'No hay productos');
              } else {
                data = GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: product.length,
                  itemBuilder: (context, index) {
                    return ClientCardProductListWidget(
                      product: product[index],
                    );
                  },
                );
              }
            }
            return data;
          },
        );
      }).toList(),
    );
  }
}
