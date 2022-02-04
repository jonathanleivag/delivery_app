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

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    String _nameSpanish() {
      String data = '';

      switch (name) {
        case 'admin':
          data = 'Administrador';
          break;
        case 'client':
          data = 'Cliente';
          break;
        case 'local':
          data = 'Restaurent';
          break;
        case 'delivery':
          data = 'Repartidor';
          break;
        default:
          data = 'Administrador';
      }

      return data;
    }

    return Text(
      _nameSpanish().toUpperCase(),
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
