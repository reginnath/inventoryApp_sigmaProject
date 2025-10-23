import 'package:flutter/material.dart';
import '../models/sample_data.dart';
import '../models/supplier_label_model.dart';
import '../widgets/supplier_table.dart';

class SupplierListPage extends StatefulWidget {
  final SampleDataService data;
  final SupplierLabel label;
  const SupplierListPage({super.key, required this.data, required this.label});

  @override
  State<SupplierListPage> createState() => _SupplierListPageState();
}

class _SupplierListPageState extends State<SupplierListPage> {
  void _showAddSupplierDialog() async {
    final name = TextEditingController();
    final address = TextEditingController();
    final contact = TextEditingController();
    final website = TextEditingController();

    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add supplier'),
        content: SingleChildScrollView(
          child: Column(children: [
            TextField(controller: name, decoration: const InputDecoration(labelText: 'Name')),
            TextField(controller: address, decoration: const InputDecoration(labelText: 'Address')),
            TextField(controller: contact, decoration: const InputDecoration(labelText: 'Contact')),
            TextField(controller: website, decoration: const InputDecoration(labelText: 'Website')),
          ]),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('cancel')),
          ElevatedButton(onPressed: () {
            final n = name.text.trim();
            if (n.isNotEmpty) {
              widget.data.addSupplier(name: n, address: address.text.trim().isEmpty ? null : address.text.trim(), contact: contact.text.trim().isEmpty ? null : contact.text.trim(), website: website.text.trim().isEmpty ? null : website.text.trim(), labelId: widget.label.id);
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
    final suppliers = widget.data.getSuppliersByLabel(widget.label.id);

    return Scaffold(
      appBar: AppBar(title: Text('Supplier > ${widget.label.name}')),
      body: suppliers.isEmpty
          ? const Center(child: Text('there is no supplier data yet'))
          : Padding(padding: const EdgeInsets.all(12.0), child: SupplierTable(suppliers: suppliers)),
      floatingActionButton: FloatingActionButton(onPressed: _showAddSupplierDialog, child: const Icon(Icons.add)),
    );
  }
}
