import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_cart.dart';

@injectable
class HomeShoppingCartCubit extends Cubit<List<ShoppingCart>> {
  HomeShoppingCartCubit() : super([]);

  double get totalPrice => state.fold<double>(
    0,
    (previousValue, element) => previousValue + ((element.item.price) * (element.quantity)),
  );

  void addItem(ShoppingCart cart) {
    final current = state;

    final index = current.indexWhere((e) => e.item == cart.item);

    if (index >= 0) {
      final updated = List<ShoppingCart>.from(current);
      updated[index] = cart;
      emit(updated);
    } else {
      emit([...current, cart]);
    }
  }

  void removeItem(ShoppingCart? item) => emit([
    for (final cartItem in state)
      if (cartItem != item) cartItem,
  ]);

  void clearAllItem() => emit([]);
}

// void addItem(ShoppingCart newItem) {
//   final current = state;
//   final index = current.indexWhere((e) => e.item.id == newItem.item.id);

//   if (index != -1) {
//     // Update quantity
//     final updatedItem = ShoppingCart(
//       item: current[index].item,
//       quantity: current[index].quantity + newItem.quantity,
//     );

//     final newState = List<ShoppingCart>.from(current);
//     newState[index] = updatedItem;
//     emit(newState); // emit new list to trigger rebuild
//   } else {
//     emit([...current, newItem]); // add new item
//   }
// }
