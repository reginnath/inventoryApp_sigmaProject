import 'package:flutter/material.dart';
import '../models/storage_model.dart';

class StorageCard extends StatelessWidget {
  final StorageModel storage;
  final VoidCallback onTap;

  const StorageCard({super.key, required this.storage, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(storage.name, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(storage.id, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}