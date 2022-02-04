import 'package:delivery_app/models/models.dart' show DataProductShopp;
import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/views/views.dart';
import 'package:delivery_app/widgets/widgets.dart'
    show
        ClientOrderButtonDeleteListWidget,
        ClientOrderButtonListWidget,
        ClientOrderCountListWidget,
        ClientOrderImageListWidget,
        ClientOrderPriceListWidget,
        ClientOrderTitleListWidget,
        ClientOrderTotalListWidget,
        NoItemWidget;
import 'package:flutter/material.dart'
    show
        AppBar,
        AsyncSnapshot,
        BorderRadius,
        BoxShape,
        BuildContext,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        FutureBuilder,
        Icon,
        IconButton,
        Icons,
        Key,
        ListTile,
        ListView,
        MediaQuery,
        Navigator,
        Scaffold,
        StatelessWidget,
        Text,
        Widget;
import 'package:provider/provider.dart' show Provider;
import 'package:skeletons/skeletons.dart'
    show
        SkeletonAvatar,
        SkeletonAvatarStyle,
        SkeletonItem,
        SkeletonLineStyle,
        SkeletonParagraph,
        SkeletonParagraphStyle;

class ClientOrderListView extends StatelessWidget {
  const ClientOrderListView({Key? key}) : super(key: key);

  static const String routerName = '/client_order_list';

  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);

    SkeletonItem _loadListTile() {
      return SkeletonItem(
        child: ListTile(
          minVerticalPadding: 30,
          leading: const SkeletonAvatar(
            style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle,
              width: 100,
              height: 100,
            ),
          ),
          title: SkeletonParagraph(
            style: SkeletonParagraphStyle(
              padding: EdgeInsets.zero,
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
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi orden'),
        backgroundColor: ColorTheme.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              ClientProductListView.routerName,
              (route) => false,
            );
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: FutureBuilder(
          future: _shoppProvider.getAllShopp(),
          builder: (context, AsyncSnapshot<List<DataProductShopp>> snapshot) {
            Widget data = _loadListTile();
            if (!snapshot.hasData) data = _loadListTile();
            if (snapshot.data != null) {
              final List<DataProductShopp> _orders = snapshot.data!;
              if (_orders.isEmpty) {
                data = const NoItemWidget(
                  text: 'No hay producto en la bolsa',
                );
              } else {
                data = ListView.builder(
                  itemCount: _orders.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      minVerticalPadding: 30,
                      leading: ClientOrderImageListWidget(
                        image: _orders[index].product.image1,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClientOrderTitleListWidget(
                            title: _orders[index].product.name,
                          ),
                          ClientOrderPriceListWidget(
                            price: _orders[index].product.price,
                            count: _orders[index].count,
                          ),
                          ClientOrderCountListWidget(
                            index: index,
                            count: _orders[index].count,
                          ),
                        ],
                      ),
                      trailing: ClientOrderButtonDeleteListWidget(
                        index: index,
                        idProduct: _orders[index].product.id,
                      ),
                    );
                  },
                );
              }
            }
            return data;
          },
        ),
      ),
      bottomSheet: _shoppProvider.orders.isNotEmpty
          ? const ClientOrderTotalListWidget()
          : null,
      bottomNavigationBar: _shoppProvider.orders.isNotEmpty
          ? const ClientOrderButtonListWidget()
          : null,
    );
  }
}
