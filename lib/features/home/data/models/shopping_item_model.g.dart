// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShoppingItemModelImpl _$$ShoppingItemModelImplFromJson(
  Map<String, dynamic> json,
) => _$ShoppingItemModelImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String,
  image: json['image'] as String,
  category: json['category'] as String,
  price: (json['price'] as num).toDouble(),
);

Map<String, dynamic> _$$ShoppingItemModelImplToJson(
  _$ShoppingItemModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'image': instance.image,
  'category': instance.category,
  'price': instance.price,
};
