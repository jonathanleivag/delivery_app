import 'package:flutter/material.dart'
    show
        BuildContext,
        Container,
        EdgeInsets,
        Key,
        MediaQuery,
        StatelessWidget,
        BoxFit,
        Widget;
import 'package:lottie/lottie.dart' show Lottie;

class HeroLoginWidget extends StatelessWidget {
  const HeroLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 150,
        bottom: MediaQuery.of(context).size.height * 0.05,
      ),
      child: Lottie.asset(
        'assets/json/delivery.json',
        width: 350,
        height: 200,
        fit: BoxFit.fill,
      ),
    );
  }
}
