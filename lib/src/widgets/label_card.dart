import 'package:flutter/material.dart';
import '../models/supplier_label_model.dart';

class LabelCard extends StatelessWidget {
  final SupplierLabel label;
  const LabelCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label.name, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(label.id, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
