import 'package:delivery_app/models/models.dart' show Data;
import 'package:delivery_app/providers/profile_provider.dart';
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/utils/utils.dart' show SecureStorageUtil;
import 'package:delivery_app/views/views.dart' show CheckAuthView, EditUserView;
import 'package:flutter/material.dart'
    show
        AlertDialog,
        Alignment,
        AssetImage,
        AsyncSnapshot,
        BorderRadius,
        BoxDecoration,
        BoxFit,
        BuildContext,
        CircularProgressIndicator,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        Drawer,
        DrawerHeader,
        EdgeInsets,
        FadeInImage,
        FontStyle,
        FontWeight,
        FutureBuilder,
        Icon,
        Icons,
        Image,
        Key,
        ListBody,
        ListTile,
        ListView,
        Navigator,
        NetworkImage,
        SingleChildScrollView,
        StatelessWidget,
        Text,
        TextAlign,
        TextButton,
        TextOverflow,
        TextStyle,
        Widget,
        showDialog;
import 'package:provider/provider.dart' show Provider;
import 'package:rflutter_alert/rflutter_alert.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final List<ListTile> menu;

  @override
  Widget build(BuildContext context) {
    Future<void> _logout() async {
      final ProfileProvider _profileProvider =
          Provider.of<ProfileProvider>(context, listen: false);
      _profileProvider.resetFormData();
      await SecureStorageUtil.logout(context);
    }

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Se cerrara la sesion'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('¿Esta seguro de cerrar la sesion?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Salir'),
                onPressed: () {
                  _logout();
                },
              ),
              TextButton(
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void _navigateTo(String routeName) {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(routeName);
    }

    return Drawer(
        child: FutureBuilder(
      future: SecureStorageUtil.get('isrole'),
      builder: (context, AsyncSnapshot<String?> snapshot) {
        Widget data = Container();

        if (!snapshot.hasData) {
          data = Container();
        }
        if (snapshot.data != null) {
          if (snapshot.data == 'true') {
            data = ListView(
              padding: EdgeInsets.zero,
              children: [
                const _DrawerHeader(),
                ListTile(
                  title: const Text('Actualizar perfil'),
                  trailing: const Icon(Icons.edit_outlined),
                  onTap: () => _navigateTo(EditUserView.routerName),
                ),
                ...menu,
                ListTile(
                  title: const Text('Seleccionar rol'),
                  trailing: const Icon(Icons.person_outline),
                  onTap: () async {
                    Alert(
                      context: context,
                      title: "¿Quieres cambiar de rol?",
                      desc: "Si no quieres cambiar de rol presiona X",
                      style: const AlertStyle(
                        descStyle: TextStyle(fontSize: 14),
                        descTextAlign: TextAlign.start,
                      ),
                      buttons: [
                        DialogButton(
                          child: const Text(
                            "Cambiar rol",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                            Navigator.of(context).pop();
                            await SecureStorageUtil.set('role', '');
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                CheckAuthView.routerName, (route) => false);
                          },
                          color: ColorTheme.primaryColor,
                          radius: BorderRadius.circular(50),
                        ),
                      ],
                    ).show();
                  },
                ),
                ListTile(
                  onTap: _showMyDialog,
                  title: const Text('Cerrar sesión'),
                  trailing: const Icon(Icons.power_settings_new),
                ),
              ],
            );
          } else {
            data = ListView(
              padding: EdgeInsets.zero,
              children: [
                const _DrawerHeader(),
                ListTile(
                  title: const Text('Actualizar perfil'),
                  trailing: const Icon(Icons.edit_outlined),
                  onTap: () => _navigateTo(EditUserView.routerName),
                ),
                ...menu,
                ListTile(
                  onTap: _showMyDialog,
                  title: const Text('Cerrar sesión'),
                  trailing: const Icon(Icons.power_settings_new),
                ),
              ],
            );
          }
        }

        return data;
      },
    ));
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SecureStorageUtil.get('user'),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          Widget data = _progress();
          if (!snapshot.hasData) {
            data = _progress();
          }

          if (snapshot.data != null) {
            final Data user = Data.fromJson(snapshot.data!);
            data = DrawerHeader(
              decoration: BoxDecoration(
                color: ColorTheme.primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _name(name: user.name),
                  _subtitle(text: user.email),
                  _subtitle(text: user.phone),
                  _image(image: user.image),
                ],
              ),
            );
          }

          return data;
        });
  }

  CircularProgressIndicator _progress() {
    return CircularProgressIndicator(
      color: ColorTheme.primaryColor,
    );
  }

  Text _name({required String name}) {
    return Text(
      name,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Text _subtitle({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.grey[300],
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Container _image({String? image}) {
    return Container(
      height: 60,
      alignment: Alignment.topLeft,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: image != null
          ? FadeInImage(
              placeholder: const AssetImage('assets/img/giphy.gif'),
              image: NetworkImage(image),
              fit: BoxFit.contain,
              fadeInDuration: const Duration(milliseconds: 300),
            )
          : const Image(image: AssetImage('assets/img/no-image.png')),
    );
  }
}
