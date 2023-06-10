import 'dart:convert';

import 'package:iclean_flutter/models/account.dart';
import 'package:http/http.dart' as http;
import 'package:iclean_flutter/screens/common/user_preferences.dart';
import '../constant/url_constants.dart';
import '../models/address.dart';

class AddressApi {
  static Future<List<Address>> fetchAddress() async {
    try {
      Account? account = await UserPreferences.getUserInfomation();
      int? id = account?.id;
      final url = '${UrlConstant.ADDRESS}/{addressId}?addressId=$id';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = utf8.decode(response.bodyBytes);
      final json = jsonDecode(body);
      final users = json['data'] as List<dynamic>;
      final addresses = users.map((e) {
        return Address(
            id: e['addressId'] ?? 0,
            userId: id ?? 0,
            addressName: e['locationName'] ?? 0,
            description: e['description'] ?? 0,
            isDefault: e['isDefault'] == 1 ? true : false,
            street: e['street'] ?? 0,
            longitude: e['longitude'],
            latitude: e['latitude']);
      }).toList();
      return addresses;
    } catch (e) {
      return List.empty();
    }
  }

  static Future<int> createAddress(Address address) async {
    const url = UrlConstant.ADDRESS;
    Account? account = await UserPreferences.getUserInfomation();
    int? id = account?.id;
    address.userId = id!;
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "addressId": address.id,
          "longitude": address.longitude,
          "latitude": address.latitude,
          "description": address.description,
          "timestamp": DateTime.now().toIso8601String(),
          "isDefault": address.isDefault ? 1 : 0,
          "userId": address.userId,
          "street": address.street,
          "locationName": address.addressName
        }));
    return response.statusCode;
  }

  static Future<int> updateAddress(Address address) async {
    const url = UrlConstant.ADDRESS;
    Account? account = await UserPreferences.getUserInfomation();
    int? id = account?.id;
    address.userId = id!;
    final uri = Uri.parse(url);
    final response = await http.put(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "addressId": address.id,
          "longitude": address.longitude,
          "latitude": address.latitude,
          "description": address.description,
          "timestamp": DateTime.now().toIso8601String(),
          "isDefault": address.isDefault ? 1 : 0,
          "userId": address.userId,
          "street": address.street,
          "locationName": address.addressName
        }));
    return response.statusCode;
  }

  static Future<int> deleteAddress(int addressId) async {
    final url = '${UrlConstant.ADDRESS}?addressId=$addressId';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    return response.statusCode;
  }

  static Address? getDefaultAddress(List<Address> addresses) {
    return addresses.firstWhere((address) => address.isDefault,
        orElse: () => null as Address);
  }

  static List<Address>? getNotDefaultAddress(List<Address> addresses) {
    return addresses.where((address) => address.isDefault == false).toList();
  }
}
