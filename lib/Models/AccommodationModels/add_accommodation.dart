class AddAccommodationModel {
  String? title;
  String? reference;
  String? category;
  String? location;
  String? tenantType;
  String? description;
  List<String>? amenities;
  List<String>? images;
  String? roomTypes;
  int? price;
  String? availability;

  AddAccommodationModel({
    this.title,
    this.reference,
    this.category,
    this.location,
    this.tenantType,
    this.description,
    this.amenities,
    this.images,
    this.roomTypes,
    this.price,
    this.availability,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "reference": reference,
      "category": category,
      "location": location,
      "tenantType": tenantType,
      "description": description,
      "amenities": amenities,
      "images": images ?? [],
      "roomTypes": roomTypes,
      "price": price,
      "availility": availability,
    };
  }
}
