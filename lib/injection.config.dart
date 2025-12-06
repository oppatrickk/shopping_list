// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'features/home/data/datasources/shopping_item_datasource_local.dart'
    as _i258;
import 'features/home/data/repositories/shopping_item_repository_impl.dart'
    as _i394;
import 'features/home/domain/repositories/shopping_item_repository.dart'
    as _i928;
import 'features/home/domain/usecases/shopping_item_usecase.dart' as _i611;
import 'features/home/presentation/blocs/home_shopping_cart_cubit.dart'
    as _i197;
import 'features/home/presentation/blocs/home_shopping_category_cubit.dart'
    as _i458;
import 'features/home/presentation/blocs/home_shopping_item_bloc/home_shopping_item_bloc.dart'
    as _i814;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i197.HomeShoppingCartCubit>(
      () => _i197.HomeShoppingCartCubit(),
    );
    gh.factory<_i458.HomeShoppingCategoryCubit>(
      () => _i458.HomeShoppingCategoryCubit(),
    );
    gh.lazySingleton<_i258.ShoppingItemDataSourceLocal>(
      () => const _i258.ShoppingItemDataSourceLocalImpl(),
    );
    gh.lazySingleton<_i928.ShoppingItemRepository>(
      () => _i394.ShoppingItemRepositoryImpl(
        localDataSource: gh<_i258.ShoppingItemDataSourceLocal>(),
      ),
    );
    gh.lazySingleton<_i611.GetAllShoppingItems>(
      () => _i611.GetAllShoppingItems(gh<_i928.ShoppingItemRepository>()),
    );
    gh.factory<_i814.HomeShoppingItemBloc>(
      () => _i814.HomeShoppingItemBloc(gh<_i611.GetAllShoppingItems>()),
    );
    return this;
  }
}
