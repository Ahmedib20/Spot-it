import 'package:spot_it/model/place.dart';

class LandMarks implements Place {
  @override
  String? address;

  @override
  String? category;

  @override
  String? description;

  @override
  String? imageUrl;

  @override
  double? latitude;

  @override
  double? longitude;

  @override
  String? placeName;
  @override
  double? rating;
  @override
  bool? isLiked;

  LandMarks({
    required this.placeName,
    required this.address,
    this.category = 'Landmarks',
    required this.description,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    required this.rating,
    this.isLiked = false,
  });
  factory LandMarks.fromJson(Map<String, dynamic> json) {
    final name = json['placeName'] ?? 'Unknown Place';
    final description = json['description'] ?? 'No description';
    final imageUrl = json['imageUrl'] ?? 'Unavailable image';
    final address = json['address'] ?? 'Unavailable address';
    final latitude = json['latitude'].toDouble() ?? 0.0;
    final longitude = json['longitude'].toDouble() ?? 0.0;
    final rating = json['ratings'].toDouble() ?? 0.0;
    final isLiked = json['isLiked'] ?? false;
    isLiked as bool;

    return LandMarks(
      placeName: name,
      address: address,
      description: description,
      longitude: longitude,
      latitude: latitude,
      imageUrl: imageUrl,
      rating: rating,
      isLiked: isLiked,
    );
  }
}
