import 'package:food_app_project/infrastructure/core/exceptions/response_exception.dart';
import 'package:food_app_project/infrastructure/food/dto/category_dto.dart';
import 'package:food_app_project/infrastructure/food/dto/food_dto.dart';
import 'package:food_app_project/infrastructure/food/service/food_service.dart';
import 'package:injectable/injectable.dart';

abstract class FoodDataSource {
  Future<List<CategoryDTO>> getCategories();
  Future<List<FoodDTO>> getFoods({required int categoryId});
}

@Injectable(as: FoodDataSource)
class FoodDataSourceImpl implements FoodDataSource {
  FoodDataSourceImpl(this._foodService);

  final FoodService _foodService;

  @override
  Future<List<CategoryDTO>> getCategories() async {
    final result = await _foodService.getCategories();
    if (result.statusCode == 200) {
      return (result.data['results'] as List<dynamic>).map((e) => CategoryDTO.fromJsonFactory(e)).toList();
    }
    throw ResponseException(
      statusCode: result.statusCode ?? 500,
      message: result.statusMessage,
    );
  }

  @override
  Future<List<FoodDTO>> getFoods({required int categoryId}) async {
    final result = await _foodService.getFoods(categoryId: categoryId);
    if (result.statusCode == 200) {
      return (result.data['results'] as List<dynamic>).map((e) => FoodDTO.fromJsonFactory(e)).toList();
    }
    throw ResponseException(
      statusCode: result.statusCode ?? 500,
      message: result.statusMessage,
    );
  }
}
