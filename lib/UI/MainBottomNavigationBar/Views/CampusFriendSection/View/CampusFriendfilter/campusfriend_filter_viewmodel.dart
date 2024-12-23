import 'package:flutter/material.dart';

class CampusfriendFilterViewmodel extends ChangeNotifier {
  List<bool> facultyValues = [true, false, false, false, false, false];
  List<String> facultyLabels = [
    "Medicine",
    "Accounting",
    "Economics",
    "Finance",
    "Education",
    "E.T.C"
  ];

  void onFacultyChanged(int index, bool? value) {
    for (int i = 0; i < facultyValues.length; i++) {
      facultyValues[i] = i == index ? value ?? false : false;
    }
    notifyListeners();
  }

  List<bool> gender = [true, false, false];
  List<String> genderLabels = [
    "Male",
    "Female",
    "Other",
  ];
}
