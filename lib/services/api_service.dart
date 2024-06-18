import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:worklin/models/user_model.dart';
import 'package:worklin/providers/app_data.dart';

late String userApiToken;

class ApiService {
  String baseUrl = dotenv.env['BASE_URL'] ?? "";

  // fruboris24@gmail.com
  // 654467742

  Future<UserModel?> signInUser({
    required String email,
    required String password,
  }) async {
    // throw "Error";
    final requestBody = {
      "email": email,
      "password": password,
    };
    final uri = Uri.http(baseUrl, '/api/login/employee');
    final response = await http.post(uri, body: requestBody);
    if (response.statusCode == 200) {
      final user = UserModel.fromJson(jsonDecode(response.body)['data']['employee']);
      user.token = jsonDecode(response.body)['data']['token'] as String?;
      return user;
    } else if (response.statusCode == 400) {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      return null;
    } else if( response.body.isEmpty) {
      throw "Invalid Credentials";
    }
    return null;
  }

  // Future<void> registerUser({
  //   String? userName,
  //   required String email,
  //   required String password,
  // }) async {
  //   // throw "Error";
  //   final requestBody = {
  //     "email": email,
  //     "password": password,
  //   };
  //   final uri = Uri.http(baseUrl, '/auth/sign-up');
  //   final response = await http.post(uri, body: requestBody);
  //   if (response.statusCode == 201) {
  //     debugPrint("user locked in");
  //     debugPrint(response.body);
  //     final user = UserModel.fromJson(jsonDecode(response.body));
  //     if(userName != null){
  //       user.userName = userName;
  //     }
  //     AppData.updateCurrentUser(user: user, isNeedToStoreIntoStorage: true);
  //   } else if (response.statusCode == 400) {
  //     debugPrint(response.body);
  //     throw LocaleKeys.auth_invalid_credentials.tr();
  //   } else {
  //     throw LocaleKeys.errors_unknown.tr();
  //   }
  // }

}
