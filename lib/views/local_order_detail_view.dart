import 'package:delivery_app/models/models.dart' show DataProductByPurchaseId;
import 'package:delivery_app/providers/providers.dart' show LocalShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/widgets/widgets.dart'
    show
        LocalOrderButtonWidget,
        LocalOrderDetailListWidget,
        LocalOrderInfoClientWidget,
        Progress;
import 'package:flutter/material.dart'
    show
        AppBar,
        AsyncSnapshot,
        BuildContext,
        FutureBuilder,
        Key,
        ListView,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;
import 'package:provider/provider.dart' show Provider;

class LocalOrderDatailView extends StatelessWidget {
  const LocalOrderDatailView({Key? key}) : super(key: key);

  static const String routerName = '/local_order_datail_view';

  @override
  Widget build(BuildContext context) {
    final LocalShoppProvider _localShoppProvider =
        Provider.of<LocalShoppProvider>(context);
    return FutureBuilder(
      future: _localShoppProvider.getProductByPurchaseId(),
      builder:
          (context, AsyncSnapshot<List<DataProductByPurchaseId>> snapshot) {
        Widget data = const Progress();

        if (!snapshot.hasData) data = const Progress();

        if (snapshot.data != null) {
          final products = snapshot.data!;
          data = Scaffold(
            appBar: AppBar(
              title: Text('#${products[0].norder}'),
              backgroundColor: ColorTheme.primaryColor,
            ),
            body: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return LocalOrderDetailListWidget(
                  products: products,
                  index: index,
                );
              },
            ),
            bottomSheet: LocalOrderInfoClientWidget(
              products: products,
              localShoppProvider: _localShoppProvider,
            ),
            bottomNavigationBar: const LocalOrderButtonWidget(),
          );
        }
        return data;
      },
    );
  }
}
