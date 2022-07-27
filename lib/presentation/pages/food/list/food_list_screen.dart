import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_project/injection.dart';
import 'package:food_app_project/presentation/pages/food/list/cubit/food_cubit.dart';
import 'package:food_app_project/presentation/pages/food/widgets/card_list.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({
    Key? key,
    required this.categoryId,
    required this.categoryName,
  }) : super(key: key);
  final int categoryId;
  final String categoryName;

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  late final FoodCubit _foodCubit;

  @override
  void initState() {
    super.initState();
    _foodCubit = getIt.get<FoodCubit>()
      ..getFoods(
        categoryId: widget.categoryId,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider.value(
          value: _foodCubit,
          child: BlocBuilder<FoodCubit, FoodState>(
            builder: (context, state) {
              if (state.status == FoodStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == FoodStatus.failure) {
                return Center(
                  child: Text(state.errorMessage ?? 'Something went wrong'),
                );
              } else if (state.status == FoodStatus.success) {
                return CardList(itemList: state.foods!, mode: CardListMode.foodList);
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
