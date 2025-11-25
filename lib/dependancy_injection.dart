import 'package:genuine_task/core/network/api_client.dart';
import 'package:genuine_task/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:genuine_task/feature/auth/data/repositories/auth_repo_impl.dart';
import 'package:genuine_task/feature/auth/domain/repository/auth_repository.dart';
import 'package:genuine_task/feature/auth/domain/use_case/login.dart';
import 'package:genuine_task/feature/auth/presentation/controller/auth_controller.dart';
import 'package:get/get.dart';

Future init() async {
  Get.put(ApiClient());

  Get.lazyPut(() => AuthRemoteDataSource(Get.find()));
  Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find()));
  Get.lazyPut(() => LoginUseCase(Get.find()));
  Get.lazyPut(() => AuthController(Get.find()));


}