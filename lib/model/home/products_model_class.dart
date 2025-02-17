class Product {
  final int id;
  final String name;
  final double? price;
  final String image;
  final String category;
  final bool inStock;
  final double ratings;

  Product({
    required this.id,
    required this.name,
    this.price,
    required this.image,
    required this.category,
    required this.inStock,
    required this.ratings,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num?)?.toDouble(),
      image: json['image'],
      category: json['category'],
      inStock: json['in_stock'],
      ratings: (json['ratings'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'category': category,
      'in_stock': inStock,
      'ratings': ratings,
    };
  }
}
