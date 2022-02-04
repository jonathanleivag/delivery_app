import 'package:flutter/material.dart'
    show AssetImage, BuildContext, Image, Key, StatelessWidget, Widget;

class ClientDirectionIconMyLocationWidget extends StatelessWidget {
  const ClientDirectionIconMyLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/img/my_location.png'),
    );
  }
}
