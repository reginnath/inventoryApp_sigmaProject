import 'package:flutter/material.dart';

class DonutChart extends StatelessWidget {
  final Map<String, int> data;
  const DonutChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return const SizedBox(height: 80, child: Center(child: Text('No data')));

    return SizedBox(
      height: 120,
      child: Row(
        children: [
          // simple colored boxes as legend instead of real chart for now
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: data.entries.map((e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Container(width: 12, height: 12, color: Colors.primaries[data.keys.toList().indexOf(e.key) % Colors.primaries.length]),
                    const SizedBox(width: 8),
                    Text('${e.key} — ${e.value}%'),
                  ],
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
