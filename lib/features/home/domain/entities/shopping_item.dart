import 'package:shopping_list/core/enums/shopping_category.dart';

class ShoppingItem {
  ShoppingItem({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.price,
  });

  factory ShoppingItem.fromJson(Map<String, dynamic> json) {
    return ShoppingItem(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
  final int id;
  final String title;
  final String description;
  final String image;
  final String category;
  final double price;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'category': category,
      'price': price,
    };
  }

  ShoppingCategory get categoryEnum {
    switch (category.toLowerCase()) {
      case 'produce':
        return ShoppingCategory.produce;
      case 'meat':
        return ShoppingCategory.meat;
      case 'dairy':
        return ShoppingCategory.dairy;
      case 'pantry':
        return ShoppingCategory.pantry;
      default:
        return ShoppingCategory.others;
    }
  }
}
