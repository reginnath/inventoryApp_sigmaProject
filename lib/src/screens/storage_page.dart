import 'package:flutter/material.dart';
import '../models/sample_data.dart';
import '../widgets/storage_card.dart';
import 'storage_items_page.dart';

class StoragePage extends StatefulWidget {
  final SampleDataService data;
  const StoragePage({super.key, required this.data});

  @override
  State<StoragePage> createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  void _showAddStorageDialog() async {
    final controller = TextEditingController();
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add New Storage'),
        content: TextField(controller: controller, decoration: const InputDecoration(hintText: 'Storage name')),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('cancel')),
          ElevatedButton(onPressed: () {
            final text = controller.text.trim();
            if (text.isNotEmpty) {
              widget.data.addStorage(text);
              Navigator.of(context).pop(true);
            }
          }, child: const Text('save'))
        ],
      ),
    );

    if (result == true) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final storages = widget.data.getStorages();

    return Scaffold(
      appBar: AppBar(title: const Text('Storage')),
      body: storages.isEmpty
          ? const Center(child: Text('there is no storage yet'))
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: storages.map((storage) => StorageCard(
                  storage: storage,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => StorageItemsPage(data: widget.data, storage: storage),
                    ));
                  },
                )).toList(),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddStorageDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}