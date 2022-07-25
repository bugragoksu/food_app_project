import 'package:food_app_project/domain/core/failures/failure.dart';
import 'package:food_app_project/domain/food/entity/food.dart';
import 'package:food_app_project/domain/food/entity/category.dart';
import 'package:food_app_project/domain/core/data_result.dart';
import 'package:food_app_project/domain/food/food_repository.dart';
import 'package:food_app_project/infrastructure/food/data-source/food_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FoodRepository)
class FoodRepositoryImpl implements FoodRepository {
  FoodRepositoryImpl(this._foodDataSource);

  final FoodDataSource _foodDataSource;

  @override
  Future<DataResult<List<Category>>> getCategories() async {
    try {
      final result = await _foodDataSource.getCategories();
      return DataResult.success(result.map((e) => e.toCategory).toList());
    } on Exception catch (e) {
      return DataResult.failure(Failure.fromException(e));
    }
  }

  @override
  Future<DataResult<List<Food>>> getFoods({required int categoryId}) async {
    try {
      final result = await _foodDataSource.getFoods(categoryId: categoryId);
      return DataResult.success(result.map((e) => e.toFood).toList());
    } on Exception catch (e) {
      return DataResult.failure(Failure.fromException(e));
    }
  }
}
