class PlaceModel {
  final String id;
  final String title;
  final List<dynamic> images;
  final String description;
  final String location;
  final String type;
  final bool topTrip;
  final List<dynamic> likedBy;

  PlaceModel(
      {required this.description,
      required this.id,
      required this.likedBy,
      required this.topTrip,
      required this.images,
      required this.location,
      required this.type,
      required this.title});

  toggleLikeStatus(String id) {
    (likedBy.contains(id)) ? likedBy.remove(id) : likedBy.add(id);
  }

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
        topTrip: json['topTrip'],
        type: json['type'],
        likedBy: json['likedBy'] ?? [],
        description: json['description'],
        id: json['id'],
        images: json['images'],
        location: json['location'],
        title: json['title']);
  }
}
