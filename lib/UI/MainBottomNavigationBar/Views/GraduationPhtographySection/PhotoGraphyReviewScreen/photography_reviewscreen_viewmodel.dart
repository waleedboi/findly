import 'package:flutter/material.dart';

import 'photography_reviewscreen.dart';

class PhotographyReviewscreenViewmodel extends ChangeNotifier {
  void toggleExpanded(int index) {
    reviewsList[index].isExpanded = !reviewsList[index].isExpanded;
    notifyListeners();
  }
}
