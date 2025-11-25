import 'package:genuine_task/feature/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future call(String username, String password, int comId) async {
    return await repository.login(username, password, comId);
  }
}
