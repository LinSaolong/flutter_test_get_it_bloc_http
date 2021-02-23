import 'package:flutter_test_get_it_bloc_http/features/domain/entities/province.dart';

class ProvinceModel extends Province {
  String sId;
  String name;

  ProvinceModel({this.sId, this.name});

  ProvinceModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
