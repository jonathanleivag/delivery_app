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

class ClientCountProductDetailWidget extends StatelessWidget {
  const ClientCountProductDetailWidget({Key? key, this.count})
      : super(key: key);

  final int? count;

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    // _shoppProvider.count = count ?? _shoppProvider.count;

    Text _textCount() {
      return Text(
        _shoppProvider.count.toString(),
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      );
    }

    IconButton _button(IconData icon, {required bool sum}) {
      return IconButton(
        onPressed: () {
          if (sum) {
            _shoppProvider.sumCount();
          } else {
            if (_shoppProvider.count > 1) {
              _shoppProvider.subtractCount();
            }
          }
        },
        icon: Icon(
          icon,
          color: Colors.grey,
          size: 30,
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
