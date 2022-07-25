import 'package:food_app_project/domain/food/entity/food.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_dto.g.dart';

@JsonSerializable()
class FoodDTO {
  FoodDTO({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.currency,
  });

  final int id;
  final String imageUrl;
  final String title;
  final double price;
  final String currency;

  Food get toFood => Food(
        id: id,
        imageUrl: imageUrl,
        title: title,
        price: price,
        currency: currency,
      );

  static const fromJsonFactory = _$FoodDTOFromJson;
}
