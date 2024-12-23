import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:findly/Models/AccommodationModels/accommodation_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatViewmodel extends ChangeNotifier { 
  TextEditingController sendMessageController = TextEditingController();
  bool isEmojiPickerVisible = false;
  final scrollController = ScrollController();

  void toggleEmojiPicker(context) {
    isEmojiPickerVisible = !isEmojiPickerVisible;
    if (isEmojiPickerVisible) {
      FocusScope.of(context).unfocus(); // Hide the keyboard
    } else {
      FocusScope.of(context).requestFocus(); // Show the keyboard
    }
    notifyListeners();
  }

  void onEmojiSelected(String emoji, context) {
    sendMessageController.text += emoji;
    toggleEmojiPicker(context);
  }

  void onTextFieldFocus() {
    isEmojiPickerVisible = false;
    notifyListeners();
  }

  String? attachment;
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      attachment = file.name;
      notifyListeners();
      // Handle the selected file
      print('Picked file: ${file.name}');
    } else {
      // User canceled the picker
    }
  }

  Future<void> captureImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // Handle the captured image
      print('Captured image: ${image.path}');
    } else {
      // User canceled the camera
    }
  }

  String currentUserID = '';
  String accomodationUserID = '';
  AccommodationModel? model;

  void setChatRequirements(String userID, String accomodationUserId,
      AccommodationModel? modell) async {
    // FirebaseFirestore.instance
    //     .collection('chats')
    //     .doc('$userID$accomodationUserId')
    //     .set({}, SetOptions(merge: true));
    // MainController.to.currentUserId = userID;
    currentUserID = userID;
    accomodationUserID = accomodationUserId;
    model = modell;
    notifyListeners();
  }

  sendUserMessage(String currentUserID, String accomodationUserID,
      AccommodationModel accomodation) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserID)
        .collection('messagedUsers')
        .doc(accomodationUserID)
        .set({
      'firstName': accomodation.user?.firstName,
      'lastName': accomodation.user?.lastName,
      'latestMessage': "i'm good thanu how are you?",
      'lastMessageDateTime': DateTime.now().millisecondsSinceEpoch.toString(),
      'readMessageCount': 0,
    }, SetOptions(merge: true));
  }
}
