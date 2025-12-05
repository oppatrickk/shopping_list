import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';
import 'package:shopping_list/features/home/data/models/shopping_item_model.dart';

abstract class ShoppingItemDataSourceLocal {
  Future<List<ShoppingItemModel>> getAllShoppingItems();
}

@LazySingleton(as: ShoppingItemDataSourceLocal)
class ShoppingItemDataSourceLocalImpl implements ShoppingItemDataSourceLocal {
  const ShoppingItemDataSourceLocalImpl();

  @override
  Future<List<ShoppingItemModel>> getAllShoppingItems() async {
    final jsonString = await rootBundle.loadString('assets/shopping_items.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => ShoppingItemModel.fromJson(json as Map<String, dynamic>)).toList();
  }
}
