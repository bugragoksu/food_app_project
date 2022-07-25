part of 'food_cubit.dart';

enum CategoryStatus { initial, success, failure, loading }

class FoodState extends Equatable {
  const FoodState._({
    this.foods = const [],
    this.basket = const [],
    this.status = CategoryStatus.initial,
    this.errorMessage,
  });

  const FoodState.initial() : this._();

  final List<Food>? foods;
  final List<Food> basket;
  final CategoryStatus status;
  final String? errorMessage;

  FoodState copyWith({
    List<Food>? foods,
    List<Food> basket = const [],
    CategoryStatus? status,
    String? errorMessage,
  }) =>
      FoodState._(
        foods: foods ?? this.foods,
        basket: basket,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        foods,
        basket,
        status,
        errorMessage,
      ];
}
