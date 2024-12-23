class AmenitiesWidgetModel {
  final String image;
  final double imageHeight;
  final double imageWidth;
  final String text;
  final bool isSeeAll;
  final Function onSeeAllTap;

  AmenitiesWidgetModel({
    required this.image,
    required this.imageHeight,
    required this.imageWidth,
    required this.text,
    this.isSeeAll = false,
    required this.onSeeAllTap,
  });
}
