import 'package:delivery_app/theme/color_theme.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: ColorTheme.primaryColor,
        ),
      ),
    );
  }
}