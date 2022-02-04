import 'package:delivery_app/providers/providers.dart'
    show CategoryProvider, ProductProvider;
import 'package:delivery_app/theme/color_theme.dart' show ColorTheme;
import 'package:delivery_app/views/local_create_category_view.dart'
    show LocalCreateCategoryView;
import 'package:flutter/material.dart'
    show
        Alignment,
        AsyncSnapshot,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        CircularProgressIndicator,
        Colors,
        Container,
        EdgeInsets,
        FutureBuilder,
        Key,
        MediaQuery,
        Navigator,
        Size,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;
import 'package:cool_dropdown/cool_dropdown.dart' show CoolDropdown;
import 'package:provider/provider.dart' show Provider;
import 'package:rflutter_alert/rflutter_alert.dart'
    show Alert, AlertStyle, DialogButton;
import 'package:after_layout/after_layout.dart' show AfterLayoutMixin;

class SelectCategoryCreateProductWidget extends StatelessWidget {
  const SelectCategoryCreateProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final CategoryProvider _categoryProvider =
        Provider.of<CategoryProvider>(context);

    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorTheme.primaryOpacityColor,
      ),
      child: FutureBuilder(
        future: _categoryProvider.getCategories(),
        builder:
            (BuildContext context, AsyncSnapshot<Map<String, List>> snapshot) {
          Widget data = _progress(size);
          if (!snapshot.hasData) {
            data = _progress(size);
          }
          if (snapshot.data != null) {
            data = _ListCategories(
              size: size,
              dropdownItemList: snapshot.data!['categories']!,
            );
          }
          return data;
        },
      ),
    );
  }

  Container _progress(Size size) => Container(
        width: 40,
        height: 40,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.40, vertical: size.height * 0.010),
        child: CircularProgressIndicator(
          color: ColorTheme.primaryColor,
        ),
      );
}

class _ListCategories extends StatefulWidget {
  const _ListCategories({
    Key? key,
    required this.size,
    required this.dropdownItemList,
  }) : super(key: key);

  final List dropdownItemList;
  final Size size;

  @override
  State<_ListCategories> createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<_ListCategories>
    with AfterLayoutMixin<_ListCategories> {
  @override
  void afterFirstLayout(BuildContext context) {
    final CategoryProvider _categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    void categoryEmpty() {
      Alert(
        closeFunction: () {},
        closeIcon: null,
        context: context,
        title: "Se redigirá a la pantalla de creación de categorías",
        style: const AlertStyle(
          descStyle: TextStyle(fontSize: 14),
          descTextAlign: TextAlign.start,
        ),
        buttons: [
          DialogButton(
            child: const Text(
              "ir a crear categorías",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () async {
              Navigator.pop(context);
              Navigator.of(context)
                  .pushNamed(LocalCreateCategoryView.routerName);
            },
            color: ColorTheme.primaryColor,
            radius: BorderRadius.circular(50),
          ),
        ],
      ).show();
    }

    if (_categoryProvider.categories['categories']!.isEmpty) {
      categoryEmpty();
    } else {
      final ProductProvider _productProvider =
          Provider.of<ProductProvider>(context, listen: false);
      _productProvider.formData['category'] =
          _categoryProvider.categories['categories']![0]['value'];
      _productProvider.category =
          _categoryProvider.categories['categories']![0]['value'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.dropdownItemList.isNotEmpty
        ? CoolDropdown(
            defaultValue: widget.dropdownItemList[0],
            resultWidth: widget.size.width,
            dropdownWidth: widget.size.width * 0.75,
            dropdownList: widget.dropdownItemList,
            onChange: (values) {
              final ProductProvider _productProvider =
                  Provider.of<ProductProvider>(context, listen: false);
              _productProvider.formData['category'] = values['value'];
              _productProvider.category = values['value'];
            },
            placeholder: 'No tienes categorias',
            placeholderTS: TextStyle(
              color: ColorTheme.primaryColor,
              fontSize: 20,
            ),
            selectedItemTS: const TextStyle(color: Colors.white, fontSize: 20),
            selectedItemBD: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorTheme.primaryColor,
            ),
            resultAlign: Alignment.center,
            resultBD: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.transparent,
            ),
            resultTS: TextStyle(color: ColorTheme.primaryColor, fontSize: 20),
            resultPadding: const EdgeInsets.symmetric(horizontal: 25),
            dropdownBD: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          )
        : Container();
  }
}
