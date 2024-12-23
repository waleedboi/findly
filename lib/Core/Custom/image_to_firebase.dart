import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;
Future<String> imageToFirebaseStorage(
    {required String imagePath, String? collectionPath}) async {
  String path = collectionPath ?? "UserSignUp/profileImages";
  try {
    final ref1 =
        storage.ref().child("$path${DateTime.now().microsecondsSinceEpoch}");

    final uploadTask1 = await ref1.putFile(File(imagePath));
    final String profileImageUrl = await uploadTask1.ref.getDownloadURL();

    return profileImageUrl;
  } catch (e) {
    log(e.toString());
  }
  return "";
}
