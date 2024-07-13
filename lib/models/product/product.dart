

import 'package:timbu_shop2/models/product/photo.dart';
import 'package:timbu_shop2/models/product/price.dart';

import 'category.dart';

class Product {
  final String? name;
  final List<Photo>? photos;
  final List<Price>? current_price;
  final List<Category>? categories;
  final String? description;
  final String? unique_id;

  Product({
    required this.name,
    required this.photos,
    required this.current_price,
    required this.description,
    required this.unique_id,
    required this.categories
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        name: json['name'],
        categories: (json["categories"] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        photos: (json["photos"] as List<dynamic>?)
            ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
            .toList(),
        current_price: (json["current_price"] as List<dynamic>?)
            ?.map((e) => Price.fromJson(e as Map<String, dynamic>))
            .toList(),
        description: json["description"],
        unique_id: json["unique_id"]);
  }
}
