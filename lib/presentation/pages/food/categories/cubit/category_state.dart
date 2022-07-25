part of 'category_cubit.dart';

enum CategoryStatus { initial, success, failure, loading }

class CategoryState extends Equatable {
  const CategoryState._({
    this.categories,
    this.status = CategoryStatus.initial,
    this.errorMessage,
  });

  const CategoryState.initial() : this._();

  final List<Category>? categories;
  final CategoryStatus status;
  final String? errorMessage;

  CategoryState copyWith({
    List<Category>? categories,
    CategoryStatus? status,
    String? errorMessage,
  }) =>
      CategoryState._(
        categories: categories ?? this.categories,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        categories,
        status,
        errorMessage,
      ];
}
