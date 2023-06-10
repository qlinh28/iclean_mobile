import 'dart:convert';

import 'package:iclean_flutter/models/profile.dart';
import 'package:http/http.dart' as http;
import '../constant/url_constants.dart';

class WorkerAPI {
  static Future<List<Profile>> fetchProfileByService(int serviceId) async {
    final url = '${UrlConstant.JOB_EMPLOYEE}?jobId=$serviceId';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = utf8.decode(response.bodyBytes);
    final json = jsonDecode(body);
    final users = json['data'] as List<dynamic>;
    final profiles = users.map((e) {
      double priceInt = e['price'];
      return Profile(
        employeeId: e['employeeId'],
        jobId: e['jobId'],
        employeeName: e['employeeName'],
        srcPicture: e['srcPicture'] ?? "",
        description: e['description'],
        countRate: e['countRate'] ?? 0,
        averageRate: e['averageRate'],
        jobName: e['jobName'],
        location: e['location'] ?? "",
        price: priceInt.toInt(),
      );
    }).toList();
    return profiles;
  }
}
