class People {
  int peopleId;
  String name;
  String img;
  Null gender;
  int postId;
  String postTitle;

  People({
    this.peopleId,
    this.name,
    this.img,
    this.gender,
    this.postId,
    this.postTitle,
  });

  People.fromJson(Map<String, dynamic> json) {
    peopleId = json['people_id'];
    name = json['name'];
    img = json['img'];
    gender = json['gender'];
    postId = json['post_id'];
    postTitle = json['postTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['people_id'] = this.peopleId;
    data['name'] = this.name;
    data['img'] = this.img;
    data['gender'] = this.gender;
    data['post_id'] = this.postId;
    data['postTitle'] = this.postTitle;
    return data;
  }
}
