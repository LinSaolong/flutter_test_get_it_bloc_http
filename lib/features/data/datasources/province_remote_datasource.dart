import 'dart:convert';

import 'package:flutter_test_get_it_bloc_http/features/data/models/province_model.dart';
import 'package:http/http.dart' as http;

abstract class ProvinceRemoteDataSource {
  Future<ProvinceModel> getProvince();
}

class ProvinceRemoteDataSourceImpl implements ProvinceRemoteDataSource {
  @override
  Future<ProvinceModel> getProvince() async {
    http.Response response = await http.get("http://ntp.in.ngrok.io/provinces");
    Map<String, dynamic> json = jsonDecode(response.body);
    return ProvinceModel.fromJson(json);
  }
}
