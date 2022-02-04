import 'package:delivery_app/models/models.dart' show DataProduct;
import 'package:delivery_app/providers/providers.dart' show ProductProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show
        AssetImage,
        BoxFit,
        BuildContext,
        Colors,
        FadeInImage,
        Key,
        MediaQuery,
        NetworkImage,
        SizedBox,
        StatelessWidget,
        Widget;
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart'
    show ImageSlideshow;
import 'package:provider/provider.dart' show Provider;

class ClientImageProductDetailWidget extends StatelessWidget {
  const ClientImageProductDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
    final DataProduct _product = _productProvider.selectedProduct;
    final _height = MediaQuery.of(context).size.height * 0.40;

    return _product.image2 != null
        ? ImageSlideshow(
            width: double.infinity,
            height: _height,
            initialPage: 0,
            indicatorColor: ColorTheme.primaryColor,
            indicatorBackgroundColor: Colors.grey,
            children: [
              FadeInImage(
                placeholder: _imgLoading(),
                image: NetworkImage(_product.image1),
                fit: BoxFit.cover,
              ),
              if (_product.image2 != null)
                FadeInImage(
                  placeholder: _imgLoading(),
                  image: NetworkImage(_product.image2!),
                  fit: BoxFit.cover,
                ),
              if (_product.image3 != null)
                FadeInImage(
                  placeholder: _imgLoading(),
                  image: NetworkImage(_product.image3!),
                  fit: BoxFit.cover,
                )
            ],
            autoPlayInterval: 3000,
            isLoop: true,
          )
        : SizedBox(
            width: double.infinity,
            height: _height,
            child: FadeInImage(
              placeholder: _imgLoading(),
              image: NetworkImage(_product.image1),
              fit: BoxFit.cover,
            ),
          );
  }

  AssetImage _imgLoading() => const AssetImage('assets/img/giphy.gif');
}
