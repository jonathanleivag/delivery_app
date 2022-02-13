import 'package:delivery_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LocalOrderListStateWidget extends StatelessWidget implements PreferredSizeWidget {
  const LocalOrderListStateWidget({
    Key? key,
    required this.states,
  }) : super(key: key);

  final List<Map<String, String>> states;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: LocalTabBarProductListWidget(
            states: states,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
