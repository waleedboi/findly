import 'package:flutter/material.dart';

class MapScreenViewmodel extends ChangeNotifier {
  double sliderValue = 10.0;

  void onSliderChanged(double value) {
    sliderValue = value;
    notifyListeners();
  }
}
