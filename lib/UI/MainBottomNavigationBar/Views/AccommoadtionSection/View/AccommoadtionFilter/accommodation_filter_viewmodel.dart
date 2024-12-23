import 'package:flutter/material.dart';

class AccommodationFilterViewmodel extends ChangeNotifier {
  // Category selection
  List<bool> catagoryValues = [true, false, false, false];
  List<String> catagoryLabels = ["NSFAS", "Communes", "Apartments", "Flats"];

  void onCategoryChanged(int index, bool? value) {
    // Allow multiple selections for categories
    catagoryValues[index] = value ?? false;
    notifyListeners();
  }

  // Room Type selection
  List<bool> roomtypesvalues = [true, false, false, false, false, false];
  List<String> roomtypeLabels = [
    "Single Room",
    "Sharing",
    "Bachelor",
    "Cottage",
    "Ensuite",
    "Studio"
  ];

  void onRoomTypeChanged(int index, bool? value) {
    roomtypesvalues[index] =
        value ?? false; // Allow multiple selections for room types
    notifyListeners();
  }

  // Amenities selection
  List<bool> anenitiesValues =
      List.filled(14, false); // Update to match the new count
  List<String> anenitiesLabels = [
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
    "Air Conditioning",
  ];

  void onAmenitiesChanged(int index, bool? value) {
    // Allow multiple selections for amenities
    anenitiesValues[index] = value ?? false;
    notifyListeners();
  }

  // Availability selection
  List<bool> availabilityValues = [true, false];
  List<String> availabilityLabels = ["Show all", "Only show available"];

  void onAvailabilityChanged(int index, bool? value) {
    // Allow multiple selections for availability
    availabilityValues[index] = value ?? false;
    notifyListeners();
  }

  // Tenant Type selection
  List<bool> tenantTypeValues = [true, false, false];
  List<String> tenantTypeLabels = [
    "Male only",
    "Female only",
    "Unisex",
  ];

  void onTenantTypeChanged(int index, bool? value) {
    // Allow multiple selections for tenant types
    tenantTypeValues[index] = value ?? false;
    notifyListeners();
  }
}
