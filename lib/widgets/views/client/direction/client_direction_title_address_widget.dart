import 'package:flutter/material.dart'
    show
        BuildContext,
        Container,
        EdgeInsets,
        FontWeight,
        Key,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

class ClientDirectionTitleAddressWidget extends StatelessWidget {
  const ClientDirectionTitleAddressWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 30,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
