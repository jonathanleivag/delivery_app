import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show BorderRadius, BuildContext, CircularProgressIndicator, Colors, Container, EdgeInsets, ElevatedButton, Icon, Icons, Key, MainAxisAlignment, RoundedRectangleBorder, Row, SizedBox, StatelessWidget, Text, TextStyle, Widget;

class ClientCreditCardButtonWidget extends StatelessWidget {
  const ClientCreditCardButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Future<void> _createAddress() async {

    // }

    // void _alert() {
    //   Alert(
    //     context: context,
    //     title: "Crear dirección",
    //     desc: "Si quieres editar tus datos cancela el registro con la X",
    //     style: const AlertStyle(
    //       descStyle: TextStyle(fontSize: 14),
    //       descTextAlign: TextAlign.start,
    //     ),
    //     buttons: [
    //       DialogButton(
    //         child: const Text(
    //           "Crear dirección",
    //           style: TextStyle(color: Colors.white, fontSize: 20),
    //         ),
    //         onPressed: () async {
    //           Navigator.pop(context);
    //           _createAddress();
    //         },
    //         color: ColorTheme.primaryColor,
    //         radius: BorderRadius.circular(50),
    //       ),
    //     ],
    //   ).show();
    // }


    return Container(
      height: 50,
      margin: const EdgeInsets.all(30),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.arrow_forward_ios),
                  SizedBox(width: 10),
                  Text(
                    'Continuar',
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
