import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_app_project/domain/food/entity/basket_item.dart';
import 'package:food_app_project/domain/food/entity/food.dart';
import 'package:food_app_project/domain/food/food_repository.dart';
import 'package:injectable/injectable.dart';

part 'food_state.dart';

@singleton
class FoodCubit extends Cubit<FoodState> {
  FoodCubit(
    this._foodRepository,
  ) : super(const FoodState.initial());

  final FoodRepository _foodRepository;

  Future<void> getFoods({required int categoryId}) async {
    emit(state.copyWith(status: FoodStatus.loading));
    final result = await _foodRepository.getFoods(categoryId: categoryId);
    result.fold(
      (error) => emit(
        state.copyWith(
          status: FoodStatus.failure,
          errorMessage: error.message,
        ),
      ),
      (data) => emit(
        state.copyWith(
          status: FoodStatus.success,
          foods: data,
        ),
      ),
    );
  }

  void addBasket({required BasketItem item}) {
    final itemIndex = state.basket.indexOf(item);
    if (itemIndex == -1) {
      return emit(state.copyWith(basket: [item, ...state.basket]));
    } else {
      state.basket[itemIndex].count++;
      return emit(state);
    }
  }

  void clearBasket() {
    return emit(state.copyWith(basket: []));
  }

  String get basketTotal {
    double total = 0;
    for (var element in state.basket) {
      total += element.food.price;
    }
    return (total.toStringAsFixed(2) + state.basket.first.food.currency);
  }
}
