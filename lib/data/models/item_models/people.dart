class People {
  int peopleId;
  String name;
  String img;
  int postId;
  String title;

  People({this.peopleId, this.name, this.img, this.postId, this.title});

  People.fromJson(Map<String, dynamic> json) {
    peopleId = int.parse(json['people_id']);
    name = json['name'];
    img = json['img'];
    postId = int.parse(json['post_id']);
    title = json['title'];
  }
}
