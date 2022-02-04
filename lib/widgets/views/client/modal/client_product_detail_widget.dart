import 'package:delivery_app/models/models.dart';
import 'package:delivery_app/providers/providers.dart'
    show ProductProvider, ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/widgets/widgets.dart'
    show
        ClientButtonProductDetailWidget,
        ClientCountProductDetailWidget,
        ClientIconProductDetailWidget,
        ClientImageProductDetailWidget,
        ClientTextDetailProductWidget,
        ClientTotalPriceProductDetailWidget;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Colors,
        Column,
        Container,
        EdgeInsets,
        Expanded,
        Icon,
        IconButton,
        Icons,
        Key,
        MediaQuery,
        Navigator,
        Positioned,
        Row,
        SizedBox,
        Spacer,
        Stack,
        StatelessWidget,
        Widget;
import 'package:provider/provider.dart';

class ClientProductDetailWidget extends StatelessWidget {
  const ClientProductDetailWidget({
    Key? key,
    this.isUpdate,
  }) : super(key: key);

  final bool? isUpdate;

  @override
  Widget build(BuildContext context) {
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
    final DataProduct _product = _productProvider.selectedProduct;
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    _shoppProvider.product = _product;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.87,
      child: Column(
        children: [
          Stack(
            children: [
              const ClientImageProductDetailWidget(),
              Positioned(
                top: 10,
                left: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ColorTheme.primaryColor,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
          ClientTextDetailProductWidget(
            text: _product.name,
            size: 25,
            isBold: true,
            paddingTop: 20,
            paddingBottom: 5,
            paddingLeft: 30,
          ),
          ClientTextDetailProductWidget(
            text: _product.description,
            size: 15,
            paddingLeft: 30,
            color: Colors.grey,
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: const [
                Expanded(
                  child: ClientCountProductDetailWidget(),
                  flex: 5,
                ),
                Expanded(
                  child: ClientTotalPriceProductDetailWidget(),
                  flex: 5,
                ),
              ],
            ),
          ),
          ClientIconProductDetailWidget(
            isUpdate: isUpdate,
          ),
          ClientButtonProductDetailWidget(
            isUpdate: isUpdate,
          )
        ],
      ),
    );
  }
}
