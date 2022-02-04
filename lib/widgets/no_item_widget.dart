import 'package:flutter/material.dart'
    show
        AssetImage,
        BuildContext,
        Center,
        Column,
        Image,
        Key,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

class NoItemWidget extends StatelessWidget {
  const NoItemWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Image(
            image: AssetImage('assets/img/no_items.png'),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
