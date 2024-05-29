class UserModel {
  String? id;
  String? email;
  String? userName;
  String? authenticated;
  String? token;
  String? profileUrl;
  String? refreshToken;
  String? phoneNumber;
  bool? isEmailVerified;
  bool? isPhoneVerified;
  DateTime? subscribedDate;
  String? firstName;
  String? lastName;
  String? role;
  String? address;

  UserModel({
    this.id,
    this.email,
    this.userName,
    this.authenticated,
    this.token,
    this.profileUrl,
    this.refreshToken,
    this.role,
    this.phoneNumber,
    this.isEmailVerified,
    this.isPhoneVerified,
    this.subscribedDate,
    this.firstName,
    this.lastName,
    this.address,
  });

  UserModel.fromJson(Map<String, dynamic>  json) {
      id = json["id"] as String?;
      email = json["email"] as String?;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map["id"] = id;
    map["email"] = email;
    map["userName"] = userName;
    map["token"] = token;
    return map;
  }

  UserModel copyWith({
    String? id,
    String? email,
    String? userName,
    String? token,
    String? bio,
    String? subscription,
    String? plan,
    String? profileUrl,
    List<String>? invitedUsers,
    List<String>? subscribedUser,
    String? refreshToken,
    String? role,
    bool? isEmailVerified,
    DateTime? subscribedDate,
    String? firstName,
    String? lastName,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      token: token ?? this.token,
      profileUrl: profileUrl ?? this.profileUrl,
      refreshToken: refreshToken ?? this.refreshToken,
      role: role ?? this.role,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      subscribedDate: subscribedDate ?? this.subscribedDate,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }
}
