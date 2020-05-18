class Genre {
  int id;
  String title;
  int categoryId;

  Genre({this.id, this.title, this.categoryId});

  Genre.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    title = json['title'];
    categoryId = int.parse(json['categoryId']);
  }
}
