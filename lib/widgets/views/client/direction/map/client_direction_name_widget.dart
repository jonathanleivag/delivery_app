import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Card,
        Colors,
        EdgeInsets,
        FontWeight,
        Key,
        Padding,
        RoundedRectangleBorder,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientDirectionNameWidget extends StatelessWidget {
  const ClientDirectionNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Text(
          _shoppProvider.placemarksCopy['direction'] ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
