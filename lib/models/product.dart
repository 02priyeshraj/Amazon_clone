import 'dart:convert';

class Product {
  final String name;
  final String description;
  final double quantity;
  final double price;
  final List<String> images;
  final String category;
  final String? id;

  Product({
    required this.name,
    required this.description,
    required this.quantity,
    required this.price,
    required this.images,
    required this.category,
    this.id,
  });

  List<String> get getImages => images;
  String get getName => name;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'price': price,
      'images': images,
      'category': category,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}