import 'package:delivery_app/helpers/helpers.dart' show NumberToPriceHelper;
import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/providers/providers.dart'
    show ProductProvider, ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/widgets/widgets.dart'
    show ClientProductDetailWidget;
import 'package:flutter/material.dart'
    show
        AssetImage,
        AsyncSnapshot,
        AutomaticKeepAliveClientMixin,
        BorderRadius,
        BoxDecoration,
        BoxFit,
        BoxShape,
        BuildContext,
        Card,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        FadeInImage,
        FontWeight,
        FutureBuilder,
        GestureDetector,
        Icon,
        BoxShadow,
        Border,
        Icons,
        Key,
        MediaQuery,
        NetworkImage,
        Padding,
        Positioned,
        Radius,
        RoundedRectangleBorder,
        SizedBox,
        Spacer,
        Stack,
        State,
        StatefulWidget,
        Text,
        TextOverflow,
        TextStyle,
        Widget;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart'
    show showMaterialModalBottomSheet;
import 'package:provider/provider.dart' show Provider;
import 'package:skeletons/skeletons.dart'
    show
        SkeletonAvatar,
        SkeletonAvatarStyle,
        SkeletonItem,
        SkeletonLineStyle,
        SkeletonParagraph,
        SkeletonParagraphStyle;

class ClientCardProductListWidget extends StatefulWidget {
  const ClientCardProductListWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final DataProduct product;

  @override
  State<ClientCardProductListWidget> createState() =>
      _ClientCardProductListWidgetState();
}

class _ClientCardProductListWidgetState
    extends State<ClientCardProductListWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    final numberToPriceHelper = NumberToPriceHelper();
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);

    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);

    void openModal({ShoppResponseModel? shopp}) {
      _productProvider.selectedProduct = widget.product;

      if (shopp != null && shopp.success) {
        _shoppProvider.count = shopp.data!.count;
        _shoppProvider.total = shopp.data!.total;
      } else {
        _shoppProvider.count = 1;
        _shoppProvider.total = widget.product.price;
      }

      showMaterialModalBottomSheet(
        context: context,
        builder: (context) => ClientProductDetailWidget(
          isUpdate: shopp?.success,
        ),
      );
    }

    Positioned _iconsPlus({bool? isShopp}) {
      return Positioned(
        top: -1,
        right: -1,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isShopp != null && isShopp
                ? Colors.green
                : ColorTheme.primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(20),
            ),
          ),
          child: Icon(
            isShopp == null || !isShopp
                ? Icons.add
                : Icons.shopping_bag_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
      );
    }

    Container _imageProduct(BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(20),
        height: 150,
        width: MediaQuery.of(context).size.width * 0.45,
        child: FadeInImage(
          placeholder: const AssetImage('assets/img/no-image.png'),
          image: NetworkImage(widget.product.image1),
          fit: BoxFit.contain,
          fadeInDuration: const Duration(milliseconds: 50),
        ),
      );
    }

    Padding _textProduct(String text, {bool? isBold, double? size}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          text,
          maxLines: 2,
          style: TextStyle(
            fontSize: size ?? 15,
            fontFamily: 'NimbusSans',
            fontWeight: isBold != null ? FontWeight.bold : FontWeight.normal,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    SizedBox _space() => const SizedBox(height: 10);

    Widget _cardLoading() => SkeletonItem(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    shape: BoxShape.rectangle,
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 10),
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                    lines: 3,
                    spacing: 6,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                      borderRadius: BorderRadius.circular(8),
                      minLength: MediaQuery.of(context).size.width / 6,
                      maxLength: MediaQuery.of(context).size.width / 3,
                    ),
                  ),
                )
              ],
            ),
          ),
        );

    List<Widget> _body({ShoppResponseModel? shopp}) => [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imageProduct(context),
              _space(),
              _textProduct(widget.product.name),
              const Spacer(),
              _textProduct(
                numberToPriceHelper.clp(widget.product.price),
                isBold: true,
                size: 18,
              ),
              _space(),
            ],
          ),
          _iconsPlus(isShopp: shopp?.success),
        ];

    GestureDetector _card({ShoppResponseModel? shopp}) => GestureDetector(
          onTap: () => openModal(shopp: shopp),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: _body(shopp: shopp),
            ),
          ),
        );

    return FutureBuilder(
      future: _shoppProvider.getOneShopp(idProduct: widget.product.id),
      builder:
          (BuildContext context, AsyncSnapshot<ShoppResponseModel> snapshot) {
        Widget data = _cardLoading();

        if (!snapshot.hasData) data = _cardLoading();

        if (snapshot.data != null) {
          final shopp = snapshot.data;
          data = _card(shopp: shopp);
        }

        return data;
      },
    );
  }
}
