class Producer {
  String id;
  String name;

  Producer({this.id, this.name});

  Producer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
