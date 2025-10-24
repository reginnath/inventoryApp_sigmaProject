import 'dart:io';

class NewInventoryItem {
  final String itemId;
  final String itemName;
  final String itemCategory;
  final String description;
  final String supplierId;
  final String storageId;
  final File? image;

  NewInventoryItem({
    required this.itemId,
    required this.itemName,
    required this.itemCategory,
    required this.description,
    required this.supplierId,
    required this.storageId,
    this.image,
  });

  bool get hasRequiredFields =>
      itemId.isNotEmpty &&
      itemName.isNotEmpty &&
      itemCategory.isNotEmpty &&
      supplierId.isNotEmpty &&
      storageId.isNotEmpty;
}