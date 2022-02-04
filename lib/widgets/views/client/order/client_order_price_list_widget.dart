import 'package:delivery_app/helpers/helpers.dart' show NumberToPriceHelper;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Key,
        StatelessWidget,
        Text,
        TextOverflow,
        TextStyle,
        Widget;

class ClientOrderPriceListWidget extends StatelessWidget {
  const ClientOrderPriceListWidget({
    Key? key,
    required this.price,
    required this.count,
  }) : super(key: key);

  final int price;
  final int count;

  @override
  Widget build(BuildContext context) {
    final formatPrice = NumberToPriceHelper();
    return Text(
      '$count x ${formatPrice.clp(price)}',
      style: const TextStyle(
        fontSize: 14,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
