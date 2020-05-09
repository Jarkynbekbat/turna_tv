class Price {
  String priceId;
  String priceTitle;
  String pricePrice;
  String priceDuration;
  String priceWait;
  String priceImg;
  String priceImgTitle;
  String priceTurn;

  Price(
      {this.priceId,
      this.priceTitle,
      this.pricePrice,
      this.priceDuration,
      this.priceWait,
      this.priceImg,
      this.priceImgTitle,
      this.priceTurn});

  Price.fromJson(Map<String, dynamic> json) {
    priceId = json['priceId'];
    priceTitle = json['priceTitle'];
    pricePrice = json['pricePrice'];
    priceDuration = json['priceDuration'];
    priceWait = json['priceWait'];
    priceImg = json['priceImg'];
    priceImgTitle = json['priceImgTitle'];
    priceTurn = json['priceTurn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['priceId'] = this.priceId;
    data['priceTitle'] = this.priceTitle;
    data['pricePrice'] = this.pricePrice;
    data['priceDuration'] = this.priceDuration;
    data['priceWait'] = this.priceWait;
    data['priceImg'] = this.priceImg;
    data['priceImgTitle'] = this.priceImgTitle;
    data['priceTurn'] = this.priceTurn;
    return data;
  }
}
