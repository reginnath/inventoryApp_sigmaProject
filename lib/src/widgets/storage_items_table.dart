import 'package:flutter/material.dart';
import '../models/storage_model.dart';

class StorageItemsTable extends StatelessWidget {
  final List<StorageItemInfo> items;
  final String? searchQuery;

  const StorageItemsTable({super.key, required this.items, this.searchQuery});

  @override
  Widget build(BuildContext context) {
    // Filter items if search query is provided
    final filteredItems = searchQuery?.isNotEmpty == true
        ? items.where((item) => item.itemName.toLowerCase().contains(searchQuery!.toLowerCase())).toList()
        : items;

    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Item Name')),
          DataColumn(label: Text('Quantity')),
          DataColumn(label: Text('Expiry Date')),
        ],
        rows: filteredItems
            .map((item) => DataRow(cells: [
                  DataCell(Text(item.itemName)),
                  DataCell(Text(item.quantity.toString())),
                  DataCell(Text(item.expiryDate?.toString().split(' ')[0] ?? '-')),
                ]))
            .toList(),
      ),
    );
  }
}