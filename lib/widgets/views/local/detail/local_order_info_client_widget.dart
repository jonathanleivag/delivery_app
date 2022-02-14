import 'package:delivery_app/helpers/helpers.dart' show NumberToPriceHelper;
import 'package:delivery_app/models/models.dart' show DataProductByPurchaseId;
import 'package:delivery_app/providers/providers.dart' show LocalShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show
        AsyncSnapshot,
        Border,
        BorderSide,
        BoxDecoration,
        BuildContext,
        CircularProgressIndicator,
        Colors,
        Column,
        Container,
        EdgeInsets,
        Expanded,
        FontWeight,
        FutureBuilder,
        Key,
        Padding,
        Row,
        SizedBox,
        StatelessWidget,
        Text,
        TextOverflow,
        TextStyle,
        Widget;

class LocalOrderInfoClientWidget extends StatelessWidget {
  const LocalOrderInfoClientWidget({
    Key? key,
    required this.products,
    required LocalShoppProvider localShoppProvider,
  })  : _localShoppProvider = localShoppProvider,
        super(key: key);

  final List<DataProductByPurchaseId> products;
  final LocalShoppProvider _localShoppProvider;

  @override
  Widget build(BuildContext context) {
    _info({required String text, required Widget child}) {
      return Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: child,
          ),
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: (Colors.grey[300])!,
          ),
        ),
      ),
      height: 150,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            _info(
                text: 'Cliente: ',
                child: Text(
                  '${products[0].user.name} ${products[0].user.lastName}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )),
            _info(
                text: 'Entregar en: ',
                child: Text(
                  '${products[0].address.direction}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )),
            _info(
                text: 'Fecha pedido:',
                child: Text(
                  '${products[0].createdAt.day}/${products[0].createdAt.month}/${products[0].createdAt.year}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )),
            _TotalPrice(localShoppProvider: _localShoppProvider),
          ],
        ),
      ),
    );
  }
}

class _TotalPrice extends StatelessWidget {
  const _TotalPrice({
    Key? key,
    required LocalShoppProvider localShoppProvider,
  })  : _localShoppProvider = localShoppProvider,
        super(key: key);

  final LocalShoppProvider _localShoppProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const Text(
            'Total: ',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          FutureBuilder(
            future: _localShoppProvider.getProductByPurchaseIdTotal(),
            builder: (context, AsyncSnapshot<int> snapshot) {
              final price = NumberToPriceHelper();

              final SizedBox _loading = SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  color: ColorTheme.primaryColor,
                ),
              );

              Widget data = _loading;

              if (!snapshot.hasData) data = _loading;

              if (snapshot.data != null) {
                data = Text(
                  price.clp(snapshot.data!, symbol: true),
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                );
              }

              return data;
            },
          )
        ],
      ),
    );
  }
}
