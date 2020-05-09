class Source {
  String sourceId;
  String sourceCategoryId;
  String sourceGenreId;
  String sourceMovieId;
  String sourceType;

  Source(
      {this.sourceId,
      this.sourceCategoryId,
      this.sourceGenreId,
      this.sourceMovieId,
      this.sourceType});

  Source.fromJson(Map<String, dynamic> json) {
    sourceId = json['sourceId'];
    sourceCategoryId = json['sourceCategoryId'];
    sourceGenreId = json['sourceGenreId'];
    sourceMovieId = json['sourceMovieId'];
    sourceType = json['sourceType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sourceId'] = this.sourceId;
    data['sourceCategoryId'] = this.sourceCategoryId;
    data['sourceGenreId'] = this.sourceGenreId;
    data['sourceMovieId'] = this.sourceMovieId;
    data['sourceType'] = this.sourceType;
    return data;
  }
}
