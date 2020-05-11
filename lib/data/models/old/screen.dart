class Screen {
  String screenId;
  String screenTitle;
  String screenLink;
  String screenOldUrl;
  String screenSize;
  String screenSourceId;

  Screen(
      {this.screenId,
      this.screenTitle,
      this.screenLink,
      this.screenOldUrl,
      this.screenSize,
      this.screenSourceId});

  Screen.fromJson(Map<String, dynamic> json) {
    screenId = json['screenId'];
    screenTitle = json['screenTitle'];
    screenLink = json['screenLink'];
    screenOldUrl = json['screenOldUrl'];
    screenSize = json['screenSize'];
    screenSourceId = json['screenSourceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['screenId'] = this.screenId;
    data['screenTitle'] = this.screenTitle;
    data['screenLink'] = this.screenLink;
    data['screenOldUrl'] = this.screenOldUrl;
    data['screenSize'] = this.screenSize;
    data['screenSourceId'] = this.screenSourceId;
    return data;
  }
}
