import 'serie.dart';

class Epizode {
  int epizodeId;
  String epizodeName;
  List<Serie> series;

  Epizode({this.epizodeId, this.epizodeName, this.series});

  Epizode.fromJson(Map<String, dynamic> json) {
    epizodeId = int.parse(json['epizodeId']);
    epizodeName = json['epizodeName'];
    if (json['series'] != null) {
      series = List<Serie>();
      json['series'].forEach((v) {
        series.add(Serie.fromJson(v));
      });
    }
  }
}
