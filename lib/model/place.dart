abstract class Place {
  final String? placeName;
  final String? description;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String? imageUrl;
  final String? category;
  final double? rating;
  bool? isLiked;
  Place({
    required this.placeName,
    required this.description,
    required this.address,
    required this.latitude,
    required this.rating,
    required this.longitude,
    required this.imageUrl,
    required this.category,
  });
}
