import 'package:flutter/material.dart';

class MessagesViewmodel extends ChangeNotifier {
  List<bool> messageValue = [true, false, false];
  List<String> messagesLable = [
    "All",
    "Campus Marketplace",
    "Accommodations",
  ];

  void updateSelectedIndex(int index) {
    for (int i = 0; i < messageValue.length; i++) {
      messageValue[i] = i == index ? true : false;
    }
    notifyListeners();
  }
}
