import 'dart:convert';
import 'dart:developer';

import 'package:findly/Core/Custom/api_enum.dart';
import 'package:findly/Core/Custom/custom_snack_bar.dart';
import 'package:findly/Core/Custom/image_to_firebase.dart';
import 'package:findly/Core/api_services.dart';
import 'package:findly/Models/AccommodationModels/add_accommodation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddaccommodationViewmodel extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController refController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  ApiService apiService = ApiService();
  List<String> addAccommodationPhotos = [];
  bool isWifiChecked = true;
  bool isTranportChecked = false;

  //Drop downs values
  String? selectedCategory;
  String? selectedTenantType;
  String? selectedRoomType;
  String? selectedAvailability;

  //function to set the selected value
  void setCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }

  void setTenantType(String value) {
    selectedTenantType = value;
    notifyListeners();
  }

  void setRoomType(String value) {
    selectedRoomType = value;
    notifyListeners();
  }

  void setAvailability(String value) {
    selectedAvailability = value;
    notifyListeners();
  }

  List<bool> amenitiesValues = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<String> amenitiesLabels = [
    "Wifi",
    "Transport",
    "Swimming pool",
    "Back-up power",
    "CCTV",
    "Parking",
    "Security",
    "Electric fence",
    "Entertainment area",
    "Furnished",
    "Washing machine",
    "Cleaning service",
    "Garden",
    "Air conditioning",
  ];

  void onAmenitiesChanged(int index, bool? value) {
    amenitiesValues[index] = value ?? false;

    notifyListeners();
    getSelectedLabels();
  }

  List<String> getSelectedLabels() {
    List<String> selectedLabels = [];
    for (int i = 0; i < amenitiesValues.length; i++) {
      if (amenitiesValues[i]) {
        selectedLabels.add(amenitiesLabels[i]);
      }
    }
    print(selectedLabels);
    return selectedLabels;
  }

  void setAddAccommodationPhotos() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage();

    if (images.length > 10) {
      Get.snackbar(
        'Images Limit Exceeded',
        'You can only select up to 10 images.Showing the first 10 images.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      // Show a message to the user or handle the case where more than 3 images are selected
      print('You can only select up to 3 images.');
      // Optionally, you can take only the first 3 images
      addAccommodationPhotos =
          images.take(10).map((image) => image.path).toList();
    } else {
      addAccommodationPhotos = images.map((image) => image.path).toList();
    }
    notifyListeners();
  }

  void removeImage(int index) {
    addAccommodationPhotos.removeAt(index);
    notifyListeners();
  }

  void editImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      addAccommodationPhotos[index] = image.path;
      notifyListeners();
    }
  }

  //send Accommodation data to the server
  bool loading = false;
  bool failedNetworkRequest = false;

  Future<void> addAccommodation() async {
    loading = true;
    notifyListeners();
    List<String> images =
        await uploadAccommodationPhotos(addAccommodationPhotos);
    try {
      const addAccommodationApi2 =
          'https://findly-kappa.vercel.app/api/accommondation';
      log("1");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      log("2 $token");
      AddAccommodationModel data = AddAccommodationModel(
        title: titleController.text,
        reference: refController.text,
        category: selectedCategory,
        location: locationController.text,
        tenantType: selectedTenantType,
        description: aboutController.text,
        amenities: getSelectedLabels(),
        images: images,
        roomTypes: selectedRoomType,
        price: int.parse(priceController.text),
        availability: selectedAvailability,
      );

      log('Request Body: ${jsonEncode(data)}');
      log("3");
      var response = await apiService.request2(
        header: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        endPoint: Uri.parse(addAccommodationApi2),
        type: RequestType.post,
        body: data,
      );
      log("4");

      if (response.statusCode == 201) {
        // Check for 201 Created status
        final responseJson = jsonDecode(response.body);
        log('Response: $responseJson');
        kGetSnakBar(text: "Accommodation added successfully", title: "Success");
         failedNetworkRequest = false;
        clearAllData();
        loading = false;
        notifyListeners();
        return;
      }
      else {
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        log('Error: $errorMessage');
        log('Error status code: ${response.statusCode}');
        kGetSnakBar(text: errorMessage, title: "Error");
        loading = false;
        failedNetworkRequest = true;
        notifyListeners();
        return;
      }
    } catch (e) {
      loading = false;
      failedNetworkRequest = true;
      notifyListeners();
      log("error in add accommodation $e");
    }
  }

  clearAllData() {
    failedNetworkRequest = false;
    titleController.clear();
    refController.clear();
    aboutController.clear();
    locationController.clear();
    priceController.clear();
    selectedCategory = null;
    selectedTenantType = null;
    selectedRoomType = null;
    selectedAvailability = null;
    addAccommodationPhotos = [];
    amenitiesValues = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    notifyListeners();
  }

  Future<List<String>> uploadAccommodationPhotos(
      List<String> addAccommodationPhotos) async {
    // Map each image upload to a Future
    final uploadFutures = addAccommodationPhotos.map((photoPath) {
      return imageToFirebaseStorage(
        imagePath: photoPath,
        collectionPath: "AccommodationImages/",
      );
    }).toList();

    // Wait for all uploads to complete
    final images = await Future.wait(uploadFutures);

    return images;
  }
}
