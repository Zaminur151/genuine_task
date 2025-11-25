import 'package:genuine_task/feature/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String email,
    required int comId,
    required String token,
    required String userName
  }) : super(
          userName: userName,
          email: email,
          comId: comId,
          token: token,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['UserName'] ?? '',
      email: json['email'] ?? '',
      comId: int.tryParse(json['ComId']?.toString() ?? '1') ?? 1,
      token: json['Token']?.toString() ?? '',
    );
  }
}
