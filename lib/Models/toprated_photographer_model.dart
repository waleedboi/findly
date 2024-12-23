import 'package:findly/Constant/assets_constant.dart';

class TopRatedPhotographerModel {
  final String? name;
  final String? price;
  final String? rating;
  final String? image;
  final String? location;

  final bool? isRated;
  final String? totalRating;

  TopRatedPhotographerModel(
      {this.name,
      this.price,
      this.rating,
      this.image,
      this.isRated,
      this.totalRating,
      this.location});
}

List<TopRatedPhotographerModel> topRatedPhotographer = [
  TopRatedPhotographerModel(
    name: "TDE Photography",
    price: "R800",
    rating: "4.9",
    location: "Johannesburg",
    image: image5,
    isRated: true,
  ),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "R750",
      rating: "5.0",
      location: "Johannesburg",
      isRated: false,
      image: image5),
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "R800",
      rating: "4.9",
      location: "Johannesburg",
      isRated: false,
      image: image5),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "R750",
      rating: "5.0",
      location: "Johannesburg",
      isRated: true,
      image: image5),
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "R800",
      rating: "4.9",
      location: "Johannesburg",
      isRated: true,
      image: image5),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "R750",
      rating: "5.0",
      location: "Johannesburg",
      isRated: true,
      image: image5),
];

List<TopRatedPhotographerModel> topRatedPhotographerresult = [
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      isRated: false,
      image: photography2),
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "From R800",
      rating: "4.9",
      isRated: false,
      image: photography1),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      isRated: true,
      image: photography2),
  TopRatedPhotographerModel(
      name: "TDE Photography",
      price: "From R800",
      rating: "4.9",
      isRated: true,
      image: photography1),
  TopRatedPhotographerModel(
      name: "XY Pictures",
      price: "From R750",
      rating: "5.0",
      isRated: true,
      image: photography2),
];
