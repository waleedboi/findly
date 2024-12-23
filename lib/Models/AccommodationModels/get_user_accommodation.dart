class GetuserAccommodation {
  final String? id;
  final String? title;
  final String? reference;
  final String? category;
  final String? location;
  final String? tenantType;
  final String? description;
  final bool? isActive;
  final List<String>? amenities;
  final List<String>? images;
  final String? roomTypes;
  final int? price;
  final String? availability;
  final int? views;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  GetuserAccommodation({
    this.id,
    this.title,
    this.reference,
    this.category,
    this.location,
    this.tenantType,
    this.description,
    this.isActive,
    this.amenities,
    this.images,
    this.roomTypes,
    this.price,
    this.availability,
    this.views,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  // Factory method to create an Accommodation from JSON
  factory GetuserAccommodation.fromJson(Map<String, dynamic> json) {
    return GetuserAccommodation(
      id: json['id'],
      title: json['title'],
      reference: json['reference'],
      category: json['category'],
      location: json['location'] ,
      tenantType: json['tenantType'],
      description: json['description'],
      isActive: json['isActive'],
      amenities: List<String>.from(json['amenities']),
      images: List<String>.from(json['images']),
      roomTypes: json['roomTypes'],
      price: json['price'],
      availability: json['availility'],
      views: json['views'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      userId: json['UserId'],
    );
  }
}
