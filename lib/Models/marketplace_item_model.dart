class ProductListingModel {
  final String? title;
  final int? price;
  final String? category;
  final String? condition;
  final String? description;
  final String? place;
  final List<String>? images;
  final String? status; // Add this line

  ProductListingModel(
      {this.title,
      this.price,
      this.category,
      this.condition,
      this.description,
      this.place,
      this.images,
      this.status});

  // Convert the model to a JSON-compatible map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'category': category,
      'condition': condition,
      'description': description,
      'place': place,
      'images': images,
    };
  }

  // Create an instance from a JSON map
  factory ProductListingModel.fromJson(Map<String, dynamic> json) {
    return ProductListingModel(
      title: json['title'] as String?,
      price: json['price'] as int?,
      category: json['category'] as String?,
      condition: json['condition'] as String?,
      description: json['description'] as String?,
      place: json['place'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }
}
