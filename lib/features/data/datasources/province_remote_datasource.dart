import 'dart:convert';

import 'package:flutter_test_get_it_bloc_http/features/data/models/province_model.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/province.dart';
import '../models/province_model.dart';

abstract class ProvinceRemoteDataSource {
  Future<List<Province>> getProvince();
}

class ProvinceRemoteDataSourceImpl implements ProvinceRemoteDataSource {
  @override
  Future<List<Province>> getProvince() async {
    List<Province> provinces = [];
    http.Response response =
        await http.get("http://ntp.in.ngrok.io/provinces", headers: {
      'Content-Type': 'application/json',
    });
    var provinceList = jsonDecode(response.body);
    provinceList.forEach((e) {
      Province province = ProvinceModel.fromJson(e);
      provinces.add(province);
    });
    return provinces;
  }
}
