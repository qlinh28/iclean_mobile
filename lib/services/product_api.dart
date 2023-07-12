import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:iclean_flutter/models/product.dart';
import '../constant/url_constants.dart';

class ProductApi {
  static Future<List<Product>> fetchProductNotBuy(
      int userId, String search, String category) async {
    String id = '';
    if (userId != 0) {
      id = userId.toString();
    }
    final url =
        '${UrlConstant.PRODUCT}/not-buy?userId=$id&search=$search&category=$category';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = utf8.decode(response.bodyBytes);
    final json = jsonDecode(body);
    final datas = json['data'] as List<dynamic>;
    final products = datas.map((e) {
      return Product(
          productId: e['productId'] ?? 0,
          title: e['title'] ?? '',
          description: e['description'] ?? '',
          category: e['category'] ?? '',
          imgLink: e['imgLink'] ?? '',
          link: e['link'] ?? '',
          price: e['price'] ?? 0,
          createdAt: DateTime.parse(e['createdAt']),
          updatedAt: DateTime.parse(e['updatedAt']));
    }).toList();
    return products;
  }

  static Future<List<Product>> fetchProductVideoBought(int userId) async {
    final url =
        '${UrlConstant.PRODUCT}/video-bought?userId=$userId&category=video';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = utf8.decode(response.bodyBytes);
    final json = jsonDecode(body);
    final datas = json['data'] as List<dynamic>;
    final products = datas.map((e) {
      return Product(
          productId: e['productId'] ?? 0,
          title: e['title'] ?? '',
          description: e['description'] ?? '',
          category: e['category'] ?? '',
          imgLink: e['imgLink'] ?? '',
          link: e['link'] ?? '',
          price: e['price'] ?? 0,
          createdAt: DateTime.parse(e['createdAt']),
          updatedAt: DateTime.parse(e['updatedAt']));
    }).toList();
    return products;
  }

  static Future<List<Product>> fetchProductItem(
      String search, String category) async {
    final url =
        '${UrlConstant.PRODUCT}/items?search=$search&category=$category';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = utf8.decode(response.bodyBytes);
    final json = jsonDecode(body);
    final datas = json['data'] as List<dynamic>;
    final products = datas.map((e) {
      return Product(
          productId: e['productId'] ?? 0,
          title: e['title'] ?? '',
          description: e['description'] ?? '',
          category: e['category'] ?? '',
          imgLink: e['imgLink'] ?? '',
          link: e['link'] ?? '',
          price: e['price'] ?? 0,
          createdAt: DateTime.parse(e['createdAt']),
          updatedAt: DateTime.parse(e['updatedAt']));
    }).toList();
    return products;
  }
}
