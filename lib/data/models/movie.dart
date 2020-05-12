class Movie {
  String title;
  String producer;
  String detail;
  String shortInfo;
  String language;
  String duration;
  String age;
  int year;
  String categoryId;
  String categoryName;
  String genreId;
  String genreName;
  String smallImgUrl;
  String bigImgUrl;
  String trailerUrl;
  String movieUrl;
  List<dynamic> screenImg = [];

  Movie(
      {this.title,
      this.producer,
      this.detail,
      this.shortInfo,
      this.language,
      this.duration,
      this.age,
      this.year,
      this.categoryId,
      this.categoryName,
      this.genreId,
      this.genreName,
      this.smallImgUrl,
      this.bigImgUrl,
      this.trailerUrl,
      this.movieUrl,
      this.screenImg});

  bool isNew() => this.year == DateTime.now().year ? true : false;

  Movie.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    producer = json['producer'];
    detail = json['detail'];
    shortInfo = json['shortInfo'];
    language = json['language'];
    duration = json['duration'];
    age = json['age'];
    year = int.parse(json['year']);
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    genreId = json['genreId'];
    genreName = json['genreName'];
    smallImgUrl = json['smallImgUrl'];
    bigImgUrl = json['bigImgUrl'];
    trailerUrl = json['trailerUrl'];
    movieUrl = json['movieUrl'];

    if (json['screenImg'] != null) {
      json['screenImg'].forEach((v) {
        screenImg.add(v.toString());
      });
    } else {
      screenImg = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['producer'] = this.producer;
    data['detail'] = this.detail;
    data['shortInfo'] = this.shortInfo;
    data['language'] = this.language;
    data['duration'] = this.duration;
    data['age'] = this.age;
    data['year'] = this.year;
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    data['genreId'] = this.genreId;
    data['genreName'] = this.genreName;
    data['smallImgUrl'] = this.smallImgUrl;
    data['bigImgUrl'] = this.bigImgUrl;
    data['trailerUrl'] = this.trailerUrl;
    data['movieUrl'] = this.movieUrl;
    data['screenImg'] = this.screenImg;
    return data;
  }
}
