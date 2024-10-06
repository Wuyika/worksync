import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:worklin/models/company_branch_model.dart';
import 'package:worklin/models/user_model.dart';
import 'package:worklin/providers/app_data.dart';
import 'package:worklin/utils/app_alert.dart';


class ApiService {
  String baseUrl = dotenv.env['BASE_URL'] ?? "";

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
      AppAlerts.showInfoSnackBar(jsonDecode(response.body)['message'] as String);
      throw(jsonDecode(response.body)['message'] as String);
    } else if( response.body.isEmpty) {
      AppAlerts.showInfoSnackBar("Unknown Error");
      throw "Invalid Credentials";
    }
    return null;
  }

  Future<CompanyBranchModel?> getCompanyInfo({
    required int branchId,
  }) async {
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${AppData.token}',
    };
    // throw "Error";
    final uri = Uri.http(baseUrl, '/api/sites/show/$branchId');
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final companyBranch = CompanyBranchModel.fromJson(jsonDecode(response.body)['data']);
      return companyBranch;
    } else if (response.statusCode == 400) {
      debugPrint(response.statusCode.toString());
      debugPrint(response.body);
      AppAlerts.showInfoSnackBar(jsonDecode(response.body)['message'] as String);
      return null;
    } else if( response.body.isEmpty) {
      throw "Not found";
    }
    return null;
  }

  Future<bool?> checkInEmployee({
    required String siteId,
    required String distance,
    required String unitDistance,
  }) async {
    final headers = {
      // 'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${AppData.token}',
    };
    // throw "Error";
    final requestBody = {
      "site_id": siteId,
      "distance": distance,
      "unite_distance": unitDistance,
    };
    final uri = Uri.http(baseUrl, '/api/presence/create');
    final response = await http.post(uri, body: requestBody, headers: headers);
    if (response.statusCode == 200) {
      final String status = jsonDecode(response.body)['status'] as String;
      if(status == "success"){
        // AppAlerts.showInfoSnackBar(jsonDecode(response.body)['message'] as String);
        return true;
      } else if (status == "fail"){
        AppAlerts.showErrorSnackBar(jsonDecode(response.body)['message'] as String);
      }
      return false;
    } else if (response.statusCode == 400) {
      debugPrint(response.statusCode.toString());
      AppAlerts.showInfoSnackBar(jsonDecode(response.body)['message'] as String);
      throw (jsonDecode(response.body)['message'] as String);
    } else if( response.body.isEmpty) {
      throw "Invalid Credentials";
    }
    return null;
  }

}
