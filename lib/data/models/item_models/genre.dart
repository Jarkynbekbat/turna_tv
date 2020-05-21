class Genre {
  int id;
  String title;
  int categoryId;

  Genre({this.id, this.title, this.categoryId});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['categoryId'] = this.categoryId;
    return data;
  }
}
