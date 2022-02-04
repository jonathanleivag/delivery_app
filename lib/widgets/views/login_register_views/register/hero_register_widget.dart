import 'dart:io' show File;
import 'package:delivery_app/providers/providers.dart' show RegisterProvider;
import 'package:flutter/material.dart'
    show
        AlertDialog,
        AssetImage,
        BuildContext,
        CircleAvatar,
        Colors,
        Container,
        EdgeInsets,
        Key,
        MediaQuery,
        Navigator,
        StatelessWidget,
        Text,
        TextButton,
        Widget,
        GestureDetector,
        FileImage,
        ImageProvider,
        showDialog;
import 'package:image_picker/image_picker.dart'
    show ImagePicker, ImageSource, XFile;

class HeroRegisterWidget extends StatelessWidget {
  const HeroRegisterWidget({
    Key? key,
    required this.registerProvider,
  }) : super(key: key);
  final RegisterProvider registerProvider;
  @override
  Widget build(BuildContext context) {
    return _Body(registerProvider: registerProvider);
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.registerProvider,
  }) : super(key: key);
  final RegisterProvider registerProvider;

  @override
  Widget build(BuildContext context) {
    Future<void> _galeria() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      if (photo != null) {
        registerProvider.img = photo.path;
      }
    }

    Future<void> _camera() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
      );
      if (photo != null) {
        registerProvider.img = photo.path;
      }
    }

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('selecciona una opción'),
            actions: <Widget>[
              TextButton(
                child: const Text('Galeria'),
                onPressed: () {
                  _galeria();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Camara'),
                onPressed: () {
                  _camera();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Limpiar imagen'),
                onPressed: () {
                  registerProvider.img = '';
                  Navigator.of(context).pop();
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

    return GestureDetector(
      onTap: _showMyDialog,
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.only(
          top: 100,
          bottom: MediaQuery.of(context).size.height * 0.05,
        ),
        child: CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 100,
          backgroundImage: registerProvider.img == ''
              // ? AssetImage(registerProvider.img)
              ? const AssetImage('assets/img/user_profile_2.png')
              : FileImage(File(registerProvider.img)) as ImageProvider,
        ),
      ),
    );
  }
}
