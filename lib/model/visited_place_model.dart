class VisitedPlaceModel {
  final String id;
  final String title;
  final List<dynamic> images;
  final String description;
  final String location;
  final DateTime dateTime;

  VisitedPlaceModel(
      {required this.description,
      required this.id,
      required this.dateTime,
      required this.images,
      required this.location,
      required this.title});

  factory VisitedPlaceModel.fromJson(Map<String, dynamic> json) {
    return VisitedPlaceModel(
        description: json['description'],
        id: json['id'],
        dateTime: DateTime.parse(json['dateTime']),
        images: json['images'],
        location: json['location'],
        title: json['title']);
  }
}
