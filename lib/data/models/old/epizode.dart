class Epizode {
  String epizodeId;
  String epizodeTitle;
  String epizodeSourceId;

  Epizode({this.epizodeId, this.epizodeTitle, this.epizodeSourceId});

  Epizode.fromJson(Map<String, dynamic> json) {
    epizodeId = json['epizodeId'];
    epizodeTitle = json['epizodeTitle'];
    epizodeSourceId = json['epizodeSourceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['epizodeId'] = this.epizodeId;
    data['epizodeTitle'] = this.epizodeTitle;
    data['epizodeSourceId'] = this.epizodeSourceId;
    return data;
  }
}
