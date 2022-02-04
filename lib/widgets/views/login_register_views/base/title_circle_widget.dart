import 'package:delivery_app/theme/color_theme.dart';
import 'package:flutter/material.dart';

class TitleCircleWidget extends StatelessWidget {
  const TitleCircleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
        color: ColorTheme.primaryColor,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
