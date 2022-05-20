class UserModel {
  final String? id;
  String? title;
  UserModel(
      { this.title, this.id});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(

      id: json['id'],
      title: json['title'] ?? 'New User',

    );
  }


  setTitle(String newTitle) {
    title = newTitle;
  }
}
