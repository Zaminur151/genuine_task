abstract class CustomerRepository {
  Future<List> getCustomers({
    required int pageNo,
    required int pageSize,
    required String token,
  });
}