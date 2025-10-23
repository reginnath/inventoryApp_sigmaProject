import 'package:flutter/material.dart';
import '../models/sample_data.dart';
import '../widgets/label_card.dart';
import 'supplier_list_page.dart';

class SupplierLabelsPage extends StatefulWidget {
  final SampleDataService data;
  const SupplierLabelsPage({super.key, required this.data});

  @override
  State<SupplierLabelsPage> createState() => _SupplierLabelsPageState();
}

class _SupplierLabelsPageState extends State<SupplierLabelsPage> {
  void _showAddLabelDialog() async {
    final controller = TextEditingController();
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add new label'),
        content: TextField(controller: controller, decoration: const InputDecoration(hintText: 'Label name')),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('cancel')),
          ElevatedButton(onPressed: () {
            final text = controller.text.trim();
            if (text.isNotEmpty) {
              widget.data.addLabel(text);
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
    final labels = widget.data.getLabels();

    return Scaffold(
      appBar: AppBar(title: const Text('Supplier')),
      body: labels.isEmpty
          ? const Center(child: Text('there is no label yet'))
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Wrap(spacing: 8, runSpacing: 8, children: labels.map((l) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => SupplierListPage(data: widget.data, label: l)));
                },
                child: LabelCard(label: l),
              )).toList()),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddLabelDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
