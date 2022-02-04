import 'package:flutter/material.dart'
    show
        BorderRadius,
        BorderSide,
        BuildContext,
        Colors,
        Container,
        EdgeInsets,
        Icon,
        Icons,
        InputDecoration,
        Key,
        OutlineInputBorder,
        StatelessWidget,
        TextField,
        TextStyle,
        Widget;

class ClientSearchProductListWidget extends StatelessWidget {
  const ClientSearchProductListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar producto',
          hintStyle: TextStyle(
            fontSize: 17,
            color: Colors.grey[500],
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.grey[400],
          ),
          enabledBorder: _borderStyle(),
          focusedBorder: _borderStyle(),
        ),
      ),
    );
  }

  OutlineInputBorder _borderStyle() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[300]!,
      ),
      borderRadius: BorderRadius.circular(25),
    );
  }
}
