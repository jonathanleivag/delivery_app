import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        CircularProgressIndicator,
        Colors,
        ElevatedButton,
        MainAxisAlignment,
        Key,
        RoundedRectangleBorder,
        Row,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

class ButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final bool? isLoading;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading != null && isLoading!)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: ColorTheme.primaryColor,
                ),
              ),
            if (isLoading != null && isLoading!) const SizedBox(width: 10),
            Text(text),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: ColorTheme.primaryColor,
          textStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
