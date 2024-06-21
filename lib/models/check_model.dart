import 'package:flutter/material.dart';

class CheckModel {
  String? type;
  TimeOfDay? checkTime;
  DateTime? checkDate;

  CheckModel({
    this.type,
    this.checkTime,
    this.checkDate,
  });

  CheckModel.fromJson(Map json) {
    type = json["id"] as String?;
    checkTime = json["checkTime"] as TimeOfDay?;
    checkDate = DateTime.tryParse(json["checkDate"] as String);
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["type"] = type;
    map["checkTime"] = checkTime;
    map["checkDate"] = checkDate;
    return map;
  }


}
