part of 'home_shopping_item_bloc.dart';

@freezed
class HomeShoppingItemState with _$HomeShoppingItemState {
  const factory HomeShoppingItemState.initial() = HomeShoppingItemInitial;
  const factory HomeShoppingItemState.loading() = HomeShoppingItemLoading;
  factory HomeShoppingItemState.loaded({required List<ShoppingItem> items}) = HomeShoppingItemLoaded;
  const factory HomeShoppingItemState.error(String message) = HomeShoppingItemError;
}
