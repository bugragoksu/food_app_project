import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_project/injection.dart';
import 'package:food_app_project/presentation/pages/food/categories/cubit/category_cubit.dart';
import 'package:food_app_project/presentation/pages/food/widgets/card_list.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late final CategoryCubit _categoryCubit;

  @override
  void initState() {
    super.initState();
    _categoryCubit = getIt.get<CategoryCubit>()..getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider.value(
          value: _categoryCubit,
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state.status == CategoryStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == CategoryStatus.success) {
                return CardList(
                  mode: CardListMode.categoryList,
                  itemList: state.categories!,
                );
              } else if (state.status == CategoryStatus.failure) {
                return Center(
                  child: Text(state.errorMessage!),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
