import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show
        BuildContext,
        FontWeight,
        Key,
        MainAxisAlignment,
        Row,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Widget,
        GestureDetector,
        Navigator;

class ActionRegisterOrLoginWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final String router;

  const ActionRegisterOrLoginWidget({
    Key? key,
    required this.text1,
    required this.text2,
    required this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushReplacementNamed(context, router),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: TextStyle(
              color: ColorTheme.primaryColor,
            ),
          ),
          const SizedBox(width: 7),
          Text(
            text2,
            style: TextStyle(
              color: ColorTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
