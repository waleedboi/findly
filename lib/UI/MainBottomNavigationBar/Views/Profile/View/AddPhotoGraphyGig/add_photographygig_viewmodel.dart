import 'dart:convert';
import 'dart:developer';

import 'package:findly/Constant/api_url_constant.dart';
import 'package:findly/Core/Custom/api_enum.dart';
import 'package:findly/Core/Custom/custom_snack_bar.dart';
import 'package:findly/Core/Custom/image_to_firebase.dart';
import 'package:findly/Core/api_services.dart';
import 'package:findly/Models/GigModels/add_gig.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/Payments/CompletePayment/widgets/successful_payment_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPhotographygigViewmodel extends ChangeNotifier {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController businessController = TextEditingController();
  ApiService apiService = ApiService();
  List<String> addPhotoGrapherPhotos = [];
  void setAddPhotoGrapherPhotos() async {
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
      addPhotoGrapherPhotos =
          images.take(10).map((image) => image.path).toList();
    } else {
      addPhotoGrapherPhotos = images.map((image) => image.path).toList();
    }
    notifyListeners();
  }

  void removeImage(int index) {
    addPhotoGrapherPhotos.removeAt(index);
    notifyListeners();
  }

  void editImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      addPhotoGrapherPhotos[index] = image.path;
      notifyListeners();
    }
  }

  String? selectedRegion;

  //function to set the selected value
  void selectRegion(String value) {
    selectedRegion = value;
    notifyListeners();
  }

  //**************** ADD GIG ***************/
  AddGigModel addGigModel = AddGigModel();
  bool loading = false;
  addGig() async {
    try {
      // Add gig
      loading = true;
      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> images = [];
      for (int i = 0; i < addPhotoGrapherPhotos.length; i++) {
        String imageUrl = await imageToFirebaseStorage(
            imagePath: addPhotoGrapherPhotos[i],
            collectionPath: "AddGigImages/");
        images.add(imageUrl);
      }
      String? token = prefs.getString('token');
      AddGigModel data = AddGigModel(
        name: firstNameController.text,
        description: descriptionController.text,
        price: int.parse(priceController.text),
        businessNumber: 1234567890,
        portfolio: images,
        regions: selectedRegion,
      );

      var response = await apiService.request2(
        header: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        endPoint: Uri.parse(addGigApi),
        type: RequestType.post,
        body: data,
      );
      if (response.statusCode == 201) {
        // Check for 201 Created status
        final responseJson = jsonDecode(response.body);
        log('Response: $responseJson');
        clearAllData();
        loading = false;
        notifyListeners();
        await Get.dialog(
          const PopScope(
            canPop: false,
            child: SuccessfulPaymentPop(),
          ),
          barrierDismissible: false,
        );
      } else {
        final jsonResponse = jsonDecode(response.body);
        final errorMessage = jsonResponse['error'];
        log('Error: $errorMessage');
        log('Error status code: ${response.statusCode}');
        kGetSnakBar(text: errorMessage, title: "Error");
        loading = false;
        notifyListeners();
      }
    } catch (e) {
      loading = false;
      notifyListeners();
      log(
        "error in add gig $e",
      );
    }
  }

  clearAllData() {
    firstNameController.clear();
    descriptionController.clear();
    priceController.clear();
    businessController.clear();
    addPhotoGrapherPhotos.clear();
    selectedRegion = null;
    notifyListeners();
  }
}
