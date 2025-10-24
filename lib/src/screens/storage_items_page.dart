import 'package:flutter/material.dart';
import '../models/sample_data.dart';
import '../models/storage_model.dart';
import '../widgets/storage_items_table.dart';

class StorageItemsPage extends StatefulWidget {
  final SampleDataService data;
  final StorageModel storage;

  const StorageItemsPage({super.key, required this.data, required this.storage});

  @override
  State<StorageItemsPage> createState() => _StorageItemsPageState();
}

class _StorageItemsPageState extends State<StorageItemsPage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Text('Storage > ${widget.storage.name}'),
        ),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search items...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          // Items table
          Expanded(
            child: widget.storage.items.isEmpty
                ? Center(child: Text('there is no data in ${widget.storage.name} yet'))
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: StorageItemsTable(items: widget.storage.items, searchQuery: _searchQuery),
                  ),
          ),
        ],
      ),
      // Read-only view: adding items and adjusting stock is available in the dedicated Add menus.
    );
  }

  // No add-item dialog here: this page is read-only (add via Add Stock / New Inventory menus)
}