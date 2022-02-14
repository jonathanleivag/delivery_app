import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Colors,
        Container,
        EdgeInsets,
        ElevatedButton,
        Icon,
        Icons,
        Key,
        MainAxisAlignment,
        RoundedRectangleBorder,
        Row,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

class LocalOrderButtonWidget extends StatelessWidget {
  const LocalOrderButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            SizedBox(width: 10),
            Text(
              'Despachar orden',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: ColorTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
