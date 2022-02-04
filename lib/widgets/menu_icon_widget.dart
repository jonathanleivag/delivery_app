import 'package:delivery_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuIconWidget extends StatelessWidget {
  const MenuIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MenuProvider _menuProvider = Provider.of<MenuProvider>(context);

    _openMenu() {
      _menuProvider.openDrawer();
    }

    return GestureDetector(
      onTap: _openMenu,
      child: Container(
        margin: const EdgeInsets.only(left: 15, top: 10),
        alignment: Alignment.centerLeft,
        child: const Image(
          image: AssetImage('assets/img/menu.png'),
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
