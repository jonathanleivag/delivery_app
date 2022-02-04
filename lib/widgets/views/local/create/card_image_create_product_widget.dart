import 'dart:io' show File;

import 'package:delivery_app/providers/providers.dart' show ProductProvider;
import 'package:flutter/material.dart'
    show
        AlertDialog,
        AssetImage,
        Axis,
        BuildContext,
        Card,
        Container,
        EdgeInsets,
        GestureDetector,
        Image,
        Key,
        MainAxisAlignment,
        MediaQuery,
        Navigator,
        NetworkImage,
        Row,
        SingleChildScrollView,
        SizedBox,
        StatelessWidget,
        Text,
        TextButton,
        Widget,
        showDialog;
import 'package:provider/provider.dart' show Provider;
import 'package:image_picker/image_picker.dart'
    show ImagePicker, ImageSource, XFile;

class CardImageCreateProductWidget extends StatelessWidget {
  const CardImageCreateProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 25),
      height: 100,
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _Card(
              image: 'image1',
            ),
            _productProvider.formDataImage['image1'] != ''
                ? const _Card(
                    image: 'image2',
                  )
                : Container(),
            _productProvider.formDataImage['image2'] != ''
                ? const _Card(
                    image: 'image3',
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);

    Future<void> _galeria() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (photo != null) {
        _productProvider.setImage(image, photo.path);
      }
    }

    Future<void> _camera() async {
      final ImagePicker _picker = ImagePicker();
      final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
      );
      if (photo != null) {
        _productProvider.setImage(image, photo.path);
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
                  if (image == 'image1') {
                    if (_productProvider.formDataImage['image2'] != '') {
                      _productProvider.setImage(
                          'image1', _productProvider.formDataImage['image2']);
                      _productProvider.setImage('image2', '');
                    } else {
                      _productProvider.setImage('image1', '');
                    }

                    if (_productProvider.formDataImage['image3'] != '') {
                      _productProvider.setImage(
                          'image2', _productProvider.formDataImage['image3']);
                      _productProvider.setImage('image3', '');
                    }
                  }

                  if (image == 'image2') {
                    if (_productProvider.formDataImage['image3'] != '') {
                      _productProvider.setImage(
                          'image2', _productProvider.formDataImage['image3']);
                      _productProvider.setImage('image3', '');
                    } else {
                      _productProvider.setImage('image2', '');
                    }
                  }

                  if (image == 'image3') {
                    _productProvider.setImage('image3', '');
                  }

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
      onTap: () {
        _showMyDialog();
      },
      child: Card(
        elevation: 0,
        child: SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width * 0.26,
          child: _productProvider.formDataImage[image] != ''
              ? _productProvider.formDataImage[image]!.contains('https')
                  ? Image(
                      image: NetworkImage(_productProvider.formDataImage[image]!),
                    )
                  : Image.file(File(_productProvider.formDataImage[image]!))
              : const Image(
                  image: AssetImage('assets/img/add-image-placeholder.png'),
                ),
        ),
      ),
    );
  }
}
