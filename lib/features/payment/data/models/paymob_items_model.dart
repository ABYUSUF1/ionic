class PaymobItemsModel {
  String? name;
  String? amount;
  String? description;
  String? quantity;

  PaymobItemsModel({
    this.name = 'NA',
    this.amount = 'NA',
    this.description = 'NA',
    this.quantity = 'NA',
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'description': description,
      'quantity': quantity,
    };
  }
}
