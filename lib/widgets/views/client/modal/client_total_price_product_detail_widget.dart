import 'package:delivery_app/helpers/helpers.dart' show NumberToPriceHelper;
import 'package:delivery_app/providers/providers.dart'
    show ProductProvider, ShoppProvider;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        FontWeight,
        Key,
        Row,
        Spacer,
        StatelessWidget,
        CrossAxisAlignment,
        Text,
        TextStyle,
        Column,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientTotalPriceProductDetailWidget extends StatelessWidget {
  const ClientTotalPriceProductDetailWidget({Key? key, this.total})
      : super(key: key);

  final int? total;

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);

    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);

    final price = NumberToPriceHelper();

    return Row(
      children: [
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_shoppProvider.count} x ${price.clp(_productProvider.selectedProduct.price)}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Text(
              price.clp(_shoppProvider.total),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
