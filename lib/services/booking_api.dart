import 'dart:convert';

import 'package:iclean_flutter/models/bookings.dart';
import 'package:http/http.dart' as http;
import '../constant/url_constants.dart';

class BookingApi {
  static Future<List<Booking>> fetchBookingByStatus(int status) async {
    final url = '${UrlConstant.JOB_EMPLOYEE}?jobId=$status';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
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
          description: e['description'] ?? '',
          jobName: e['jobName'] ?? '',
          jobImage: '');
    }).toList();
    return bookings;
  }
}
