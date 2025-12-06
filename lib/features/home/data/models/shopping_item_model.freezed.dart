// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ShoppingItemModel _$ShoppingItemModelFromJson(Map<String, dynamic> json) {
  return _ShoppingItemModel.fromJson(json);
}

/// @nodoc
mixin _$ShoppingItemModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  /// Serializes this ShoppingItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingItemModelCopyWith<ShoppingItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemModelCopyWith<$Res> {
  factory $ShoppingItemModelCopyWith(
    ShoppingItemModel value,
    $Res Function(ShoppingItemModel) then,
  ) = _$ShoppingItemModelCopyWithImpl<$Res, ShoppingItemModel>;
  @useResult
  $Res call({
    int id,
    String title,
    String description,
    String image,
    String category,
    double price,
  });
}

/// @nodoc
class _$ShoppingItemModelCopyWithImpl<$Res, $Val extends ShoppingItemModel>
    implements $ShoppingItemModelCopyWith<$Res> {
  _$ShoppingItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? category = null,
    Object? price = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            image: null == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShoppingItemModelImplCopyWith<$Res>
    implements $ShoppingItemModelCopyWith<$Res> {
  factory _$$ShoppingItemModelImplCopyWith(
    _$ShoppingItemModelImpl value,
    $Res Function(_$ShoppingItemModelImpl) then,
  ) = __$$ShoppingItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String description,
    String image,
    String category,
    double price,
  });
}

/// @nodoc
class __$$ShoppingItemModelImplCopyWithImpl<$Res>
    extends _$ShoppingItemModelCopyWithImpl<$Res, _$ShoppingItemModelImpl>
    implements _$$ShoppingItemModelImplCopyWith<$Res> {
  __$$ShoppingItemModelImplCopyWithImpl(
    _$ShoppingItemModelImpl _value,
    $Res Function(_$ShoppingItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoppingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? image = null,
    Object? category = null,
    Object? price = null,
  }) {
    return _then(
      _$ShoppingItemModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingItemModelImpl implements _ShoppingItemModel {
  const _$ShoppingItemModelImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.price,
  });

  factory _$ShoppingItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingItemModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String image;
  @override
  final String category;
  @override
  final double price;

  @override
  String toString() {
    return 'ShoppingItemModel(id: $id, title: $title, description: $description, image: $image, category: $category, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, description, image, category, price);

  /// Create a copy of ShoppingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemModelImplCopyWith<_$ShoppingItemModelImpl> get copyWith =>
      __$$ShoppingItemModelImplCopyWithImpl<_$ShoppingItemModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingItemModelImplToJson(this);
  }
}

abstract class _ShoppingItemModel implements ShoppingItemModel {
  const factory _ShoppingItemModel({
    required final int id,
    required final String title,
    required final String description,
    required final String image,
    required final String category,
    required final double price,
  }) = _$ShoppingItemModelImpl;

  factory _ShoppingItemModel.fromJson(Map<String, dynamic> json) =
      _$ShoppingItemModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get image;
  @override
  String get category;
  @override
  double get price;

  /// Create a copy of ShoppingItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingItemModelImplCopyWith<_$ShoppingItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
