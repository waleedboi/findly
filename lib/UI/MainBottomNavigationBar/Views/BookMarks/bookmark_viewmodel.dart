import 'package:findly/Models/bookmark_model.dart';
import 'package:flutter/material.dart';

class BookmarkViewmodel extends ChangeNotifier {
  //remove item from list at index

  void removeItem(int index) {
    bookMarkList2.removeAt(index);
    notifyListeners();
  }
}
