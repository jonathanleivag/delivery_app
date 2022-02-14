import 'package:delivery_app/models/models.dart' show DataProductByPurchaseId;
import 'package:flutter/material.dart'
    show
        BoxFit,
        BuildContext,
        FontWeight,
        Image,
        Key,
        ListTile,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

class LocalOrderDetailListWidget extends StatelessWidget {
  const LocalOrderDetailListWidget({
    Key? key,
    required this.products,
    required this.index,
  }) : super(key: key);

  final List<DataProductByPurchaseId> products;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        products[index].product.name,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
      leading: Image.network(
        products[index].product.image1,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
      subtitle: Text(
        'Cantidad: ${products[index].count.toString()}',
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
