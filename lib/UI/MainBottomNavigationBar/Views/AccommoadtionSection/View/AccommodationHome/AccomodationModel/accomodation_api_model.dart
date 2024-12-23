class AccommodationResponse {
  final AccommodationData data;

  AccommodationResponse({required this.data});

  factory AccommodationResponse.fromJson(Map<String, dynamic> json) {
    return AccommodationResponse(
      data: AccommodationData.fromJson(json['data']),
    );
  }
}

class AccommodationData {
  final int total;
  final String page;
  final String limit;
  final List<Accommodation> accommodations;

  AccommodationData({
    required this.total,
    required this.page,
    required this.limit,
    required this.accommodations,
  });

  factory AccommodationData.fromJson(Map<String, dynamic> json) {
    var accommodationsList = json['accommodations'] as List;
    List<Accommodation> accommodations =
        accommodationsList.map((i) => Accommodation.fromJson(i)).toList();

    return AccommodationData(
      total: json['total'],
      page: json['page'],
      limit: json['limit'],
      accommodations: accommodations,
    );
  }
}

class Accommodation {
  final String id;
  final String title;
  final String reference;
  final String category;
  final String location;
  final String tenantType;
  final String description;
  final bool isActive;
  final List<String> amenities;
  final List<String> images;
  final String roomTypes;
  final int price;
  final String availability;
  final int views;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String userId;
  final User user;

  Accommodation({
    required this.id,
    required this.title,
    required this.reference,
    required this.category,
    required this.location,
    required this.tenantType,
    required this.description,
    required this.isActive,
    required this.amenities,
    required this.images,
    required this.roomTypes,
    required this.price,
    required this.availability,
    required this.views,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.user,
  });

  factory Accommodation.fromJson(Map<String, dynamic> json) {
    return Accommodation(
      id: json['id'],
      title: json['title'],
      reference: json['reference'],
      category: json['category'],
      location: json['location'],
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
      user: User.fromJson(json['User']),
    );
  }
}

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String role;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.role,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      username: json['username'],
      role: json['role'],
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
