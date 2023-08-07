import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vent_test/core/constant.dart';
import 'package:vent_test/models/menu.dart';

class MenuApi {
  static final Uri url = Uri.https(Constant.baseUrl, 'api/menus');

  static Future<List<Menu>> getMenu() async {
    final request = await http.get(url);
    final response = json.decode(request.body);
    
    if (response['status_code'] == 200) {
      return List<Menu>.from(response['datas'].map((x) => Menu.fromJson(x)));
    } else if (response['status_code'] == 204 || response['status_code'] == 400) {
      throw Exception(response['message']);
    } else {
      throw Exception('Terjadi kesalahan!');
    }
  }
}