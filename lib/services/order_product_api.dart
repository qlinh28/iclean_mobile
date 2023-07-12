import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iclean_flutter/dto/order_product_dto.dart';
import '../constant/url_constants.dart';
import '../models/order_product.dart';
import '../models/product.dart';

class OrderProductApi {
  static Future<List<OrderProduct>> fetchOrderProduct(
      int id, String category, int status) async {
    String url = "";
    if (status == -1 && category.isEmpty) {
      url = '${UrlConstant.ORDER_PRODUCT}?userId=$id';
    } else if (status != -1 && category.isEmpty) {
      url = '${UrlConstant.ORDER_PRODUCT}?userId=$id&status=$status';
    } else if (status != -1 && category.isNotEmpty) {
      url =
          '${UrlConstant.ORDER_PRODUCT}?userId=$id&status=$status&category=$category';
    }
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = utf8.decode(response.bodyBytes);
    final json = jsonDecode(body);
    final users = json['data'] as List<dynamic>;
    final bookings = users.map((e) {
      return OrderProduct(
          orderId: e['orderId'] ?? 0,
          userId: e['userId'] ?? 0,
          orderDate: DateTime.parse(e['orderDate']),
          totalAmount: e['totalAmount'] ?? 0,
          orderStatus: e['orderStatus'] ?? 0,
          address: e['address'] ?? '',
          products: (e['products'] as List<dynamic>)
              .map((product) => Product.fromJson(product))
              .toList());
    }).toList();
    return bookings;
  }

  static Future<int> createBooking(OrderProductDto orderProductDto) async {
    const url = UrlConstant.ORDER_PRODUCT;
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "userId": orderProductDto.userId,
          "orderProducts": orderProductDto.orderProducts
              .map((product) => product.toJson())
              .toList(),
        }));
    return response.statusCode;
  }
}
