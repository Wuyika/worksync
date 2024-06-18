import 'package:worklin/utils/helpers.dart';

class UserModel {
  int? id;
  String? email;
  String? gender;
  String? firstName;
  String? lastName;
  String? position;
  DateTime? dateOfBirth;
  String? placeOfBirth;
  String? residentCity;
  String? phoneNumber;
  String? companyId;
  String? token;
  String? role;
  UserModel({
    this.id,
    this.email,
    this.gender,
    this.firstName,
    this.lastName,
    this.position,
    this.dateOfBirth,
    this.placeOfBirth,
    this.residentCity,
    this.phoneNumber,
    this.companyId,
    this.token,
    this.role,
  });

  // Getter for full name
  String get fullName => '${firstName ?? ""} ${lastName ?? ""}'.trim();

  UserModel.fromJson(dynamic json) {
    id = json["id"] as int?;
    email = json["email"] as String?;
    gender = json["gender"] as String?;
    firstName = json["first_name"] as String?;
    lastName = json["last_name"] as String?;
    position = json["position"] as String?;
    dateOfBirth = DateTime.tryParse((json["date_of_birth"] as String?) ?? "");
    placeOfBirth = json["place_of_birth"] as String?;
    residentCity = json["city_of_residence"] as String?;
    phoneNumber = json["telephone"] as String?;
    companyId = json["company_id"] as String?;
    token = json["token"] as String?;
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["id"] = id;
    map["email"] = email;
    map["gender"] = gender;
    map["first_name"] = firstName;
    map["last_name"] = lastName;
    map["position"] = position;
    map["date_of_birth"] = dateFormat.format(dateOfBirth ?? DateTime.now());
    map["placeOfBirth"] = placeOfBirth;
    map["residentCity"] = residentCity;
    map["phoneNumber"] = phoneNumber;
    map["companyId"] = companyId;
    map["role"] = role;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['token'] = token;
    map['phoneNumber'] = phoneNumber;
    return map;
  }

  UserModel copyWith({
    int? id,
    String? email,
    String? gender,
    String? firstName,
    String? lastName,
    String? position,
    DateTime? dateOfBirth,
    String? placeOfBirth,
    String? residentCity,
    String? phoneNumber,
    String? companyId,
    String? token,
    String? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      position: position ?? this.position,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      residentCity: residentCity ?? this.residentCity,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      companyId: companyId ?? this.companyId,
      token: token ?? this.token,
      role: role ?? this.role,
    );
  }
}
