import 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
        Colors,
        Container,
        EdgeInsets,
        FontWeight,
        Key,
        StatelessWidget,
        Text,
        TextOverflow,
        TextStyle,
        Widget;

class ClientTextDetailProductWidget extends StatelessWidget {
  const ClientTextDetailProductWidget({
    Key? key,
    required this.text,
    this.size,
    this.isBold,
    this.color,
    this.paddingTop,
    this.maxLines,
    this.paddingLeft,
    this.paddingRight,
    this.paddingBottom,
  }) : super(key: key);

  final String text;
  final double? size;
  final bool? isBold;
  final Color? color;
  final double? paddingTop;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: paddingTop ?? 0,
        left: paddingLeft ?? 0,
        bottom: paddingBottom ?? 0,
        right: paddingRight ?? 0,
      ),
      width: double.infinity,
      child: Text(
        text,
        style: TextStyle(
          fontSize: size ?? 14,
          fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.normal,
          color: color ?? Colors.black,
        ),
        maxLines: maxLines ?? 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
