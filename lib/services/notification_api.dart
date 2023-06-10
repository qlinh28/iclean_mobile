import 'dart:convert';

import 'package:iclean_flutter/models/account.dart';
import 'package:iclean_flutter/models/noti.dart';
import 'package:http/http.dart' as http;
import 'package:iclean_flutter/screens/common/user_preferences.dart';
import '../constant/url_constants.dart';

class NotificaitonAPI {
  static Future<List<Noti>> fetchNotification() async {
    try {
      Account? account = await UserPreferences.getUserInfomation();
      final userId = account?.id;
      final url = '${UrlConstant.NOTIFICATION}?userId=$userId';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = utf8.decode(response.bodyBytes);
      final json = jsonDecode(body);
      final users = json['data'] as List<dynamic>;
      final notifications = users.map((e) {
        int deleted = e['isDelete'];
        int read = e['isRead'];
        return Noti(
          id: e['notificationId'],
          details: e['detail'],
          status: e['status'] ?? "done",
          timestamp: DateTime.parse(e['timestamp']),
          deleted: deleted == 1 ? true : false,
          read: read == 1 ? true : false,
        );
      }).toList();
      return notifications;
    } catch (e) {
      return List<Noti>.empty();
    }
  }
}
