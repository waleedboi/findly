import 'dart:convert';
import 'dart:developer';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommodationHome/AccomodationModel/accomodation_api_model.dart';
import 'package:http/http.dart' as http;
import 'package:findly/Models/AccommodationModels/accommodation_model.dart';
import 'package:flutter/material.dart';

class HomeScreenViewmodel extends ChangeNotifier {
  int currentIndex = 0;
  List<AccommodationModel> accommodationList = [];

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future<void> fetchAccommodations() async {
    try {
      final response = await http.get(Uri.parse(
          'https://findly-kappa.vercel.app/api/public/accommodations?page=1&limit=100'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final accommodationData = AccommodationResponse.fromJson(jsonResponse);
        accommodationList = accommodationData.data.accommodations
            .cast<AccommodationModel>(); // Update the list with accommodations
        notifyListeners();
      } else {
        throw Exception("Failed to load accommodations");
      }
    } catch (error) {
      log("Error fetching accommodations: $error");
    }
  }

  bool isBookmarked = false;
  void changeBookmark() {
    isBookmarked = !isBookmarked;
    notifyListeners();
  }

  List<bool> isBookmarkedList = List.generate(5, (index) => false);

  void toggleBookmark(int index) {
    isBookmarkedList[index] = !isBookmarkedList[index];
    notifyListeners();
  }
}
