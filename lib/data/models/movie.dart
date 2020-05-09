class Movie {
  String movieId;
  String movieTitle;
  String movieProducer;
  String movieDetail;
  String movieShortInfo;
  String movieLanguage;
  String movieDuration;
  String movieAge;
  String movieYear;

  Movie(
      {this.movieId,
      this.movieTitle,
      this.movieProducer,
      this.movieDetail,
      this.movieShortInfo,
      this.movieLanguage,
      this.movieDuration,
      this.movieAge,
      this.movieYear});

  Movie.fromJson(Map<String, dynamic> json) {
    movieId = json['movieId'];
    movieTitle = json['movieTitle'];
    movieProducer = json['movieProducer'];
    movieDetail = json['movieDetail'];
    movieShortInfo = json['movieShortInfo'];
    movieLanguage = json['movieLanguage'];
    movieDuration = json['movieDuration'];
    movieAge = json['movieAge'];
    movieYear = json['movieYear'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movieId'] = this.movieId;
    data['movieTitle'] = this.movieTitle;
    data['movieProducer'] = this.movieProducer;
    data['movieDetail'] = this.movieDetail;
    data['movieShortInfo'] = this.movieShortInfo;
    data['movieLanguage'] = this.movieLanguage;
    data['movieDuration'] = this.movieDuration;
    data['movieAge'] = this.movieAge;
    data['movieYear'] = this.movieYear;
    return data;
  }
}
