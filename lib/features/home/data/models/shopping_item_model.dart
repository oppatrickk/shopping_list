import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item_model.freezed.dart';
part 'shopping_item_model.g.dart';

@freezed
class ShoppingItemModel with _$ShoppingItemModel {
  ShoppingItemModel._();

  const factory ShoppingItemModel({
    required int id,
    required String title,
    required String description,
    required String image,
    required String category,
    required double price,
  }) = _ShoppingItemModel;

  factory ShoppingItemModel.fromJson(Map<String, dynamic> json) => _$ShoppingItemModelFromJson(json);
}
