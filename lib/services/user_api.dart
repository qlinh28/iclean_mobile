import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constant/url_constants.dart';
import '../models/account.dart';
import '../screens/common/user_preferences.dart';

class UserApi {
  static Future<int> fetchMoneyByUserId() async {
    Account? account = await UserPreferences.getUserInfomation();
    int? id = account?.id;
    final url = '${UrlConstant.USER}/money?userId=$id';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = utf8.decode(response.bodyBytes);
    final json = jsonDecode(body);
    final data = json['data'];
    final money = data['money'] as double;
    return money.toInt();
  }

  static Future<int> updateMoneyByUserId(int newMoney) async {
    const url = '${UrlConstant.USER}/money';
    Account? account = await UserPreferences.getUserInfomation();
    int? id = account?.id;
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"userId": id, "newMoney": newMoney}));
    return response.statusCode;
  }
}
