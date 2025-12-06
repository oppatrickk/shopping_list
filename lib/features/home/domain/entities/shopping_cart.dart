import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_item.dart';

part 'shopping_cart.freezed.dart';
part 'shopping_cart.g.dart';

@freezed
class ShoppingCart with _$ShoppingCart {
  const factory ShoppingCart({
    required ShoppingItem item,
    required int quantity,
  }) = _ShoppingCart;

  factory ShoppingCart.fromJson(Map<String, dynamic> json) => _$ShoppingCartFromJson(json);
}
