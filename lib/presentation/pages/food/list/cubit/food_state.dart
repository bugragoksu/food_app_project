part of 'food_cubit.dart';

enum FoodStatus { initial, success, failure, loading }

class FoodState extends Equatable {
  const FoodState._({
    this.foods = const [],
    this.basket = const [],
    this.status = FoodStatus.initial,
    this.errorMessage,
  });

  const FoodState.initial() : this._();

  final List<Food>? foods;
  final List<BasketItem> basket;
  final FoodStatus status;
  final String? errorMessage;

  FoodState copyWith({
    List<Food>? foods,
    List<BasketItem>? basket,
    FoodStatus? status,
    String? errorMessage,
  }) =>
      FoodState._(
        foods: foods ?? this.foods,
        basket: basket ?? this.basket,
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
