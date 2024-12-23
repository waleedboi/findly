import 'dart:convert';
import 'dart:developer';

import 'package:findly/Constant/api_url_constant.dart';
import 'package:findly/Core/Custom/api_enum.dart';
import 'package:findly/Core/Custom/custom_snack_bar.dart';
import 'package:findly/Core/api_services.dart';
import 'package:findly/Models/AccommodationModels/get_user_accommodation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyListingViewmodel extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  MyListingViewmodel() {
    init();
  }

  void onDelete(int index) {
    filteredAccommodation.removeAt(index);
    notifyListeners();
  }

  bool loading = false;

  init() {
    Future.delayed(Duration.zero, () async {
      loading = true;
      notifyListeners();
      await fetchUserAllAccommodations();
      loading = false;
      notifyListeners();
    });
  }

  List<GetuserAccommodation> userAccommodation = [];
  List<GetuserAccommodation> filteredAccommodation = [];

  Future<void> deleteAccommodation(String id, int index) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      String endPoint = '$accommodationApi/$id';
      var response = await ApiService().request2(
        header: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        endPoint: Uri.parse(endPoint),
        type: RequestType.delete,
      );
      if (response.statusCode == 200) {
        onDelete(index);
      } else {
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        kGetSnakBar(text: errorMessage, title: "Error");
        log('Error deleting accommodation Listing: $errorMessage');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  fetchUserAllAccommodations() async {
    userAccommodation = [];
    filteredAccommodation = [];
    notifyListeners();
    // First request to get the total count
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      final response = await http.get(
        Uri.parse('$accommodationApi?page=1&pageSize=10&search'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final totalCount = data["data"]['total'];
        final page = data["data"]['page'];
        log('Total count fetched $totalCount');
        log('Page fetched $page');

        // Second request to fetch all accommodations
        final allResponse = await http.get(
          Uri.parse('$accommodationApi?page=$page&pageSize=$totalCount&search'),
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Accept': '*/*',
            'Authorization': 'Bearer $token',
          },
        );
        if (allResponse.statusCode == 200) {
          final allData = jsonDecode(allResponse.body);
          final accommodations = allData["data"]['accommodations'] as List;

          userAccommodation = accommodations
              .map((json) => GetuserAccommodation.fromJson(json))
              .toList();
          userAccommodation.sort((a, b) {
            int updatedAtComparison = b.updatedAt!.compareTo(a.updatedAt!);
            if (updatedAtComparison != 0) {
              return updatedAtComparison;
            } else {
              return b.createdAt!.compareTo(a.createdAt!);
            }
          });
          filteredAccommodation = List.from(userAccommodation);
          notifyListeners();
          log('All accommodations fetched ${userAccommodation.length}');
        } else {
          final jsonResponse = jsonDecode(response.body);
          final errorMessage = jsonResponse['error'];
          // kGetSnakBar(text: errorMessage, title: "Error");
          log('Error in my listing screen: $errorMessage');
          log('Error in my listing screen status: ${response.statusCode}');
        }
      } else {
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        // kGetSnakBar(text: errorMessage, title: "Error");
        log('Error in  getting all list in listing screen: $errorMessage');
        log('Error in in  getting all lis my listing screen status: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //****************Search Accommodation ***************/
  void filterAccommodations(String query) {
    if (query.isEmpty) {
      filteredAccommodation = List.from(userAccommodation);
    } else {
      filteredAccommodation = userAccommodation.where((accommodation) {
        return accommodation.title!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            accommodation.description!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            accommodation.price
                .toString()
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            accommodation.availability!
                .toLowerCase()
                .contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
