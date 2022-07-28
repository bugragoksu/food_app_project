// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'domain/food/food_repository.dart' as _i6;
import 'infrastructure/core/service/network_service.dart' as _i10;
import 'infrastructure/food/data-source/food_data_source.dart' as _i5;
import 'infrastructure/food/food_repository_impl.dart' as _i7;
import 'infrastructure/food/service/food_service.dart' as _i4;
import 'presentation/pages/food/categories/cubit/category_cubit.dart' as _i8;
import 'presentation/pages/food/list/cubit/food_cubit.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  gh.factory<_i3.Dio>(() => dioModule.dio);
  gh.factory<_i4.FoodService>(() => _i4.FoodServiceImpl(get<_i3.Dio>()));
  gh.factory<_i5.FoodDataSource>(
      () => _i5.FoodDataSourceImpl(get<_i4.FoodService>()));
  gh.factory<_i6.FoodRepository>(
      () => _i7.FoodRepositoryImpl(get<_i5.FoodDataSource>()));
  gh.factory<_i8.CategoryCubit>(
      () => _i8.CategoryCubit(get<_i6.FoodRepository>()));
  gh.singleton<_i9.FoodCubit>(_i9.FoodCubit(get<_i6.FoodRepository>()));
  return get;
}

class _$DioModule extends _i10.DioModule {}
