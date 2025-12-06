import 'package:injectable/injectable.dart';
import 'package:shopping_list/features/home/data/datasources/shopping_item_datasource_local.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_item.dart';
import 'package:shopping_list/features/home/domain/repositories/shopping_item_repository.dart';

@LazySingleton(as: ShoppingItemRepository)
class ShoppingItemRepositoryImpl implements ShoppingItemRepository {
  const ShoppingItemRepositoryImpl({
    required this.localDataSource,
  });
  final ShoppingItemDataSourceLocal localDataSource;

  @override
  Future<List<ShoppingItem?>> getAllShoppingItems() async {
    try {
      final items = await localDataSource.getAllShoppingItems();
      return items
          .map<ShoppingItem?>(
            (e) => ShoppingItem(
              id: e.id,
              title: e.title,
              description: e.description,
              image: e.image,
              category: e.category,
              price: e.price,
            ),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
