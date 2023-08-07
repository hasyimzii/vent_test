import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vent_test/core/constant.dart';
import 'package:vent_test/models/voucher.dart';

class VoucherApi {
  static Uri url(String q) => Uri.https(Constant.baseUrl, 'api/vouchers', {'kode': q});

  static Future<List<Voucher>> getVoucher({required String code}) async {
    final request = await http.get(url(code));
    final response = json.decode(request.body);
    
    if (response['status_code'] == 200) {
      return List<Voucher>.from(response['datas'].map((x) => Voucher.fromJson(x)));
    } else if (response['status_code'] == 204 || response['status_code'] == 400) {
      throw Exception(response['message']);
    } else {
      throw Exception('Terjadi kesalahan!');
    }
  }
}