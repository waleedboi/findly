class GetUserGigsModel {
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

  GetUserGigsModel({
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
  });

  // Factory method to create a Gig from JSON
  factory GetUserGigsModel.fromJson(Map<String, dynamic> json) {
    return GetUserGigsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      regions: json['regions'],
      businessNumber: json['businessNumber'],
      portfolio: List<String>.from(json['portfolio']),
      views: json['views'],
      isActive: json['isActive'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      userId: json['UserId'],
    );
  }

  // Method to convert a Gig to JSON
}
