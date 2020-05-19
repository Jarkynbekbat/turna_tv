class Serie {
  int id;
  String title;
  String url;
  String img;
  int zindex;

  Serie({this.id, this.title, this.url, this.img, this.zindex});

  Serie.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    title = json['title'];
    url = json['url'];
    img = json['img'];
    zindex = int.parse(json['zindex']);
  }
}
