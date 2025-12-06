import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_cart.dart';

@injectable
class HomeShoppingCartCubit extends Cubit<List<ShoppingCart?>> {
  HomeShoppingCartCubit() : super([]);

  double get totalPrice => state.fold<double>(
    0,
    (previousValue, element) => previousValue + ((element?.item.price ?? 0) * (element?.quantity ?? 0)),
  );

  void addItem(ShoppingCart cart) {
    final current = state;

    final index = current.indexWhere((e) => e?.item == cart.item);

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
