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

  static const fromJsonFactory = _$CategoryDTOFromJson;
}
