import 'package:findly/UI/MainBottomNavigationBar/Views/AccommoadtionSection/View/AccommodationHome/AccomodationModel/accomodation_api_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constant/assets_constant.dart';

class Categories {
  final String? text;
  final String? image;
  final double? height;
  final double? width;
  final double? textwidth;
  bool? isSelected;

  Categories(
      {this.text,
      this.image,
      this.height,
      this.width,
      this.textwidth,
      this.isSelected});
}

List<Categories> categories = [
  Categories(
      text: "All",
      image: allround,
      height: 36.h,
      width: 33.85.w,
      isSelected: true),
  Categories(
      text: "Communes",
      image: communes,
      height: 36.h,
      width: 33.85.w,
      isSelected: false),
  Categories(
      text: "NSFAS",
      image: nsfas,
      height: 35.h,
      width: 30.39.w,
      isSelected: false),
  Categories(
      text: "Apartments",
      image: appartment,
      height: 33.h,
      width: 33.05.w,
      isSelected: false),
  // Categories(
  //     text: "Flats",
  //     image: flats,
  //     height: 33.h,
  //     width: 31.63.w,
  //     isSelected: false),
];

class AccommodationModel {
  final String? type;
  final String? reference;
  final String? description;
  final List<String> images;
  final String? location;
  final String? price;
  final String? rating;
  final String? gender;
  final String? status;
  final String? category;
  final String? roomTypes;
  final bool isMale;
  final bool isFemale;
  final bool isUnix;
  final bool? isBookmarked;
  final String? title;
  final String? id;
  final List<String> amenities;
  final bool? isRated;
  final bool? isAvailable;
  final User? user;

  AccommodationModel({
    this.reference,
    this.description,
    this.amenities = const [],
    required this.images,
    required this.id,
    this.location,
    this.price,
    this.rating,
    this.status,
    this.gender,
    this.isMale = false,
    this.isFemale = false,
    this.isUnix = false,
    this.isBookmarked = false,
    this.isAvailable = false,
    this.type,
    this.title,
    this.isRated,
    this.category,
    this.roomTypes,
    required this.user,
  });
}

List<AccommodationModel> accomodationList = [];

List<AccommodationModel> marketPlaceBoomark = [];
List<AccommodationModel> topItems = [];

List<AccommodationModel> topItemsReult = [];
List<AccommodationModel> bookMarkList = [];
