import 'package:flutter/material.dart'
    show
        BuildContext,
        FontWeight,
        Key,
        StatelessWidget,
        Text,
        TextOverflow,
        TextStyle,
        Widget;

class ClientOrderTitleListWidget extends StatelessWidget {
  const ClientOrderTitleListWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
