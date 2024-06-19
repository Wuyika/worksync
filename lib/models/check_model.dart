import 'package:flutter/material.dart';

class CheckModel {
  String? type;
  TimeOfDay? checkTime;

  CheckModel({
    this.type,
    this.checkTime,
  });

  CheckModel.fromJson(Map json) {
    type = json["id"] as String?;
    checkTime = json["checkTime"] as TimeOfDay?;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["type"] = type;
    map["checkTime"] = checkTime;
    return map;
  }


}
