import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        FontWeight,
        Icon,
        IconButton,
        IconData,
        Icons,
        Key,
        Row,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientOrderCountListWidget extends StatelessWidget {
  const ClientOrderCountListWidget({
    Key? key,
    required this.index,
    required this.count,
  }) : super(key: key);

  final int index;
  final int count;

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    Text _textCount() {
      return Text(
        count.toString(),
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      );
    }

    IconButton _button(IconData icon, {required bool sum}) {
      return IconButton(
        onPressed: () async {
          if (sum) {
            await _shoppProvider.changeCount(index, sum: sum);
          } else {
            if (count > 1) {
              await _shoppProvider.changeCount(index, sum: sum);
            }
          }
        },
        icon: Icon(
          icon,
          color: Colors.grey,
          size: 25,
        ),
      );
    }

    return Row(
      children: [
        _button(Icons.remove_circle_outline, sum: false),
        _textCount(),
        _button(Icons.add_circle_outline, sum: true),
      ],
    );
  }
}
