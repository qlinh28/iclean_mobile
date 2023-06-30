import 'dart:convert';

import 'package:iclean_flutter/dto/order_dto.dart';
import 'package:iclean_flutter/models/bookings.dart';
import 'package:http/http.dart' as http;
import '../constant/url_constants.dart';
import '../models/account.dart';
import '../screens/common/user_preferences.dart';

class BookingApi {
  static Future<List<Booking>> fetchBookingByStatus(int status) async {
    String url = "";
    Account? account = await UserPreferences.getUserInfomation();
    int? id = account?.id;
    String? role = account!.role;
    if (role == 'user') {
      url = '${UrlConstant.ORDER}?userId=$id&status=$status';
    } else {
      url = '${UrlConstant.ORDER}?employeeId=$id&status=$status';
    }
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = utf8.decode(response.bodyBytes);
    final json = jsonDecode(body);
    final users = json['data'] as List<dynamic>;
    final bookings = users.map((e) {
      return Booking(
          id: e['id'] ?? 0,
          userId: e['userId'] ?? 0,
          empId: e['empId'] ?? 0,
          jobId: e['jobId'] ?? 0,
          workTime: e['workTime'],
          price: e['price'] ?? 0,
          username: e['username'] ?? '',
          empName: e['empName'] ?? '',
          status: e['status'] ?? '',
          location: e['location'] ?? '',
          imgRenter: e['imgRenter'] ?? '',
          imgEmployee: e['imgEmployee'] ?? '',
          timestamp: DateTime.parse(e['timestamp']),
          longitude: e['longitude'] ?? 0,
          latitude: e['latitude'] ?? 0,
          description: e['description'] ?? '',
          jobName: e['jobName'] ?? '',
          jobImage: '');
    }).toList();
    return bookings;
  }

  static Future<int> createBooking(OrderDto order) async {
    const url = UrlConstant.ORDER;
    Account? account = await UserPreferences.getUserInfomation();
    int? id = account?.id;
    order.renterId = id!;
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "workDate": order.workDateTime.toIso8601String(),
          "orderDate": order.orderDate.toIso8601String(),
          "workTime": order.workingHour,
          "renterId": order.renterId,
          "employeeId": order.employeeId,
          "jobId": order.jobId
        }));
    return response.statusCode;
  }

  static Future<int> updateBookingByStatus(int orderId, int status) async {
    const url = '${UrlConstant.ORDER}/status';
    final uri = Uri.parse(url);
    final response = await http.put(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"order_id": orderId, "status_id": status}));
    return response.statusCode;
  }
}
