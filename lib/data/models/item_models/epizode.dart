import 'serie.dart';

class Epizode {
  int epizodeId;
  String epizodeTitle;
  List<Serie> series;

  Epizode({this.epizodeId, this.epizodeTitle, this.series});

  Epizode.fromJson(Map<String, dynamic> json) {
    epizodeId = json['epizodeId'];
    epizodeTitle = json['epizodeTitle'];
    if (json['series'] != null) {
      series = List<Serie>();
      json['series'].forEach((v) {
        series.add(Serie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['epizodeId'] = this.epizodeId;
    data['epizodeTitle'] = this.epizodeTitle;
    if (this.series != null) {
      data['series'] = this.series.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
