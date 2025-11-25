import 'package:genuine_task/feature/dashboard/data/data_sources/customer_remote_data_source.dart';
import 'package:genuine_task/feature/dashboard/domain/repository/customer_list_ripository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerRemoteDataSource remote;

  CustomerRepositoryImpl(this.remote);

  @override
  Future<List> getCustomers({
    required int pageNo,
    required int pageSize,
    required String token,
  }) async {
    return await remote.getCustomers(pageNo, pageSize, token);
  }
}
