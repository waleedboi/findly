import 'dart:convert';
import 'dart:developer';
import 'package:findly/Core/Custom/custom_snack_bar.dart';
import 'package:findly/Core/Custom/api_enum.dart';
import 'package:findly/Core/Custom/image_to_firebase.dart';
import 'package:findly/Core/api_services.dart';
import 'package:findly/Models/marketplace_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MarketplaceSellitemViewmodel extends ChangeNotifier {
  ApiService apiService = ApiService();
  List<String> sellItemPics = [];
  String? selectedCondition;
  String? selectedCategory;
  String? selectedPlace;
  double? latitude;
  double? longitude;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();

  void setSellItemPic() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();

    if (images.length > 3) {
      Get.snackbar(
        'Images Limit Exceeded',
        'You can only select up to 3 images. Showing the first 3 images.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      sellItemPics = images.take(3).map((image) => image.path).toList();
    } else {
      sellItemPics = images.map((image) => image.path).toList();
    }
    notifyListeners();
  }

  void removeImage(int index) {
    sellItemPics.removeAt(index);
    notifyListeners();
  }

  void setCondition(String? value) {
    selectedCondition = value;
    notifyListeners();
  }

  void setCategory(String? value) {
    selectedCategory = value;
    notifyListeners();
  }

  void setPlace(String location, double lat, double lon) {
    selectedPlace = location;
    latitude = lat;
    longitude = lon;
    notifyListeners();
  }

  void editImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      sellItemPics[index] = image.path;
      notifyListeners();
    }
  }

  bool loading = false;
  bool apiSuccess = false;

  get marketplaceItems => null;

  // Update the function to accept form inputs as parameters
  Future<void> addProductListing({
    required String title,
    required int price,
    required String category,
    required String condition,
    required String description,
    required String place, // Ensure this is populated correctly
    required List<String> images, // Accepting image paths as input
  }) async {
    loading = true;
    apiSuccess = false;
    notifyListeners();

    try {
      // Upload images to Firebase or another storage service
      List<String> uploadedImages = [];
      for (String imagePath in images) {
        String imageUrl = await imageToFirebaseStorage(
          imagePath: imagePath,
          collectionPath:
              "ProductImages/", // Define your Firebase storage path here
        );
        uploadedImages.add(imageUrl); // Collect the uploaded image URLs
      }

      // Define the API endpoint
      const addProductApi =
          'https://findly-kappa.vercel.app/api/marketplace/item/add';

      // Retrieve the authentication token from shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      // Log the product details (for debugging)
      log('Title: $title, Price: $price, Category: $category, Condition: $condition');

      // Create a new `ProductListingModel` with the provided data
      ProductListingModel data = ProductListingModel(
        title: title,
        price: price,
        category: category,
        condition: condition,
        description: description,
        place: place, // Use the actual place parameter
        images: uploadedImages, // Use the uploaded image URLs
      );

      // Log the request body
      log('Request Body: ${jsonEncode(data.toJson())}');

      // Send a POST request to the API
      var response = await apiService.request2(
        header: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        endPoint: Uri.parse(addProductApi),
        type: RequestType.post,
        body: data.toJson(), // Pass the JSON-compatible map as the body
      );

      // Handle the response
      if (response.statusCode == 201) {
        log('Response: ${response.body}');
        apiSuccess = true;
        kGetSnakBar(text: "Item added successfully", title: "Success");
      } else {
        // Handle errors by decoding the error message from the response
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        log('Error: $errorMessage');
        kGetSnakBar(text: errorMessage, title: "Error");
      }
    } catch (e) {
      // Catch and log any errors during the process
      log("Error adding product: $e");
      kGetSnakBar(
          text: "Failed to add item. Please try again.", title: "Error");
    } finally {
      loading = false;
      apiSuccess = false;// Ensure loading is false after operation
      notifyListeners();
    }
  }
}
