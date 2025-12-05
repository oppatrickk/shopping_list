import 'package:shopping_list/features/home/domain/entities/shopping_item.dart';

abstract class ShoppingItemRepository {
  Future<List<ShoppingItem?>> getAllShoppingItems();
}
