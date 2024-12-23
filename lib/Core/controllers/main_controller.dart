// import 'package:findly/Models/AccommodationModels/accommodation_model.dart';
import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommodationHome/AccomodationModel/accomodation_api_model.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  String currentUserFirstName = '';
  String currentUserLastName = '';
  String currentUserId = '';
  AccommodationData? accommodationListModel;
  Accommodation? singleAccomodation;
}
