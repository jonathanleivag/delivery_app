import 'package:delivery_app/helpers/helpers.dart' show NumberToPriceHelper;
import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:flutter/material.dart'
    show
        BuildContext,
        EdgeInsets,
        FontWeight,
        Key,
        Padding,
        Row,
        Spacer,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientOrderTotalListWidget extends StatelessWidget {
  const ClientOrderTotalListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberToPriceHelper();
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    return Row(
      children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            priceFormat.clp(
              _shoppProvider.totalOrder,
            ),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
