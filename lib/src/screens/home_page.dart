import 'package:flutter/material.dart';
import '../models/sample_data.dart';
import '../widgets/donut_chart.dart';
import '../widgets/stock_list_card.dart';

class HomePage extends StatelessWidget {
  final SampleDataService data;

  const HomePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final dist = data.categoryDistributionPercent();
    final low = data.lowStock(5);
    final soon = data.expiringWithinDays(14);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(child: Icon(Icons.person)),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
                label: const Text('Notifications'),
              )
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Stock Distribution', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  DonutChart(data: dist),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          StockListCard(title: 'Low in Stock', items: low),
          const SizedBox(height: 12),
          StockListCard(title: 'Soon To Expire', items: soon),
        ],
      ),
    );
  }
}
