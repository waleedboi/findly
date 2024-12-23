import 'package:findly/Constant/enum.dart';

import '../Constant/assets_constant.dart';

class BookMarkModel {
  String? title;
  String? location;
  String? price;
  String? rating;
  String? status;
  String? image;
  ServiceType? serviceType;

  BookMarkModel({
    this.location,
    this.price,
    this.rating,
    this.status,
    this.image,
    this.serviceType,
    this.title,
  });
}

List<BookMarkModel> bookMarkList2 = [
  BookMarkModel(
    location: "Westdene, Johannesburg",
    price: "From R5000",
    rating: "4.5",
    status: "Available",
    image: hostelimage1,
    serviceType: ServiceType.accommodation,
  ),
  BookMarkModel(
    title: "TDE Photography",
    location: "Westdene, Johannesburg",
    price: "From R5000",
    rating: "4.5",
    image: hostelimage1,
    serviceType: ServiceType.photography,
  ),
  BookMarkModel(
    title: "Accounting Textbook",
    location: "Westdene, Johannesburg",
    price: "From R5000",
    rating: "4.5",
    image: hostelimage2,
    serviceType: ServiceType.marketplace,
  ),
  BookMarkModel(
    location: "Westdene, Johannesburg",
    price: "From R5000",
    rating: "4.5",
    status: "Unavailable",
    image: hostelimage1,
    serviceType: ServiceType.accommodation,
  ),
];
