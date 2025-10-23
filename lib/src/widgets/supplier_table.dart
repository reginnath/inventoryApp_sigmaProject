import 'package:flutter/material.dart';
import '../models/supplier_model.dart';

class SupplierTable extends StatelessWidget {
  final List<SupplierModel> suppliers;
  const SupplierTable({super.key, required this.suppliers});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(columns: const [
        DataColumn(label: Text('ID')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Address')),
        DataColumn(label: Text('Contact')),
        DataColumn(label: Text('Website')),
      ], rows: suppliers.map((s) => DataRow(cells: [
        DataCell(Text(s.id)),
        DataCell(Text(s.name)),
        DataCell(Text(s.address ?? '-')),
        DataCell(Text(s.contact ?? '-')),
        DataCell(Text(s.website ?? '-')),
      ])).toList()),
    );
  }
}
