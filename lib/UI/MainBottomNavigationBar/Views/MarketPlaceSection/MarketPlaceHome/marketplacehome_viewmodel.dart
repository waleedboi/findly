import 'dart:convert';
import 'dart:developer';

import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Core/Custom/api_enum.dart';
import 'package:findly/Core/Custom/custom_snack_bar.dart';
import 'package:findly/Core/api_services.dart';
import 'package:findly/Models/AccommodationModels/accommodation_model.dart';
import 'package:findly/Models/marketplace_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarketplacehomeViewmodel extends ChangeNotifier {
  String search = '';
  ApiService apiService = ApiService();
  List<ProductListingModel> marketplaceItems = []; // List to hold fetched items
  bool loading = false;

  MarketplacehomeViewmodel() {
    init();
    log('Hello');
  }

  init() async {
    await fetchMarketplaceItems();
    notifyListeners();
  }

  void setSearch(String value) {
    search = value;
    notifyListeners();
  }

  void onCategoryChanged(int index) {
    for (int i = 0; i < marketPlaceCategoryList.length; i++) {
      marketPlaceCategoryList[i].isSelected = i == index;
    }
    notifyListeners();
  }

  List<bool> isBookmarkedList =
      List.generate(topItems.length, (index) => false);

  void toggleBookmark(int index) {
    isBookmarkedList[index] = !isBookmarkedList[index];
    notifyListeners();
  }

  List<bool> isResultBookmarkedList =
      List.generate(topItemsReult.length, (index) => false);

  void toggleTopItemResultBookmark(int index) {
    isResultBookmarkedList[index] = !isResultBookmarkedList[index];
    notifyListeners();
  }

  Future<void> fetchMarketplaceItems({int page = 1, int pageSize = 100}) async {
    loading = true;
    notifyListeners();

    try {
      String searchQuery =
          search.isNotEmpty && search != 'All' ? '&search=$search' : '';
      final String fetchItemsApi =
          'https://findly-kappa.vercel.app/api/marketplace/items?page=$page&pageSize=$pageSize$searchQuery';

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      marketplaceItems.clear();

      var response = await apiService.request2(
        header: {'Authorization': 'Bearer $token'},
        endPoint: Uri.parse(fetchItemsApi),
        type: RequestType.get,
      );

      if (response.statusCode == 200) {

        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse.containsKey('data')) {
          final data = jsonResponse['data'];
          if (data.containsKey('items')) {
            final items = data['items'] as List<dynamic>;
            marketplaceItems = items
                .map((item) => ProductListingModel.fromJson(item))
                .toList();
            log('Fetched ${marketplaceItems.length} items');
          } else {
            log('Error: "items" key not found in data.');
          }
        } else {
          log('Error: "data" key not found in response.');
        }
      } else {
        final errorMessage = jsonDecode(response.body)['error'];
        log('Error fetching items: $errorMessage');
        kGetSnakBar(text: errorMessage, title: "Error");
      }
    } catch (e) {
      log("Error fetching marketplace items: $e");
      kGetSnakBar(
          text: "Failed to fetch items. Please try again.", title: "Error");
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}

class MarketplaceCategoryModel {
  String? title;
  String? icon;
  double? height;
  double? width;
  bool? isSelected;
  double? textWidth;

  MarketplaceCategoryModel(
      {this.title,
      this.icon,
      this.height,
      this.width,
      this.isSelected,
      this.textWidth});
}

List<MarketplaceCategoryModel> marketPlaceCategoryList = [
  MarketplaceCategoryModel(
      title: "TextBooks",
      icon: textbook,
      isSelected: true,
      height: 34.h,
      width: 31.63.w,
      textWidth: 70.87.w),
  MarketplaceCategoryModel(
    title: "Calculators",
    icon: calculator,
    isSelected: false,
    height: 34.h,
    width: 27.19.w,
    textWidth: 75.w,
  ),
  MarketplaceCategoryModel(
    title: "Laptops",
    icon: laptop,
    isSelected: false,
    height: 33.h,
    width: 40.w,
    textWidth: 91.w,
  ),
  MarketplaceCategoryModel(
    title: "Stationary",
    icon: stationary,
    isSelected: false,
    height: 40.h,
    width: 27.68.w,
    textWidth: 75.w,
  ),
];
