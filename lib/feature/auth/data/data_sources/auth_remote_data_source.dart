import '../../../../core/network/api_client.dart';

class AuthRemoteDataSource {
  final ApiClient client;

  AuthRemoteDataSource(this.client);

  Future<Map<String, dynamic>> login(String username,String password,int comId,) async {
    final endpoint = 'LogIn?UserName=$username&Password=$password&ComId=$comId';

    final res = await client.get(endpoint);
    if (res == null) throw AuthException('Empty response');
    if (res is List && res.isEmpty) throw AuthException('Invalid credentials');
    if (res is List) {
      return Map<String, dynamic>.from(res.first);
    }

    return Map<String, dynamic>.from(res);
  }
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}
