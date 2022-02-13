import 'package:delivery_app/providers/providers.dart' show LocalShoppProvider;
import 'package:delivery_app/widgets/widgets.dart'
    show
        LocalOrderListCardWidget,
        LocalOrderListTabBarViewWidget,
        NoItemWidget,
        Progress;
import 'package:flutter/material.dart'
    show
        AsyncSnapshot,
        BuildContext,
        Colors,
        Column,
        Container,
        EdgeInsets,
        Expanded,
        FontWeight,
        FutureBuilder,
        Key,
        ListTile,
        ListView,
        StatelessWidget,
        TabBarView,
        Text,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;

class LocalOrderListTabBarViewWidget extends StatelessWidget {
  const LocalOrderListTabBarViewWidget({
    Key? key,
    required this.states,
  }) : super(key: key);

  final List<Map<String, String>> states;

  @override
  Widget build(BuildContext context) {
    final LocalShoppProvider _localShoppProvider =
        Provider.of<LocalShoppProvider>(context);
    return TabBarView(
      children: states.map((Map<String, String> state) {
        return FutureBuilder(
          future: _localShoppProvider.getLocalShopp(state: state['value']!),
          builder: (context, AsyncSnapshot<List<String>> snapshot) {
            Widget data = const Progress();

            if (!snapshot.hasData) data = const Progress();

            if (snapshot.data != null) {
              if (snapshot.data!.isEmpty) {
                data = NoItemWidget(
                    text: 'No hay pedidos en estado ${state['label']}');
              } else {
                data = Column(
                  children: [
                    _Title(
                      label: state['label']!,
                    ),
                    _Card(
                      data: snapshot.data!,
                    ),
                  ],
                );
              }
            }

            return data;
          },
        );
      }).toList(),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              'Code: ${data[index]}',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w100,
                color: Colors.grey[700],
              ),
            ),
            subtitle: LocalOrderListCardWidget(
              purchaseId: data[index],
            ),
          );
        },
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
        ),
        child: Text(
          'Pedidos en estado $label',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
