import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_project/injection.dart';
import 'package:food_app_project/presentation/pages/food/basket/basket_screen.dart';
import 'package:food_app_project/presentation/pages/food/list/cubit/food_cubit.dart';
import 'package:food_app_project/presentation/pages/food/widgets/card_list.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({
    Key? key,
    required this.categoryName,
    required this.categoryId,
  }) : super(key: key);
  final String categoryName;
  final int categoryId;
  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  @override
  void initState() {
    super.initState();
    getIt.get<FoodCubit>().getFoods(categoryId: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      floatingActionButton: BlocBuilder<FoodCubit, FoodState>(
        bloc: getIt.get<FoodCubit>(),
        builder: (context, state) {
          return FloatingActionButton(
            heroTag: 2,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => BasketScreen(basket: state.basket),
              );
            },
            child: const Icon(Icons.shopping_basket_sharp),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<FoodCubit, FoodState>(
          bloc: getIt.get<FoodCubit>(),
          builder: (_, state) {
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
    );
  }
}
