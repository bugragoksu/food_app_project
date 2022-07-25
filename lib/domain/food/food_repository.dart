import 'package:food_app_project/domain/core/data_result.dart';
import 'package:food_app_project/domain/food/entity/category.dart';
import 'package:food_app_project/domain/food/entity/food.dart';

abstract class FoodRepository {
  Future<DataResult<List<Category>>> getCategories();
  Future<DataResult<List<Food>>> getFoods({required int categoryId});
}
