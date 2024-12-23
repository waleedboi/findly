import 'package:findly/Constant/assets_constant.dart';
import 'package:findly/Constant/enum.dart';

class ListingModel {
  String? title;
  String? location;
  String? price;
  String? rating;
  String? status;
  String? image;
  ServiceType? serviceType;

  ListingModel({
    this.location,
    this.price,
    this.rating,
    this.status,
    this.image,
    this.serviceType,
    this.title,
  });
}

