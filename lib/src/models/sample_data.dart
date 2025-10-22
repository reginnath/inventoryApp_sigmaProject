import 'stock_item.dart';
import 'user_model.dart';

class SampleDataService {
  final List<StockItem> items;
  final List<UserModel> users;

  SampleDataService({required this.items, required this.users});

  factory SampleDataService.sample() {
    final items = [
      StockItem(id: 'i1', name: 'Beras 5kg', category: 'Makanan', quantity: 50),
      StockItem(id: 'i2', name: 'Garam', category: 'Bumbu', quantity: 20),
      StockItem(id: 'i3', name: 'Minyak Goreng', category: 'Makanan', quantity: 5, expiry: DateTime.now().add(Duration(days: 10))),
      StockItem(id: 'i4', name: 'Kompor', category: 'Peralatan Masak', quantity: 2),
    ];

    final users = [
      UserModel(id: 'u1', name: 'Owner', role: UserRole.owner),
      UserModel(id: 'u2', name: 'Admin', role: UserRole.admin),
      UserModel(id: 'u3', name: 'Gudang', role: UserRole.staff),
    ];

    return SampleDataService(items: items, users: users);
  }

  Map<String, int> categoryDistributionPercent() {
    final totals = <String, int>{};
    int sum = 0;
    for (var it in items) {
      totals[it.category] = (totals[it.category] ?? 0) + it.quantity;
      sum += it.quantity;
    }

    final percent = <String, int>{};
    if (sum == 0) return percent;
    totals.forEach((k, v) {
      percent[k] = ((v / sum) * 100).round();
    });
    return percent;
  }

  List<StockItem> lowStock(int threshold) {
    return items.where((i) => i.quantity <= threshold).toList();
  }

  List<StockItem> expiringWithinDays(int days) {
    final now = DateTime.now();
    return items.where((i) => i.expiry != null && i.expiry!.difference(now).inDays <= days).toList();
  }
}
