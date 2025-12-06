// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ShoppingCart _$ShoppingCartFromJson(Map<String, dynamic> json) {
  return _ShoppingCart.fromJson(json);
}

/// @nodoc
mixin _$ShoppingCart {
  ShoppingItem get item => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;

  /// Serializes this ShoppingCart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingCart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingCartCopyWith<ShoppingCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCartCopyWith<$Res> {
  factory $ShoppingCartCopyWith(
    ShoppingCart value,
    $Res Function(ShoppingCart) then,
  ) = _$ShoppingCartCopyWithImpl<$Res, ShoppingCart>;
  @useResult
  $Res call({ShoppingItem item, int quantity});
}

/// @nodoc
class _$ShoppingCartCopyWithImpl<$Res, $Val extends ShoppingCart>
    implements $ShoppingCartCopyWith<$Res> {
  _$ShoppingCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingCart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = null, Object? quantity = null}) {
    return _then(
      _value.copyWith(
            item: null == item
                ? _value.item
                : item // ignore: cast_nullable_to_non_nullable
                      as ShoppingItem,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShoppingCartImplCopyWith<$Res>
    implements $ShoppingCartCopyWith<$Res> {
  factory _$$ShoppingCartImplCopyWith(
    _$ShoppingCartImpl value,
    $Res Function(_$ShoppingCartImpl) then,
  ) = __$$ShoppingCartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ShoppingItem item, int quantity});
}

/// @nodoc
class __$$ShoppingCartImplCopyWithImpl<$Res>
    extends _$ShoppingCartCopyWithImpl<$Res, _$ShoppingCartImpl>
    implements _$$ShoppingCartImplCopyWith<$Res> {
  __$$ShoppingCartImplCopyWithImpl(
    _$ShoppingCartImpl _value,
    $Res Function(_$ShoppingCartImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShoppingCart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = null, Object? quantity = null}) {
    return _then(
      _$ShoppingCartImpl(
        item: null == item
            ? _value.item
            : item // ignore: cast_nullable_to_non_nullable
                  as ShoppingItem,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingCartImpl implements _ShoppingCart {
  const _$ShoppingCartImpl({required this.item, required this.quantity});

  factory _$ShoppingCartImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingCartImplFromJson(json);

  @override
  final ShoppingItem item;
  @override
  final int quantity;

  @override
  String toString() {
    return 'ShoppingCart(item: $item, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingCartImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, item, quantity);

  /// Create a copy of ShoppingCart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingCartImplCopyWith<_$ShoppingCartImpl> get copyWith =>
      __$$ShoppingCartImplCopyWithImpl<_$ShoppingCartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingCartImplToJson(this);
  }
}

abstract class _ShoppingCart implements ShoppingCart {
  const factory _ShoppingCart({
    required final ShoppingItem item,
    required final int quantity,
  }) = _$ShoppingCartImpl;

  factory _ShoppingCart.fromJson(Map<String, dynamic> json) =
      _$ShoppingCartImpl.fromJson;

  @override
  ShoppingItem get item;
  @override
  int get quantity;

  /// Create a copy of ShoppingCart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingCartImplCopyWith<_$ShoppingCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
