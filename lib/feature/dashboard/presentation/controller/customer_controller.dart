import 'package:genuine_task/feature/auth/presentation/controller/auth_controller.dart';
import 'package:genuine_task/feature/dashboard/domain/use_case/customer_list.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  final GetCustomersPaginatedUseCase getCustomersUseCase;

  CustomerController(this.getCustomersUseCase);
  
  final AuthController userController = Get.find();
  var customers = [].obs;
  var pageNo = 1.obs;
  final int pageSize = 20;
  var isLoading = false.obs;
  var hasMore = true.obs;
  var search = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchFirst();
  }

  Future fetchFirst() async {
    pageNo(1);
    customers.clear();
    hasMore(true);
    await _fetch();
  }

  Future fetchNext() async {
    if (isLoading.value || !hasMore.value) return;
    pageNo.value += 1;
    await _fetch();
  }

  Future _fetch() async {
    try {
      isLoading(true);
      final res = await getCustomersUseCase.call(
        pageNo: pageNo.value,
        pageSize: pageSize,
        token: userController.user.value!.token
      );
      if (res.length < pageSize) hasMore(false);
      customers.addAll(res);
    } catch (e) {
      Get.snackbar('Error', _parseError(e),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  String _parseError(dynamic e) {
    if (e is Exception) return e.toString();
    return 'Unknown error';
  }
}