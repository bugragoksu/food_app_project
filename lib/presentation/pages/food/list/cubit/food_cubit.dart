import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app_project/domain/food/entity/food.dart';
import 'package:food_app_project/domain/food/food_repository.dart';
import 'package:injectable/injectable.dart';

part 'food_state.dart';

@injectable
class FoodCubit extends Cubit<FoodState> {
  FoodCubit(this._foodRepository) : super(const FoodState.initial());

  final FoodRepository _foodRepository;

  Future<void> getFoods({required int categoryId}) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    final result = await _foodRepository.getFoods(categoryId: categoryId);
    result.fold(
      (error) => state.copyWith(
        status: CategoryStatus.failure,
        errorMessage: error.message,
      ),
      (data) => emit(
        state.copyWith(
          status: CategoryStatus.success,
          foods: data,
        ),
      ),
    );

    void addBasket({required Food food}) {
      return emit(state.copyWith(basket: [food, ...state.basket]));
    }

    void clearBasket() {
      return emit(state.copyWith(basket: []));
    }
  }
}
