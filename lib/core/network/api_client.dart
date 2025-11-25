import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseLink = "https://www.pqstec.com/InvoiceApps/Values/";
  final String imageBaseLink = "https://www.pqstec.com/InvoiceApps/";

  Future get(String endpoint) async {
    final url = Uri.parse(baseLink + endpoint);

    final response = await http
        .get(url)
        .timeout(Duration(seconds: 15));

    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    final status = response.statusCode;

    if (status >= 200 && status < 300) {
      if (response.body.isEmpty) return null;
      return json.decode(response.body);
    }

    throw ApiException("Error: HTTP $status");
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}
