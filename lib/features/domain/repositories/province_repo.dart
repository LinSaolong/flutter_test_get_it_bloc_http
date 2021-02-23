import 'dart:convert';

import 'package:flutter_test_get_it_bloc_http/data/models/province_model.dart';
import 'package:http/http.dart' as http;

class ProvinceRepo {
  Future<ProvinceModel> getProvince() async {
    http.Response response = await http.get("http://ntp.in.ngrok.io/provinces");
    Map<String, dynamic> json = jsonDecode(response.body);
    return ProvinceModel.fromJson(json);
  }
}
