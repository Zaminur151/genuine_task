import 'package:genuine_task/feature/dashboard/domain/entities/customer.dart';

class CustomerModel extends Customer {
  CustomerModel({
    required int id,
    required String name,
    String? email,
    String? phone,
    String? imagePath,
    required double totalDue,
  }) : super(
          id: id,
          name: name,
          imagePath: imagePath,
          email: email,
          phone: phone,
          totalDue: totalDue,
        );

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json['Id'],
      name: json['Name'],
      imagePath: json['ImagePath'] ?? "",
      email: json['Email'],
      phone: json['Phone'],
      totalDue: (json['TotalDue'] ?? 0).toDouble(),
    );
  }
}
