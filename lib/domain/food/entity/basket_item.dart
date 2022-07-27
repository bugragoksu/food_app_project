import 'package:equatable/equatable.dart';
import 'package:food_app_project/domain/food/entity/food.dart';

class BasketItem extends Equatable {
  BasketItem({required this.food});

  final Food food;
  var count = 1;

  @override
  List<Object?> get props => [food, count];
}
