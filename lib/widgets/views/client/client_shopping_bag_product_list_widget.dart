import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/views/views.dart' show ClientOrderListView;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Center,
        Colors,
        Container,
        EdgeInsets,
        Icon,
        IconButton,
        Icons,
        Key,
        Navigator,
        Padding,
        Positioned,
        Radius,
        Stack,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientShoppingBagProductListWidget extends StatelessWidget {
  const ClientShoppingBagProductListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: _shoppProvider.orders.isNotEmpty
                ? () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      ClientOrderListView.routerName,
                      (route) => false,
                    );
                  }
                : null,
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 27,
            ),
            color: Colors.black,
          ),
        ),
        if (_shoppProvider.orders.isNotEmpty)
          Positioned(
            right: 16,
            top: 10,
            child: Container(
              width: 17,
              height: 17,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 2, left: 1),
                child: Text(
                  _shoppProvider.orders.length >= 100
                      ? '+99'
                      : _shoppProvider.orders.length.toString(),
                  style: const TextStyle(fontSize: 9),
                ),
              )),
            ),
          )
      ],
    );
  }
}
