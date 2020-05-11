class Follow {
  String followId;
  String followUserId;
  String followPriceId;
  String followDateAdd;
  String followDateEnd;

  Follow(
      {this.followId,
      this.followUserId,
      this.followPriceId,
      this.followDateAdd,
      this.followDateEnd});

  Follow.fromJson(Map<String, dynamic> json) {
    followId = json['followId'];
    followUserId = json['followUserId'];
    followPriceId = json['followPriceId'];
    followDateAdd = json['followDateAdd'];
    followDateEnd = json['followDateEnd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followId'] = this.followId;
    data['followUserId'] = this.followUserId;
    data['followPriceId'] = this.followPriceId;
    data['followDateAdd'] = this.followDateAdd;
    data['followDateEnd'] = this.followDateEnd;
    return data;
  }
}
