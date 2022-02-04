import 'dart:io' show File;

import 'package:delivery_app/providers/providers.dart' show ProfileProvider;
import 'package:flutter/material.dart'
    show
        AlertDialog,
        AssetImage,
        BuildContext,
        CircleAvatar,
        Colors,
        FileImage,
        GestureDetector,
        ImageProvider,
        Key,
        Navigator,
        NetworkImage,
        SizedBox,
        StatelessWidget,
        Text,
        TextButton,
        Widget,
        showDialog;
import 'package:image_picker/image_picker.dart'
    show ImagePicker, ImageSource, XFile;

class HeroEditUserView extends StatelessWidget {
  const HeroEditUserView({
    Key? key,
    required this.profileProvider,
  }) : super(key: key);

  final ProfileProvider profileProvider;

  @override
  Widget build(BuildContext context) {
    Future<void> _galeria() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (photo != null) {
        profileProvider.img = photo.path;
      }
    }

    Future<void> _camera() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
      );
      if (photo != null) {
        profileProvider.img = photo.path;
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
                  profileProvider.img = '';
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

    return SizedBox(
      width: 100,
      height: 100,
      child: SizedBox(
        width: 50,
        height: 50,
        child: GestureDetector(
          onTap: _showMyDialog,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.grey[300],
            backgroundImage: profileProvider.img != ''
                ? profileProvider.img.contains('https')
                    ? NetworkImage(profileProvider.img) as ImageProvider
                    : FileImage(File(profileProvider.img))
                : const AssetImage('assets/img/user_profile_2.png'),
          ),
        ),
      ),
    );
  }
}
