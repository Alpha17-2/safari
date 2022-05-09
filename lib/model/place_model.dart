class PlaceModel {
  final String id;
  final String title;
  final List<dynamic> images;
  final String description;
  final String location;
  final String type;
  final bool topTrip;

  PlaceModel(
      {required this.description,
      required this.id,
      required this.topTrip,
      required this.images,
      required this.location,
      required this.type,
      required this.title});

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      topTrip: json['topTrip'],
        type: json['type'],
        description: json['description'],
        id: json['id'],
        images: json['images'],
        location: json['location'],
        title: json['title']);
  }
}
