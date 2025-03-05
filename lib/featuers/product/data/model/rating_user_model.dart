class RatingUserModel {
  final String id;
  final String name;
  final String image;
  final num rating;

  RatingUserModel({
    required this.id,
    required this.name,
    required this.image,
    required this.rating,
  });

  factory RatingUserModel.fromJson(Map<String, dynamic> json) {
    return RatingUserModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      rating: json['rating'],
    );
  }
  toJson() {
    return {'id': id, 'name': name, 'image': image, 'rating': rating};
  }
}
