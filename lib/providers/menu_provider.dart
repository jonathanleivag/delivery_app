import 'package:flutter/material.dart'
    show ChangeNotifier, GlobalKey, ScaffoldState;

class MenuProvider extends ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }
}
