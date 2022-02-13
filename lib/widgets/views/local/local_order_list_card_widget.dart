import 'package:delivery_app/models/models.dart' show DataUserShopp;
import 'package:delivery_app/providers/providers.dart' show LocalShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show
        Alignment,
        AsyncSnapshot,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Card,
        Colors,
        Column,
        Container,
        EdgeInsets,
        FutureBuilder,
        Key,
        MediaQuery,
        Positioned,
        Radius,
        RoundedRectangleBorder,
        Stack,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;

class LocalOrderListCardWidget extends StatelessWidget {
  const LocalOrderListCardWidget({
    Key? key,
    required this.purchaseId,
  }) : super(key: key);

  final String purchaseId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      height: 175,
      child: _Card(
        purchaseId: purchaseId,
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required this.purchaseId,
  }) : super(key: key);

  final String purchaseId;

  @override
  Widget build(BuildContext context) {
    final LocalShoppProvider _localShoppProvider =
        Provider.of<LocalShoppProvider>(context);
    return FutureBuilder(
      future: _localShoppProvider.getUserShopp(purchaseId: purchaseId),
      builder: (context, AsyncSnapshot<DataUserShopp> snapshot) {
        Widget data = Container();
        if (!snapshot.hasData) data = Container();

        if (snapshot.data != null) {
          data = Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                _HeroTitle(
                  order: snapshot.data!.norder,
                ),
                _Body(
                  data: snapshot.data!,
                ),
              ],
            ),
          );
        }

        return data;
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.data,
  }) : super(key: key);

  final DataUserShopp data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: _BodyContent(
        date: data.updatedAt,
        nameLastName: '${data.user.name} ${data.user.lastName}',
        address: data.address.direction ?? data.address.directionForm,
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({
    Key? key,
    required this.date,
    required this.nameLastName,
    required this.address,
  }) : super(key: key);

  final DateTime date;
  final String nameLastName;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'Pedido: ${date.day}/${date.month}/${date.year}',
            style: _textStyle(),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'Cliente: $nameLastName',
            style: _textStyle(),
            maxLines: 1,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'Entregar en: $address',
            style: _textStyle(),
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  TextStyle _textStyle() => const TextStyle(fontSize: 14);
}

class _HeroTitle extends StatelessWidget {
  const _HeroTitle({
    Key? key,
    required this.order,
  }) : super(key: key);

  final int order;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: 30,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorTheme.primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: _Title(
          order: order,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.order,
  }) : super(key: key);

  final int order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        'Order #$order',
        style: const TextStyle(
            color: Colors.white, fontSize: 15, fontFamily: 'NimbusSans'),
      ),
    );
  }
}
