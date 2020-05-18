class Company {
  int id;
  String title;
  String description;
  String img;

  Company({this.id, this.title, this.description, this.img});

  Company.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    title = json['title'];
    description = json['description'];
    img = json['img'];
  }
}
