// "data": {
// "id": 1,
// "name": "Branch Damas",
// "city": "Yaounde",
// "address": "Damas",
// "description": "Site activity",
// "longitude": "3.8987889",
// "latitude": "4.0097876",
// "company_id": 1
// }

class CompanyBranchModel{
  int? id;
  String? name;
  String? city;
  String? address;
  String? description;
  String? longitude;
  String? latitude;
  int? companyId;
  CompanyBranchModel({
    this.id,
    this.name,
    this.city,
    this.address,
    this.description,
    this.longitude,
    this.latitude,
    this.companyId,
});
  CompanyBranchModel.fromJson(dynamic json){
    id = json["id"] as int?;
    name = json["name"] as String?;
    city = json["city"] as String?;
    address = json["address"] as String?;
    description = json["description"] as String?;
    longitude = json["longitude"] as String?;
    latitude = json["latitude"] as String?;
    companyId = json["company_id"] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["id"] = id;
    map["name"] = name;
    map["city"] = city;
    map["address"] = address;
    map["description"] = description;
    map["longitude"] = longitude;
    map["latitude"] = latitude;
    map["company_id"] = companyId;
    return map;
  }
}
