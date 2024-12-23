import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/OpenAccomodationListing/Widgets/ammenities_footer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Models/AccommodationModels/accommodation_model.dart';

class AccommodationViewmodel extends ChangeNotifier {
  String? selectedCategory;
  String? selectedLocation;
  List<AmmenitiesWidget> amenitiesList = [];

  void onCategoryChanged(int index) {
    for (int i = 0; i < categories.length; i++) {
      if (i == index) {
        selectedCategory = categories[i].text;
        categories[i].isSelected = true;
      } else {
        categories[i].isSelected = false;
      }
    }
    notifyListeners();
  }

  void onLocationChanged(String? location) {
    selectedLocation = location;
    notifyListeners();
  }

  List<bool> isBookmarkedList =
      List.generate(accomodationList.length, (index) => false);

  void toggleBookmark(int index) {
    isBookmarkedList[index] = !isBookmarkedList[index];
    notifyListeners();
  }

  List<bool> ammenitiesvalues = [true, false];
  List<String> ammenitiesLabels = [
    "Ammenities",
    "Reviews",
  ];

  void onAmmenitiesChanged(int index, bool? value) {
    for (int i = 0; i < ammenitiesvalues.length; i++) {
      ammenitiesvalues[i] = i == index ? value ?? false : false;
    }
    notifyListeners();
  }

  bool showAllAmmenities = false;

  void toggleShowAllAmmenities() {
    showAllAmmenities = !showAllAmmenities;
    notifyListeners();
  }

  String seeAllAndSeeLessString(int index) {
    if (index == 2) {
      return 'See All';
    } else if (index == amenitiesList.length - 1) {
      return 'See Less';
    }
    return '';
  }

  bool isSellAndSeeLessShow(int index) {
    return index == 2 && !showAllAmmenities ||
        index == amenitiesList.length - 1 && showAllAmmenities;
  }

  List<AmmenitiesWidget> createAmenitiesList(List<String> amenities) {
    amenitiesList = amenities
        .map(
          (element) => AmmenitiesWidget(
            image: getAmenitiesIcon(element),
            imageHeight: 18.h,
            imageWidth: 18.w,
            text: element,
            seeAllText: '',
          ),
        )
        .toList();

    return amenitiesList;
  }

  String getAmenitiesIcon(String element) {
    final Map<String, String> amenitiesIcons = {
      "Wifi": wifiIcon,
      "Transport": transportIcon,
      "Swimming pool": swimmingIcon,
      "Back-up power": backupIcon,
      "CCTV": cctvIcon,
      "Parking": parkingIcon,
      "Security": securityIcon,
      "Electric fence": electricFenceIcon,
      "Entertainment area": entertainmentIcon,
      "Furnished": furnishedIcon,
      "Washing machine": washingMachineIcon,
      "Cleaning service": cleaningIcon,
      "Garden": gardenIcon,
      "Air conditioning": airConditioningIcon,
    };

    return amenitiesIcons[element] ?? gym;
  }
}
