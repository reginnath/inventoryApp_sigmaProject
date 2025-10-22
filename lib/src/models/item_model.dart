class Item {
  final String id;
  final String name;
  final String category;
  final int quantity;
  final String description;
  final double priceBuy;
  final double priceSell;
  final DateTime? expiryDate;
  final String supplierId;
  final String warehouseId;

  Item({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.description,
    required this.priceBuy,
    required this.priceSell,
    this.expiryDate,
    required this.supplierId,
    required this.warehouseId,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'quantity': quantity,
      'description': description,
      'priceBuy': priceBuy,
      'priceSell': priceSell,
      'expiryDate': expiryDate?.millisecondsSinceEpoch,
      'supplierId': supplierId,
      'warehouseId': warehouseId,
    };
  }

  factory Item.fromMap(String id, Map<String, dynamic> map) {
    return Item(
      id: id,
      name: map['name'],
      category: map['category'],
      quantity: map['quantity'],
      description: map['description'],
      priceBuy: map['priceBuy'],
      priceSell: map['priceSell'],
      expiryDate: map['expiryDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['expiryDate'])
          : null,
      supplierId: map['supplierId'],
      warehouseId: map['warehouseId'],
    );
  }
}
