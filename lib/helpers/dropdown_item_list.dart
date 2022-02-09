import 'package:delivery_app/models/models.dart' show PayerCost;

class DropdownItemList {
  DropdownItemList({required List<PayerCost> payerCosts}) {
    this.payerCosts.addAll(payerCosts);
  }
  final List<PayerCost> payerCosts = [];

  List<dynamic> listCost() {
    List cost = [];
    for (var i = 0; i < payerCosts.length; i++) {
      cost.add({
        'label': payerCosts[i].recommendedMessage,
        'value': payerCosts[i].installments.toString()
      });
    }
    return cost;
  }
}
