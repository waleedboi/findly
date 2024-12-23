import 'dart:convert';
import 'dart:developer';

import 'package:findly/Constant/api_url_constant.dart';
import 'package:findly/Core/Custom/api_enum.dart';
import 'package:findly/Core/Custom/custom_snack_bar.dart';
import 'package:findly/Core/api_services.dart';
import 'package:findly/UI/MainBottomNavigationBar/main_bottom_navigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewmodel extends ChangeNotifier {
  ApiService apiService = ApiService();
  bool loading = false;
  login({
    required String email,
    required String password,
  }) async {
    log('----------------------------------------------------------------');
    try {
      loading = true;
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var response = await apiService.request(
        endPoint: userLoginUrl,
        type: RequestType.post,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        print('Response: $responseJson');
        print('Response token: ${responseJson["data"]['accessToken']}');
        prefs.setString('token', responseJson["data"]['accessToken']);
        prefs.setString('email', email);

        loading = false;
        notifyListeners();
        Get.offAll(const MainBottomNavigationbar());
      } else {
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        kGetSnakBar(text: errorMessage, title: "Error");
        log('Error: $errorMessage');
        log('Error stuscode: ${response.statusCode}');
        loading = false;
        notifyListeners();
      }
    } catch (e) {
      loading = false;
      notifyListeners();
      print('Exception: $e');
    }
  }

  //**************** Social Login ***************/
}
