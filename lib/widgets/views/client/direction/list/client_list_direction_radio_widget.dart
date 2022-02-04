import 'package:delivery_app/models/models.dart' show DataAddress;
import 'package:delivery_app/providers/providers.dart' show ShoppProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        CrossAxisAlignment,
        Divider,
        Expanded,
        FontWeight,
        Key,
        ListView,
        RadioListTile,
        State,
        StatefulWidget,
        Text,
        TextOverflow,
        TextStyle,
        Widget;
import 'package:provider/provider.dart' show Provider;

class ClientListDirectionRadioWidget extends StatefulWidget {
  const ClientListDirectionRadioWidget({Key? key, required this.directions})
      : super(key: key);
  final List<DataAddress> directions;

  @override
  State<ClientListDirectionRadioWidget> createState() =>
      _ClientListDirectionRadioWidgetState();
}

class _ClientListDirectionRadioWidgetState
    extends State<ClientListDirectionRadioWidget> {
  @override
  Widget build(BuildContext context) {
    final ShoppProvider _shoppProvider = Provider.of<ShoppProvider>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: widget.directions.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              RadioListTile<DataAddress>(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.directions[index].directionForm}, ${widget.directions[index].barrioForm}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.directions[index].direction ?? '',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                activeColor: ColorTheme.primaryColor,
                value: widget.directions[index],
                groupValue: _shoppProvider.fristAddress,
                onChanged: (DataAddress? value) {
                  setState(() {
                    _shoppProvider.fristAddress = value!;
                  });
                },
              ),
              const Divider(
                thickness: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
