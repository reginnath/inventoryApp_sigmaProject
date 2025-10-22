class StockItem {
  final String id;
  final String name;
  final String category;
  int quantity;
  DateTime? expiry;

  StockItem({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    this.expiry,
  });
}
