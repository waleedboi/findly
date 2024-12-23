class Gig {
  final String? id;
  final String? name;
  final String? description;
  final int? price;
  final String? regions;
  final int? businessNumber;
  final List<String>? portfolio;
  final int? views;
  final bool? isActive;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;
  final GigUser? user;

  Gig({
    this.id,
    this.name,
    this.description,
    this.price,
    this.regions,
    this.businessNumber,
    this.portfolio,
    this.views,
    this.isActive,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.user,
  });

  factory Gig.fromJson(Map<String, dynamic> json) {
    return Gig(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      regions: json['regions'],
      businessNumber: json['businessNumber'],
      portfolio: json['portfolio'] != null
          ? List<String>.from(json['portfolio'])
          : null,
      views: json['views'],
      isActive: json['isActive'],
      status: json['status'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      userId: json['UserId'],
      user: json['User'] != null ? GigUser.fromJson(json['User']) : null,
    );
  }
}

class GigUser {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? username;
  final String? role;
  final String? imageUrl;

  GigUser({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.username,
    this.role,
    this.imageUrl,
  });

  factory GigUser.fromJson(Map<String, dynamic> json) {
    return GigUser(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      username: json['username'],
      role: json['role'],
      imageUrl: json['imageUrl'],
    );
  }
}
