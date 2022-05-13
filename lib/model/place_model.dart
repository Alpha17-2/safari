class PlaceModel {
  final String id;
  final String title;
  final List<dynamic> images;
  final String description;
  final String location;
  final String type;
  final bool topTrip;
  final List<dynamic> savedBy;

  PlaceModel(
      {required this.description,
      required this.id,
      required this.savedBy,
      required this.topTrip,
      required this.images,
      required this.location,
      required this.type,
      required this.title});

  toogleSaveStatus(String id) {
    (savedBy.contains(id)) ? savedBy.remove(id) : savedBy.add(id);
  }

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
        topTrip: json['topTrip'],
        type: json['type'],
        savedBy: json['savedBy'] ?? [],
        description: json['description'],
        id: json['id'],
        images: json['images'],
        location: json['location'],
        title: json['title']);
  }
}
