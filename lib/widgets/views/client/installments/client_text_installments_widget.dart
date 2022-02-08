import 'package:flutter/material.dart'
    show
        BuildContext,
        Container,
        EdgeInsets,
        FontWeight,
        Key,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;

class ClientTextInstallmentsWidget extends StatelessWidget {
  const ClientTextInstallmentsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: const Text(
        '¿Cuántas cuotas deseas pagar?',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
