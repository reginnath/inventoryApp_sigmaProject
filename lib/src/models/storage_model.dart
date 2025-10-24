class StorageModel {
  final String id;
  final String name;
  final List<StorageItemInfo> items;

  StorageModel({required this.id, required this.name, List<StorageItemInfo>? items})
      : items = items ?? [];
}

class StorageItemInfo {
  final String itemId;
  final String itemName;
  final int quantity;
  final DateTime? expiryDate;

  StorageItemInfo({
    required this.itemId,
    required this.itemName,
    required this.quantity,
    this.expiryDate,
  });
}