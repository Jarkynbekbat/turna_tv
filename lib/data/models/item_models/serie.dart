class Serie {
  int id;
  String title;
  String img;
  String url;
  String zindex;

  Serie({this.id, this.title, this.img, this.url, this.zindex});

  Serie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
    url = json['url'];
    zindex = json['zindex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['img'] = this.img;
    data['url'] = this.url;
    data['zindex'] = this.zindex;

    return data;
  }
}
