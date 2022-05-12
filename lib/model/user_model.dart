class UserModel {
  final String? id;
  String? docId;
  String? title;
  final List<dynamic>? likedPlaces;
  final List<dynamic>? visitedPlaces;
  UserModel(
      {this.likedPlaces, this.title, this.docId, this.visitedPlaces, this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      likedPlaces: json['likedPlaces'] ?? [],
      id: json['id'],
      docId: json['docId'] ?? 'null',
      title: json['title'] ?? 'New User',
      visitedPlaces: json['visitedPlaces'] ?? [],
    );
  }

  setTitle(String newTitle) {
    title = newTitle;
  }

  setDocId(String newDocId) {
    docId = newDocId;
  }
}
