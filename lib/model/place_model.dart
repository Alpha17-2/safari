class PlaceModel {
  final String id;
  final String title;
  final List<dynamic> images;
  final String description;
  final String location;

  PlaceModel(
      {required this.description,
      required this.id,
      required this.images,
      required this.location,
      required this.title});

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
        description: json['description'],
        id: json['id'],
        images: json['images'],
        location: json['location'],
        title: json['title']);
  }
}
