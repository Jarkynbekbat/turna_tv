class Trailer {
  String trailerId;
  String trailerTitle;
  String trailerLink;
  String trailerSize;
  String trailerSourceId;

  Trailer(
      {this.trailerId,
      this.trailerTitle,
      this.trailerLink,
      this.trailerSize,
      this.trailerSourceId});

  Trailer.fromJson(Map<String, dynamic> json) {
    trailerId = json['trailerId'];
    trailerTitle = json['trailerTitle'];
    trailerLink = json['trailerLink'];
    trailerSize = json['trailerSize'];
    trailerSourceId = json['trailerSourceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['trailerId'] = this.trailerId;
    data['trailerTitle'] = this.trailerTitle;
    data['trailerLink'] = this.trailerLink;
    data['trailerSize'] = this.trailerSize;
    data['trailerSourceId'] = this.trailerSourceId;
    return data;
  }
}
