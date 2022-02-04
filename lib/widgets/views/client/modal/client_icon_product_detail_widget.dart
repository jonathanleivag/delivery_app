import 'package:delivery_app/widgets/widgets.dart'
    show ClientButtonDeleteProductWidget;
import 'package:flutter/material.dart'
    show
        AssetImage,
        BuildContext,
        Colors,
        Container,
        EdgeInsets,
        Image,
        Key,
        Row,
        SizedBox,
        Spacer,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

class ClientIconProductDetailWidget extends StatelessWidget {
  const ClientIconProductDetailWidget({
    Key? key,
    this.isUpdate,
  }) : super(key: key);

  final bool? isUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 18, bottom: 25),
      child: Row(
        children: [
          Row(
            children: const [
              Image(
                image: AssetImage('assets/img/delivery.png'),
                height: 17,
              ),
              SizedBox(width: 10),
              Text(
                'Envio estandar',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const Spacer(),
          isUpdate != null && !isUpdate!
              ? Container()
              : const ClientButtonDeleteProductWidget(),
        ],
      ),
    );
  }
}
