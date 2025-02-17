class ProductModel {
  String? status;
  Data? data;

  ProductModel({this.status, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? headerImage;
  String? entertainImage;
  List<Products>? products;
  List<Games>? games;
  List<Addresses>? addresses;

  Data(
      {this.headerImage,
        this.entertainImage,
        this.products,
        this.games,
        this.addresses});

  Data.fromJson(Map<String, dynamic> json) {
    headerImage = json['header_image'];
    entertainImage = json['entertain_image'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    if (json['games'] != null) {
      games = <Games>[];
      json['games'].forEach((v) {
        games!.add(new Games.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header_image'] = this.headerImage;
    data['entertain_image'] = this.entertainImage;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.games != null) {
      data['games'] = this.games!.map((v) => v.toJson()).toList();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  double? price;
  String? image;
  String? category;
  bool? inStock;
  double? ratings;

  Products(
      {this.id,
        this.name,
        this.price,
        this.image,
        this.category,
        this.inStock,
        this.ratings});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    category = json['category'];
    inStock = json['in_stock'];
    ratings = json['ratings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['category'] = this.category;
    data['in_stock'] = this.inStock;
    data['ratings'] = this.ratings;
    return data;
  }
}

class Games {
  int? id;
  String? title;
  String? genre;
  String? platform;
  double? price;

  Games({this.id, this.title, this.genre, this.platform, this.price});

  Games.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    genre = json['genre'];
    platform = json['platform'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['genre'] = this.genre;
    data['platform'] = this.platform;
    data['price'] = this.price;
    return data;
  }
}

class Addresses {
  int? id;
  String? street;
  String? city;
  String? zip;

  Addresses({this.id, this.street, this.city, this.zip});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    street = json['street'];
    city = json['city'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['street'] = this.street;
    data['city'] = this.city;
    data['zip'] = this.zip;
    return data;
  }
}