import 'package:flutter/material.dart'
    show
        AssetImage,
        BoxFit,
        BuildContext,
        FadeInImage,
        Key,
        NetworkImage,
        StatelessWidget,
        Widget;

class ClientOrderImageListWidget extends StatelessWidget {
  const ClientOrderImageListWidget({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: const AssetImage('assets/img/no-image.png'),
      image: NetworkImage(image),
      fadeInDuration: const Duration(milliseconds: 200),
      fit: BoxFit.contain,
      placeholderFit: BoxFit.cover,
      width: 100,
      height: 100,
    );
  }
}
