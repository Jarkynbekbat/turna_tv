class Scenarist {
  String id;
  String name;
  Scenarist({this.id, this.name});
  Scenarist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
