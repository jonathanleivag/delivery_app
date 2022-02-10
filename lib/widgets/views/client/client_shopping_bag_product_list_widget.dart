import 'package:delivery_app/views/views.dart';
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Colors,
        Container,
        EdgeInsets,
        Icon,
        IconButton,
        Icons,
        Key,
        Navigator,
        Positioned,
        Radius,
        Stack,
        StatelessWidget,
        Widget;

class ClientShoppingBagProductListWidget extends StatelessWidget {
  const ClientShoppingBagProductListWidget({Key? key}) : super(key: key);
// TODO: ver el tema que se duplica los productos en la bolsa al entrar que se cargue los producto
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                ClientOrderListView.routerName,
                (route) => false,
              );
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 27,
            ),
            color: Colors.black,
          ),
        ),
        Positioned(
          right: 20,
          top: 12,
          child: Container(
            width: 9,
            height: 9,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        )
      ],
    );
  }
}
