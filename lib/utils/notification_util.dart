import 'package:delivery_app/theme/color_theme.dart';
import 'package:flutter/material.dart'
    show
        Colors,
        GlobalKey,
        ScaffoldMessengerState,
        SnackBar,
        Text,
        TextStyle;

class NotificationUtil {
  static GlobalKey<ScaffoldMessengerState> globalKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String message, {required bool success}) {
    final snackBar = SnackBar(
      backgroundColor: success ? Colors.green : ColorTheme.primaryColor,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
    globalKey.currentState!.showSnackBar(snackBar);
  }
}
