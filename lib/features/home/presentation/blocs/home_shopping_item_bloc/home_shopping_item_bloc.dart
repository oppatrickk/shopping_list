import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/features/home/domain/entities/shopping_item.dart';
import 'package:shopping_list/features/home/domain/usecases/shopping_item_usecase.dart';

part 'home_shopping_item_bloc.freezed.dart';
part 'home_shopping_item_event.dart';
part 'home_shopping_item_state.dart';

@injectable
class HomeShoppingItemBloc extends Bloc<HomeShoppingItemEvent, HomeShoppingItemState> {
  HomeShoppingItemBloc(this._getAllShoppingItems) : super(const HomeShoppingItemState.initial()) {
    on<_GetAll>(_onGetAll);
  }
  final GetAllShoppingItems _getAllShoppingItems;

  List<ShoppingItem> items = [];

  Future<void> _onGetAll(_GetAll event, Emitter<HomeShoppingItemState> emit) async {
    emit(const HomeShoppingItemState.loading());
    try {
      final fetchedItems = await _getAllShoppingItems();
      items = fetchedItems;

      emit(
        HomeShoppingItemState.loaded(items: items),
      );
    } catch (e) {
      emit(HomeShoppingItemState.error(e.toString()));
    }
  }
}
