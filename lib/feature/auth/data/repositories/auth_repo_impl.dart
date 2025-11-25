import 'package:genuine_task/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:genuine_task/feature/auth/domain/entities/user.dart';
import 'package:genuine_task/feature/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future login(String email, String password, int comId) async {
    final json = await remote.login(email, password, comId);

    final user = User(
      userName: json['UserName'],
      email: json['email'] ?? email,
      comId: comId,
      token: json['Token']?.toString() ?? '',
    );

    return user;
  }
}