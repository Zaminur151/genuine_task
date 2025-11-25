import 'package:genuine_task/feature/auth/domain/entities/user.dart';
import 'package:genuine_task/feature/auth/domain/use_case/login.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;

  AuthController(this.loginUseCase);

  var isLoading = false.obs;
  var user = Rxn<User>();

  Future login(String username, String password, int comId) async {
    try {
      isLoading(true);
      final res = await loginUseCase(username, password, comId);
      user.value = res;
      Get.offAllNamed('/customers');
      Get.snackbar('Success', 'Logged in as ${res.email}');
    } catch (e) {
      final message = _parseError(e);
      Get.snackbar('Login failed', message, snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  String _parseError(dynamic e) {
    if (e is Exception) return e.toString();
    return 'Unknown error';
  }
}
