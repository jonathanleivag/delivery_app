import 'dart:convert' show json;

import 'package:delivery_app/models/user_response_model.dart' show Data;
import 'package:delivery_app/providers/providers.dart' show ProfileProvider;
import 'package:delivery_app/validators/validators.dart'
    show InputRegisterValidator;
import 'package:delivery_app/widgets/widgets.dart' show TextFieldWidget;
import 'package:flutter/material.dart'
    show
        AutovalidateMode,
        BuildContext,
        Column,
        Container,
        EdgeInsets,
        Form,
        FutureBuilder,
        Icons,
        Key,
        SizedBox,
        StatelessWidget,
        TextInputType,
        Widget;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormEditUserView extends StatelessWidget {
  const FormEditUserView({
    Key? key,
    required this.profileProvider,
  }) : super(key: key);

  final ProfileProvider profileProvider;

  @override
  Widget build(BuildContext context) {
    SizedBox _space() => const SizedBox(height: 10);
    final maskFormatter = MaskTextInputFormatter(
        mask: '+## (#) #### ####', filter: {"#": RegExp(r'[0-9]')});

    return Container(
      margin: const EdgeInsets.only(top: 25),
      width: double.infinity,
      child: FutureBuilder(
        builder: (context, snapshot) {
          Widget data = Container();
          if (!snapshot.hasData) {
            data = Container();
          }

          if (snapshot.data != null) {
            final Data user = Data.fromJson(json.encode(snapshot.data));

            data = Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: profileProvider.formKey,
              child: Column(
                children: [
                  _space(),
                  TextFieldWidget(
                    hintText: 'email@email.cl',
                    icon: Icons.email,
                    initialValue: user.email,
                    name: 'email',
                    validator: InputRegisterValidator.emailValidator,
                    provider: profileProvider,
                    keyboardType: TextInputType.emailAddress,
                    labelText: 'Correo Electronico',
                  ),
                  _space(),
                  TextFieldWidget(
                    hintText: 'Jonathan',
                    icon: Icons.person,
                    name: 'name',
                    provider: profileProvider,
                    validator: InputRegisterValidator.nameValidator,
                    initialValue: user.name,
                    labelText: 'Nombre',
                  ),
                  _space(),
                  TextFieldWidget(
                    hintText: 'Leiva Gómez',
                    icon: Icons.person_outline,
                    name: 'lastName',
                    provider: profileProvider,
                    validator: InputRegisterValidator.lastNameValidator,
                    initialValue: user.lastName,
                    labelText: 'Apellido',
                  ),
                  _space(),
                  TextFieldWidget(
                    hintText: '+56955555555',
                    initialValue: user.phone,
                    icon: Icons.phone,
                    inputFormatters: [maskFormatter],
                    validator: InputRegisterValidator.phoneValidator,
                    keyboardType: TextInputType.phone,
                    provider: profileProvider,
                    name: 'phone',
                    labelText: 'Telefono',
                  ),
                ],
              ),
            );
          }
          return data;
        },
        future: profileProvider.userFormData(),
      ),
    );
  }
}
