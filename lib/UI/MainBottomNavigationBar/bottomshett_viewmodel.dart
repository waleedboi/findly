import 'dart:convert';
import 'dart:developer';

import 'package:findly/Constant/api_url_constant.dart';
import 'package:findly/Core/Custom/api_enum.dart';
import 'package:findly/Core/api_services.dart';
import 'package:findly/Core/get_data_fromlocal.dart';
import 'package:findly/Models/user_model.dart';
import 'package:findly/Models/user_response_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/GigListing/gig_listing_viewmodel.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Profile/View/MyListing/my_listing_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomshettViewmodel extends ChangeNotifier {
  ApiService apiService = ApiService();
  BottomshettViewmodel() {
    init();
    log('Ke');
  }

  init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    await getuserData();
    await getGuest();
    await getAllScreenData();
    // loadAllUserFromSharedpref();

    notifyListeners();
  }

  getAllScreenData() {
    user.role == "Agent"
        ? Provider.of<MyListingViewmodel>(Get.context!, listen: false).init()
        : Provider.of<GigListingViewmodel>(Get.context!, listen: false).init();
  }

  String? email;

  int currentIndex = 0;
  List<UserModel> users = [];
  UserModel currentUser = UserModel();

  onItemTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }

  bool canPop = false;

  bool onPopScope(bool didPop) {
    if (didPop) {
      canPop = false;
      notifyListeners();
      return false;
    }
    if (currentIndex != 0) {
      currentIndex = 0;
      notifyListeners();
      canPop = false;
      return false;
    }
    canPop = true;
    notifyListeners();
    return true; // Indicate that the app should exit
  }

  bool isGuest = false;
  getGuest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool guest = prefs.getBool("isguest") ?? true;
    isGuest = guest;
    notifyListeners();
  }

  //****************Get User Data ***************/
  UserData user = UserData();
  bool userLoading = false;

  
  getuserData() async {
    try {
      userLoading = true;
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print('Token: $token');
      if (token != null) {
        var response = await apiService.request(
          endPoint: userprofile,
          type: RequestType.get,
          header: {
            "Access-Control-Allow-Origin": "*",
            'Accept': '*/*',
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          final responseJson = jsonDecode(response.body);
          user = UserData.fromJson(responseJson['data']);
          userLoading = false;
          notifyListeners();
        } else {
          final jsonResponse = jsonDecode(response.body);
          final errorMessage = jsonResponse['error'];

          // kGetSnakBar(text: errorMessage, title: "Error");
          log('Error in bottom sheet: $errorMessage');
          log('Error stuscode: ${response.statusCode}');
          await prefs.clear();
          email = null;
          notifyListeners();
          email = await getEmail();
          notifyListeners();

          userLoading = false;
          notifyListeners();
        }
      } else {
        await prefs.clear();
        email = null;
        userLoading = false;
        notifyListeners();
        log('Token is null');
      }
    } catch (e) {
      userLoading = false;
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      email = await getEmail();
      notifyListeners();
      print('Exception: $e');
    }
  }

  // Future<void> loadAllUserFromSharedpref() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? userName = prefs.getString('username');
  //     String? password = prefs.getString('password');
  //     if (userName != null && password != null) {
  //       users = await loadUsers();

  //       for (var user in users) {
  //         if (user.userName == userName && user.password == password) {
  //           currentUser = user;
  //           notifyListeners();
  //           return;
  //         }
  //       }
  //       throw Exception('User not found or incorrect password');
  //     } else {
  //       print('==============> No user found in bottomsheet viewmodel');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

  // Future<List<UserModel>> loadUsers() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final usersJson = prefs.getString('users');
  //   if (usersJson != null) {
  //     List<dynamic> usersList = jsonDecode(usersJson);
  //     return usersList.map((userJson) => UserModel.fromJson(userJson)).toList();
  //   }
  //   return [];
  // }
}
