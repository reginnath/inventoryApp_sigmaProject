import 'package:flutter/material.dart';
import '../models/stock_item.dart';

class StockListCard extends StatelessWidget {
  final String title;
  final List<StockItem> items;

  const StockListCard({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text('View all')),
              ],
            ),
            const SizedBox(height: 8),
            ...items.map((i) => ListTile(
              title: Text(i.name),
              subtitle: Text('Qty: ${i.quantity} • Cat: ${i.category}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                showDialog(context: context, builder: (_) => AlertDialog(title: Text(i.name), content: Text('Qty: ${i.quantity}\nCategory: ${i.category}'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))]));
              },
            ))
          ],
        ),
      ),
    );
  }
}
