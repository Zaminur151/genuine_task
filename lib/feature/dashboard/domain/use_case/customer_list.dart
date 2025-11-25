import 'package:genuine_task/feature/dashboard/domain/repository/customer_list_ripository.dart';

class GetCustomersPaginatedUseCase {
  final CustomerRepository repository;

  GetCustomersPaginatedUseCase(this.repository);

  Future<List> call({required int pageNo,required int pageSize,required String token}) async {
    return await repository.getCustomers( pageNo: pageNo, pageSize: pageSize, token:token);
  }
}