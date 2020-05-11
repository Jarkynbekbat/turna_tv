class Film {
  String filmId;
  String filmTitle;
  String filmLink;
  String filmSize;
  String filmSourceId;

  Film(
      {this.filmId,
      this.filmTitle,
      this.filmLink,
      this.filmSize,
      this.filmSourceId});

  Film.fromJson(Map<String, dynamic> json) {
    filmId = json['filmId'];
    filmTitle = json['filmTitle'];
    filmLink = json['filmLink'];
    filmSize = json['filmSize'];
    filmSourceId = json['filmSourceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filmId'] = this.filmId;
    data['filmTitle'] = this.filmTitle;
    data['filmLink'] = this.filmLink;
    data['filmSize'] = this.filmSize;
    data['filmSourceId'] = this.filmSourceId;
    return data;
  }
}
