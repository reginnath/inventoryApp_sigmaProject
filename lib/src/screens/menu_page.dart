import 'package:flutter/material.dart';
import '../models/sample_data.dart';
import '../widgets/icon_tile.dart';
import 'storage_page.dart';

class MenuPage extends StatelessWidget {
  final SampleDataService data;

  const MenuPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final tiles = [
      _MenuTile(icon: Icons.people, label: 'Supplier'),
      _MenuTile(icon: Icons.store, label: 'Storage'),
      _MenuTile(icon: Icons.add_box, label: 'New Inventory'),
      _MenuTile(icon: Icons.add, label: 'Add Stock'),
      _MenuTile(icon: Icons.outbox, label: 'Barang Keluar'),
      _MenuTile(icon: Icons.upload, label: 'Report'),
      _MenuTile(icon: Icons.admin_panel_settings, label: 'Roles'),
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: tiles.map((t) {
          if (t.label == 'Storage') {
            return IconTile(
              icon: t.icon,
              label: t.label,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => StoragePage(data: data),
                ));
              },
            );
          }
          return IconTile(icon: t.icon, label: t.label);
        }).toList(),
      ),
    );
  }
}

class _MenuTile {
  final IconData icon;
  final String label;
  _MenuTile({required this.icon, required this.label});
}
