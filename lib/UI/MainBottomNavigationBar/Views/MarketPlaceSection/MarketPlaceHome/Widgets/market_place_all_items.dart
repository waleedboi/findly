import 'dart:convert';
import 'dart:developer';

import 'package:findly/Core/Custom/custom_snack_bar.dart';
import 'package:findly/Core/Custom/api_enum.dart';
import 'package:findly/Core/api_services.dart';
import 'package:findly/Models/marketplace_item_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarketplaceSellitemView extends ChangeNotifier {
  ApiService apiService = ApiService();
  List<ProductListingModel> marketplaceItems = []; // List to hold fetched items
  bool loading = false;

  Future<void> fetchMarketplaceItems() async {
    loading = true;
    notifyListeners();

    try {
      // Define the API endpoint
      const String fetchItemsApi =
          'https://findly-kappa.vercel.app/api/marketplace/items?page=1&pageSize=10&search';

      // Retrieve the authentication token from shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      // Log the request
      log('Fetching marketplace items with token: $token');

      // Send a GET request to the API
      var response = await apiService.request2(
        header: {
          'Authorization': 'Bearer $token',
        },
        endPoint: Uri.parse(fetchItemsApi),
        type: RequestType.get,
      );

      // Handle the response
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);

        // Map the response to your ProductListingModel
        marketplaceItems = jsonResponse
            .map((item) => ProductListingModel.fromJson(item))
            .toList();
        log('Fetched items: ${marketplaceItems.length} items');
      } else {
        // Handle errors by decoding the error message from the response
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        log('Error fetching items: $errorMessage');
        kGetSnakBar(text: errorMessage, title: "Error");
      }
    } catch (e) {
      // Catch and log any errors during the process
      log("Error fetching marketplace items: $e");
      kGetSnakBar(
          text: "Failed to fetch items. Please try again.", title: "Error");
    } finally {
      loading = false; // Ensure loading is false after operation
      notifyListeners();
    }
  }
}
