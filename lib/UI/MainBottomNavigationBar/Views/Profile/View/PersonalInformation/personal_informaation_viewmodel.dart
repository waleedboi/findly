import 'dart:convert';
import 'dart:developer';

import 'package:findly/Constant/api_url_constant.dart';
import 'package:findly/Core/Custom/api_enum.dart';
import 'package:findly/Core/Custom/custom_snack_bar.dart';
import 'package:findly/Core/api_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInformaationViewmodel extends ChangeNotifier {
  ApiService apiService = ApiService();
  bool isCurrentPasswordVisible = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  void toggleCurrentPasswordVisibility() {
    isCurrentPasswordVisible = !isCurrentPasswordVisible;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  updateUser({
    required String firstName,
    required String lastName,
    required String email,
    required String username,
    required String about,
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if (token != null) {
        var response = await apiService
            .request(endPoint: userUpdate, type: RequestType.patch, header: {
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        }, body: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "username": username,
          "about": about,
          "currentPassword": currentPassword,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
        });
        if (response.statusCode == 200) {
          final responseJson = jsonDecode(response.body);
          log("User Updated");
          prefs.setString('token', responseJson["data"]['accessToken']);
          prefs.setString('email', email);
        } else {
          log("User not Updated");
          final jsonResponse = jsonDecode(response.body);
          final errorMessage = jsonResponse['error'];
          kGetSnakBar(text: errorMessage, title: "Error");
          log('Error in update User: $errorMessage');
          log('Error stuscode: ${response.statusCode}');
        }
      } else {
        log("Token is null");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
