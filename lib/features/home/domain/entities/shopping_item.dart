import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_list/core/enums/shopping_category.dart';

part 'shopping_item.freezed.dart';
part 'shopping_item.g.dart';

@freezed
class ShoppingItem with _$ShoppingItem {
  ShoppingItem._();

  const factory ShoppingItem({
    required int id,
    required String title,
    required String description,
    required String image,
    required String category,
    required double price,
  }) = _ShoppingItem;

  factory ShoppingItem.fromJson(Map<String, dynamic> json) => _$ShoppingItemFromJson(json);

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
