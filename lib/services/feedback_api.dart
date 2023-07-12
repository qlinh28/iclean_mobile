import 'dart:convert';

import 'package:iclean_flutter/models/feedback.dart';
import 'package:http/http.dart' as http;
import '../constant/url_constants.dart';

class FeedbackAPI {
  static Future<List<FeedbackOrder>> fetchFeedback(
      int serviceId, int employeeId, int rate) async {
    final url =
        '${UrlConstant.FEEDBACK}/feedback?job_id=$serviceId&employee_id=$employeeId&rate=${rate != 10 ? rate : ""}';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = utf8.decode(response.bodyBytes);
    final json = jsonDecode(body);
    final users = json['data'] as List<dynamic>;
    final feedbacks = users.map((e) {
      double rate = e['rate'];
      return FeedbackOrder(
        id: e['orderId'],
        rate: rate.toInt(),
        employeeId: e['renterId'] ?? 0,
        detail: e['feedback'],
        profilePicture: e['renterImage'] ?? "",
        username: e['renterName'],
        timestamp: DateTime.parse(e['feedbackTime']),
      );
    }).toList();
    return feedbacks;
  }

  static Future<int> createFeedback(FeedbackOrder feedback) async {
    const url = '${UrlConstant.FEEDBACK}/feedback';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "orderId": feedback.id,
          "rate": feedback.rate,
          "feedback": feedback.detail,
          "feedbackTime": DateTime.now().toIso8601String()
        }));
    return response.statusCode;
  }
}
