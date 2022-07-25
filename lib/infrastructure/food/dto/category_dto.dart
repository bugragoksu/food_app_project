import 'package:food_app_project/domain/food/entity/category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDTO {
  CategoryDTO({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
  final int id;
  final String name;
  final String imageUrl;

  Category get toCategory => Category(
        id: id,
        imageUrl: imageUrl,
        name: name,
      );
  static const fromJsonFactory = _$CategoryDTOFromJson;
}
