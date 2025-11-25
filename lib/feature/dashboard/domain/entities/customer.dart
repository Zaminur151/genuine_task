class Customer {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String? imagePath;
  final double totalDue;

  Customer({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.imagePath,
    required this.totalDue,
  });
}
