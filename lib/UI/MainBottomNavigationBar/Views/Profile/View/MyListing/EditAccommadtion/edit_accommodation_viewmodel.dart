import 'dart:convert';
import 'dart:developer';

import 'package:findly/Constant/api_url_constant.dart';
import 'package:findly/Core/Custom/api_enum.dart';
import 'package:findly/Core/Custom/custom_snack_bar.dart';
import 'package:findly/Core/Custom/image_to_firebase.dart';
import 'package:findly/Core/api_services.dart';
import 'package:findly/Models/AccommodationModels/add_accommodation.dart';
import 'package:findly/Models/AccommodationModels/get_user_accommodation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditAccommodationViewmodel extends ChangeNotifier {
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

  updateAmenitiesValue(List<String> listOfAmenities) {
    for (int i = 0; i < amenitiesLabels.length; i++) {
      if (listOfAmenities.contains(amenitiesLabels[i])) {
        amenitiesValues[i] = true;
      }
    }
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

  Future<void> setAddAccommodationPhotos() async {
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
      List<String> listOfUploadedImages = [];
      for (int i = 0; i < images.length; i++) {
        String imageUrl = await imageToFirebaseStorage(
            imagePath: images[i].path,
            collectionPath: "AccommodationImages/");
        listOfUploadedImages.add(imageUrl);
      }
      addAccommodationPhotos.addAll(listOfUploadedImages);
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

  //Edit Accomoadtion
  bool loading = false;

  editAccommodation(
      {required GetuserAccommodation accData,
      required Function onSuccess}) async {
    try {
      loading = true;
      notifyListeners();
      List<String> images = [];
      if (addAccommodationPhotos.isNotEmpty) {
        for (int i = 0; i < addAccommodationPhotos.length; i++) {
          String imageUrl = await imageToFirebaseStorage(
              imagePath: addAccommodationPhotos[i],
              collectionPath: "AccommodationImages/");
          print(imageUrl);
          images.add(imageUrl);
        }
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      log("2 $token");
      AddAccommodationModel data = AddAccommodationModel(
        title:
            titleController.text.isEmpty ? accData.title : titleController.text,
        reference:
            refController.text == "" ? accData.reference : refController.text,
        category: selectedCategory ?? accData.category,
        location: locationController.text.isEmpty
            ? accData.location
            : locationController.text,
        tenantType: selectedTenantType ?? accData.tenantType,
        description: aboutController.text == ""
            ? accData.description
            : aboutController.text,
        amenities: getSelectedLabels().isEmpty
            ? accData.amenities
            : getSelectedLabels(),
        images: images.isEmpty ? accData.images : images,
        roomTypes: selectedRoomType ?? accData.roomTypes,
        price: int.parse(priceController.text == ""
            ? accData.price.toString()
            : priceController.text),
        availability: selectedAvailability ?? accData.availability,
      );

      String endPoint = '$accommodationApi/${accData.id}';
      print('Request endpoint: $endPoint');
      var response = await apiService.request2(
        header: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        endPoint: Uri.parse(endPoint),
        type: RequestType.patch,
        body: data,
      );
      if (response.statusCode == 200) {
        // Check for 201 Created status
        final responseJson = jsonDecode(response.body);
        log('Response: $responseJson');
        kGetSnakBar(text: "Accommodation edit successfully", title: "Success");
        onSuccess();
        clearAllData();
        loading = false;
        notifyListeners();
        // await Get.offAll(const MainBottomNavigationbar());
      } else {
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        log('Error in edit acc: $errorMessage');
        log('Error in edit acc status code: ${response.statusCode}');
        kGetSnakBar(text: errorMessage, title: "Error");
        loading = false;
        notifyListeners();
      }
    } catch (e) {
      loading = false;
      notifyListeners();
      log("error in edit  accommodation $e");
    }
  }

  clearAllData() {
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

  void updateControllers(GetuserAccommodation data) {
    titleController.text = data.title ?? '';
    refController.text = data.reference ?? '';
    aboutController.text = data.description ?? '';
    locationController.text = data.location ?? '';
    priceController.text = data.price?.toString() ?? '';

    selectedCategory = data.category;
    selectedTenantType = data.tenantType;
    selectedRoomType = data.roomTypes;
    selectedAvailability = data.availability;

    // If amenities values exist, update them. Otherwise, initialize as false.
    amenitiesValues = amenitiesLabels.map((label) {
      return data.amenities?.contains(label) ?? false;
    }).toList();

    notifyListeners();
  }}
