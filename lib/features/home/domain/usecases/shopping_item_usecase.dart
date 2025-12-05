import 'package:injectable/injectable.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_item.dart';
import 'package:shopping_list/features/home/domain/repositories/shopping_item_repository.dart';

@lazySingleton
class GetAllShoppingItems {
  const GetAllShoppingItems(this.repository);
  final ShoppingItemRepository repository;

  Future<List<ShoppingItem>> call() async {
    final items = await repository.getAllShoppingItems();
    return items.whereType<ShoppingItem>().toList();
  }
}
