class Serie {
  String serieId;
  String serieTitle;
  String serieLink;
  String serieSize;
  String serieNumb;

  Serie(
      {this.serieId,
      this.serieTitle,
      this.serieLink,
      this.serieSize,
      this.serieNumb});

  Serie.fromJson(Map<String, dynamic> json) {
    serieId = json['serieId'];
    serieTitle = json['serieTitle'];
    serieLink = json['serieLink'];
    serieSize = json['serieSize'];
    serieNumb = json['serieNumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serieId'] = this.serieId;
    data['serieTitle'] = this.serieTitle;
    data['serieLink'] = this.serieLink;
    data['serieSize'] = this.serieSize;
    data['serieNumb'] = this.serieNumb;
    return data;
  }
}
