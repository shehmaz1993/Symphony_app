class SocialSectionModel {
  String? status;
  Data? data;

  SocialSectionModel({this.status, this.data});

  SocialSectionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? modelName;
  String? modelImage;
  String? validity;
  String? expireDate;
  List<Games>? games;

  Data(
      {this.modelName,
        this.modelImage,
        this.validity,
        this.expireDate,
        this.games});

  Data.fromJson(Map<String, dynamic> json) {
    modelName = json['model_name'];
    modelImage = json['model_image'];
    validity = json['validity'];
    expireDate = json['expire_date'];
    if (json['games'] != null) {
      games = <Games>[];
      json['games'].forEach((v) {
        games!.add(Games.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model_name'] = modelName;
    data['model_image'] = modelImage;
    data['validity'] = validity;
    data['expire_date'] = expireDate;
    if (games != null) {
      data['games'] = games!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Games {
  int? id;
  String? title;
  String? image;
  String? genre;
  String? platform;
  double? price;

  Games(
      {this.id, this.title, this.image, this.genre, this.platform, this.price});

  Games.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    genre = json['genre'];
    platform = json['platform'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['genre'] = genre;
    data['platform'] = platform;
    data['price'] = price;
    return data;
  }
}
