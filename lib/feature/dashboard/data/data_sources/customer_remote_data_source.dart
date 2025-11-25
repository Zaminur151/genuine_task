import 'package:genuine_task/feature/dashboard/data/model/customer_model.dart';

import '../../../../core/network/api_client.dart';

class CustomerRemoteDataSource {
  final ApiClient client;

  CustomerRemoteDataSource(this.client);

  Future<List<dynamic>> getCustomers(int pageNo, int pageSize, String token) async {
    final endpoint ='GetCustomerList?searchquery&pageNo=$pageNo&pageSize=$pageSize&SortyBy=Balance';
    final res = await client.get(endpoint,header: {"Authorization": token});
    
    if (res != null ){
      List<CustomerModel> customerList = (res['CustomerList'] as List)
          .map((json) => CustomerModel.fromJson(json))
          .toList();
      return customerList;
    }

    throw Exception('Invalid customer response');
  }
}
