class SupplierModel {
  final String id;
  final String name;
  final String? address;
  final String? contact;
  final String? website;
  final String labelId;

  SupplierModel({required this.id, required this.name, this.address, this.contact, this.website, required this.labelId});
}
