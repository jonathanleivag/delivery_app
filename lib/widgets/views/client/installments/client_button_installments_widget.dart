import 'package:delivery_app/theme/color_theme.dart';
import 'package:flutter/material.dart';

class ClientButtonInstallmentsWidget extends StatelessWidget {
  const ClientButtonInstallmentsWidget({Key? key}) : super(key: key);

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
            Icon(Icons.attach_money),
            SizedBox(width: 10),
            Text(
              'Confirmar pago',
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
