import 'dart:convert';

import 'package:http/http.dart' as http;
import '../constant/url_constants.dart';

class AccountApi {
  static Future<int> createAccount(
      String username,
      String password,
      String fullname,
      String dateOfBirth,
      String gender,
      String phone,
      String email) async {
    const url = '${UrlConstant.AUTH}/sign-up';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "username": username,
          "password": password,
          "fullname": fullname,
          "dateOfBirth": dateOfBirth,
          "gender": gender,
          "phone": phone,
          "email": email
        }));
    return response.statusCode;
  }
}
