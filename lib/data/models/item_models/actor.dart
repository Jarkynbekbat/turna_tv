class Actor {
  int id;
  String name;
  String img;
  String gender;

  Actor({this.id, this.name, this.img, this.gender});

  Actor.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    name = json['name'];
    img = json['img'];
    gender = json['gender'];
  }
}
