class AddGigModel {
  final String? name;
  final String? description;
  final int? price;
  final String? regions;
  final int? businessNumber;
  final List<String>? portfolio;

  AddGigModel({
    this.name,
    this.description,
    this.price,
    this.regions,
    this.businessNumber,
    this.portfolio,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'regions': regions,
      'businessNumber': businessNumber,
      'portfolio': portfolio,
    };
  }
}
