import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vent_test/core/constant.dart';
import 'package:vent_test/models/order.dart';

class OrderApi {
  static Uri url = Uri.https(Constant.baseUrl, '/order');

  static Future<String> createOrder({required Order order}) async {
    final request = await http.post(url, body: order.toJson());
    final response = json.decode(request.body);

    if (response['status_code'] == 200) {
      return response['message'];
    } else if (response['status_code'] == 400) {
      throw Exception(response['message']);
    } else {
      throw Exception('Terjadi kesalahan!');
    }
  }

  static Uri urlQuery(int? id) => Uri.https(Constant.baseUrl, 'api/order/cancel/$id');

  static Future<String> cancelOrder({required int id}) async {
    final request = await http.get(urlQuery(id));
    final response = json.decode(request.body);
    
    if (response['status_code'] == 200) {
      return response['message'];
    } else if (response['status_code'] == 204 || response['status_code'] == 400) {
      throw Exception(response['message']);
    } else {
      throw Exception('Terjadi kesalahan!');
    }
  }
}
