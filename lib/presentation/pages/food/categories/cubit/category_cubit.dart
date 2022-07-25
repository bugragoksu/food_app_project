import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app_project/domain/food/entity/category.dart';
import 'package:food_app_project/domain/food/food_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._foodRepository) : super(const CategoryState.initial());

  final FoodRepository _foodRepository;

  Future<void> getMovieDetail({required int id}) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    final result = await _foodRepository.getCategories();
    result.fold(
      (error) => state.copyWith(
        status: CategoryStatus.failure,
        errorMessage: error.message,
      ),
      (data) => emit(
        state.copyWith(
          status: CategoryStatus.success,
          categories: data,
        ),
      ),
    );
  }
}
