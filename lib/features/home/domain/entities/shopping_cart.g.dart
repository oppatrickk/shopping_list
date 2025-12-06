// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingCartImpl _$$ShoppingCartImplFromJson(Map<String, dynamic> json) =>
    _$ShoppingCartImpl(
      item: ShoppingItem.fromJson(json['item'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$$ShoppingCartImplToJson(_$ShoppingCartImpl instance) =>
    <String, dynamic>{'item': instance.item, 'quantity': instance.quantity};
