// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_shopping_item_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeShoppingItemEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function() getAll}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function()? getAll}) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAll value) getAll,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAll value)? getAll,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAll value)? getAll,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeShoppingItemEventCopyWith<$Res> {
  factory $HomeShoppingItemEventCopyWith(
    HomeShoppingItemEvent value,
    $Res Function(HomeShoppingItemEvent) then,
  ) = _$HomeShoppingItemEventCopyWithImpl<$Res, HomeShoppingItemEvent>;
}

/// @nodoc
class _$HomeShoppingItemEventCopyWithImpl<
  $Res,
  $Val extends HomeShoppingItemEvent
>
    implements $HomeShoppingItemEventCopyWith<$Res> {
  _$HomeShoppingItemEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeShoppingItemEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetAllImplCopyWith<$Res> {
  factory _$$GetAllImplCopyWith(
    _$GetAllImpl value,
    $Res Function(_$GetAllImpl) then,
  ) = __$$GetAllImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllImplCopyWithImpl<$Res>
    extends _$HomeShoppingItemEventCopyWithImpl<$Res, _$GetAllImpl>
    implements _$$GetAllImplCopyWith<$Res> {
  __$$GetAllImplCopyWithImpl(
    _$GetAllImpl _value,
    $Res Function(_$GetAllImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeShoppingItemEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetAllImpl implements _GetAll {
  const _$GetAllImpl();

  @override
  String toString() {
    return 'HomeShoppingItemEvent.getAll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({required TResult Function() getAll}) {
    return getAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({TResult? Function()? getAll}) {
    return getAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAll,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAll value) getAll,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAll value)? getAll,
  }) {
    return getAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAll value)? getAll,
    required TResult orElse(),
  }) {
    if (getAll != null) {
      return getAll(this);
    }
    return orElse();
  }
}

abstract class _GetAll implements HomeShoppingItemEvent {
  const factory _GetAll() = _$GetAllImpl;
}

/// @nodoc
mixin _$HomeShoppingItemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShoppingItem> items) loaded,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShoppingItem> items)? loaded,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShoppingItem> items)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeShoppingItemInitial value) initial,
    required TResult Function(HomeShoppingItemLoading value) loading,
    required TResult Function(HomeShoppingItemLoaded value) loaded,
    required TResult Function(HomeShoppingItemError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeShoppingItemInitial value)? initial,
    TResult? Function(HomeShoppingItemLoading value)? loading,
    TResult? Function(HomeShoppingItemLoaded value)? loaded,
    TResult? Function(HomeShoppingItemError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeShoppingItemInitial value)? initial,
    TResult Function(HomeShoppingItemLoading value)? loading,
    TResult Function(HomeShoppingItemLoaded value)? loaded,
    TResult Function(HomeShoppingItemError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeShoppingItemStateCopyWith<$Res> {
  factory $HomeShoppingItemStateCopyWith(
    HomeShoppingItemState value,
    $Res Function(HomeShoppingItemState) then,
  ) = _$HomeShoppingItemStateCopyWithImpl<$Res, HomeShoppingItemState>;
}

/// @nodoc
class _$HomeShoppingItemStateCopyWithImpl<
  $Res,
  $Val extends HomeShoppingItemState
>
    implements $HomeShoppingItemStateCopyWith<$Res> {
  _$HomeShoppingItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeShoppingItemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HomeShoppingItemInitialImplCopyWith<$Res> {
  factory _$$HomeShoppingItemInitialImplCopyWith(
    _$HomeShoppingItemInitialImpl value,
    $Res Function(_$HomeShoppingItemInitialImpl) then,
  ) = __$$HomeShoppingItemInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeShoppingItemInitialImplCopyWithImpl<$Res>
    extends
        _$HomeShoppingItemStateCopyWithImpl<$Res, _$HomeShoppingItemInitialImpl>
    implements _$$HomeShoppingItemInitialImplCopyWith<$Res> {
  __$$HomeShoppingItemInitialImplCopyWithImpl(
    _$HomeShoppingItemInitialImpl _value,
    $Res Function(_$HomeShoppingItemInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeShoppingItemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeShoppingItemInitialImpl implements HomeShoppingItemInitial {
  const _$HomeShoppingItemInitialImpl();

  @override
  String toString() {
    return 'HomeShoppingItemState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeShoppingItemInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShoppingItem> items) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShoppingItem> items)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShoppingItem> items)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeShoppingItemInitial value) initial,
    required TResult Function(HomeShoppingItemLoading value) loading,
    required TResult Function(HomeShoppingItemLoaded value) loaded,
    required TResult Function(HomeShoppingItemError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeShoppingItemInitial value)? initial,
    TResult? Function(HomeShoppingItemLoading value)? loading,
    TResult? Function(HomeShoppingItemLoaded value)? loaded,
    TResult? Function(HomeShoppingItemError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeShoppingItemInitial value)? initial,
    TResult Function(HomeShoppingItemLoading value)? loading,
    TResult Function(HomeShoppingItemLoaded value)? loaded,
    TResult Function(HomeShoppingItemError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class HomeShoppingItemInitial implements HomeShoppingItemState {
  const factory HomeShoppingItemInitial() = _$HomeShoppingItemInitialImpl;
}

/// @nodoc
abstract class _$$HomeShoppingItemLoadingImplCopyWith<$Res> {
  factory _$$HomeShoppingItemLoadingImplCopyWith(
    _$HomeShoppingItemLoadingImpl value,
    $Res Function(_$HomeShoppingItemLoadingImpl) then,
  ) = __$$HomeShoppingItemLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HomeShoppingItemLoadingImplCopyWithImpl<$Res>
    extends
        _$HomeShoppingItemStateCopyWithImpl<$Res, _$HomeShoppingItemLoadingImpl>
    implements _$$HomeShoppingItemLoadingImplCopyWith<$Res> {
  __$$HomeShoppingItemLoadingImplCopyWithImpl(
    _$HomeShoppingItemLoadingImpl _value,
    $Res Function(_$HomeShoppingItemLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeShoppingItemState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HomeShoppingItemLoadingImpl implements HomeShoppingItemLoading {
  const _$HomeShoppingItemLoadingImpl();

  @override
  String toString() {
    return 'HomeShoppingItemState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeShoppingItemLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShoppingItem> items) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShoppingItem> items)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShoppingItem> items)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeShoppingItemInitial value) initial,
    required TResult Function(HomeShoppingItemLoading value) loading,
    required TResult Function(HomeShoppingItemLoaded value) loaded,
    required TResult Function(HomeShoppingItemError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeShoppingItemInitial value)? initial,
    TResult? Function(HomeShoppingItemLoading value)? loading,
    TResult? Function(HomeShoppingItemLoaded value)? loaded,
    TResult? Function(HomeShoppingItemError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeShoppingItemInitial value)? initial,
    TResult Function(HomeShoppingItemLoading value)? loading,
    TResult Function(HomeShoppingItemLoaded value)? loaded,
    TResult Function(HomeShoppingItemError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class HomeShoppingItemLoading implements HomeShoppingItemState {
  const factory HomeShoppingItemLoading() = _$HomeShoppingItemLoadingImpl;
}

/// @nodoc
abstract class _$$HomeShoppingItemLoadedImplCopyWith<$Res> {
  factory _$$HomeShoppingItemLoadedImplCopyWith(
    _$HomeShoppingItemLoadedImpl value,
    $Res Function(_$HomeShoppingItemLoadedImpl) then,
  ) = __$$HomeShoppingItemLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ShoppingItem> items});
}

/// @nodoc
class __$$HomeShoppingItemLoadedImplCopyWithImpl<$Res>
    extends
        _$HomeShoppingItemStateCopyWithImpl<$Res, _$HomeShoppingItemLoadedImpl>
    implements _$$HomeShoppingItemLoadedImplCopyWith<$Res> {
  __$$HomeShoppingItemLoadedImplCopyWithImpl(
    _$HomeShoppingItemLoadedImpl _value,
    $Res Function(_$HomeShoppingItemLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeShoppingItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$HomeShoppingItemLoadedImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<ShoppingItem>,
      ),
    );
  }
}

/// @nodoc

class _$HomeShoppingItemLoadedImpl implements HomeShoppingItemLoaded {
  _$HomeShoppingItemLoadedImpl({required final List<ShoppingItem> items})
    : _items = items;

  final List<ShoppingItem> _items;
  @override
  List<ShoppingItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'HomeShoppingItemState.loaded(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeShoppingItemLoadedImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of HomeShoppingItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeShoppingItemLoadedImplCopyWith<_$HomeShoppingItemLoadedImpl>
  get copyWith =>
      __$$HomeShoppingItemLoadedImplCopyWithImpl<_$HomeShoppingItemLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShoppingItem> items) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShoppingItem> items)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShoppingItem> items)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeShoppingItemInitial value) initial,
    required TResult Function(HomeShoppingItemLoading value) loading,
    required TResult Function(HomeShoppingItemLoaded value) loaded,
    required TResult Function(HomeShoppingItemError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeShoppingItemInitial value)? initial,
    TResult? Function(HomeShoppingItemLoading value)? loading,
    TResult? Function(HomeShoppingItemLoaded value)? loaded,
    TResult? Function(HomeShoppingItemError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeShoppingItemInitial value)? initial,
    TResult Function(HomeShoppingItemLoading value)? loading,
    TResult Function(HomeShoppingItemLoaded value)? loaded,
    TResult Function(HomeShoppingItemError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class HomeShoppingItemLoaded implements HomeShoppingItemState {
  factory HomeShoppingItemLoaded({required final List<ShoppingItem> items}) =
      _$HomeShoppingItemLoadedImpl;

  List<ShoppingItem> get items;

  /// Create a copy of HomeShoppingItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeShoppingItemLoadedImplCopyWith<_$HomeShoppingItemLoadedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HomeShoppingItemErrorImplCopyWith<$Res> {
  factory _$$HomeShoppingItemErrorImplCopyWith(
    _$HomeShoppingItemErrorImpl value,
    $Res Function(_$HomeShoppingItemErrorImpl) then,
  ) = __$$HomeShoppingItemErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$HomeShoppingItemErrorImplCopyWithImpl<$Res>
    extends
        _$HomeShoppingItemStateCopyWithImpl<$Res, _$HomeShoppingItemErrorImpl>
    implements _$$HomeShoppingItemErrorImplCopyWith<$Res> {
  __$$HomeShoppingItemErrorImplCopyWithImpl(
    _$HomeShoppingItemErrorImpl _value,
    $Res Function(_$HomeShoppingItemErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeShoppingItemState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$HomeShoppingItemErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$HomeShoppingItemErrorImpl implements HomeShoppingItemError {
  const _$HomeShoppingItemErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'HomeShoppingItemState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeShoppingItemErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of HomeShoppingItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeShoppingItemErrorImplCopyWith<_$HomeShoppingItemErrorImpl>
  get copyWith =>
      __$$HomeShoppingItemErrorImplCopyWithImpl<_$HomeShoppingItemErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<ShoppingItem> items) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<ShoppingItem> items)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<ShoppingItem> items)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeShoppingItemInitial value) initial,
    required TResult Function(HomeShoppingItemLoading value) loading,
    required TResult Function(HomeShoppingItemLoaded value) loaded,
    required TResult Function(HomeShoppingItemError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HomeShoppingItemInitial value)? initial,
    TResult? Function(HomeShoppingItemLoading value)? loading,
    TResult? Function(HomeShoppingItemLoaded value)? loaded,
    TResult? Function(HomeShoppingItemError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeShoppingItemInitial value)? initial,
    TResult Function(HomeShoppingItemLoading value)? loading,
    TResult Function(HomeShoppingItemLoaded value)? loaded,
    TResult Function(HomeShoppingItemError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HomeShoppingItemError implements HomeShoppingItemState {
  const factory HomeShoppingItemError(final String message) =
      _$HomeShoppingItemErrorImpl;

  String get message;

  /// Create a copy of HomeShoppingItemState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeShoppingItemErrorImplCopyWith<_$HomeShoppingItemErrorImpl>
  get copyWith => throw _privateConstructorUsedError;
}
