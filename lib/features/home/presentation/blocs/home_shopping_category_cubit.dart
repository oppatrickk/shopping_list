import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_list/core/enums/shopping_category.dart';

@injectable
class HomeShoppingCategoryCubit extends Cubit<ShoppingCategory?> {
  HomeShoppingCategoryCubit() : super(ShoppingCategory.all);

  void setActiveCategory(ShoppingCategory? category) => emit(category);
  void resetCategory(ShoppingCategory? category) => emit(ShoppingCategory.all);
}
