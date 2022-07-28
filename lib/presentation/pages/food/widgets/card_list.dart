import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_project/domain/food/entity/basket_item.dart';
import 'package:food_app_project/domain/food/entity/category.dart';
import 'package:food_app_project/domain/food/entity/food.dart';
import 'package:food_app_project/injection.dart';
import 'package:food_app_project/presentation/pages/food/list/cubit/food_cubit.dart';
import 'package:food_app_project/presentation/pages/food/list/food_list_screen.dart';

enum CardListMode { foodList, categoryList }

class CardList extends StatelessWidget {
  const CardList({
    Key? key,
    required this.itemList,
    required this.mode,
  }) : super(key: key);

  final List<dynamic> itemList;
  final CardListMode mode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      bloc: getIt.get<FoodCubit>(),
      builder: (context, state) {
        return GridView.builder(
          itemCount: itemList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (_, index) {
            if (mode == CardListMode.categoryList) {
              final model = itemList as List<Category>;
              return _CardItem(
                mode: mode,
                id: model[index].id,
                imageUrl: model[index].imageUrl,
                title: model[index].name,
                onTap: () => Navigator.of(_).push(
                  MaterialPageRoute(
                    builder: (_) => FoodListScreen(
                      categoryId: model[index].id,
                      categoryName: model[index].name,
                    ),
                  ),
                ),
              );
            } else {
              final model = itemList as List<Food>;
              return _CardItem(
                mode: mode,
                id: model[index].id,
                imageUrl: model[index].imageUrl,
                title: model[index].title,
                price: model[index].price.toString() + model[index].currency,
                onTap: () {
                  getIt.get<FoodCubit>().addBasket(item: BasketItem(food: model[index]));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Item added to basket.'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({
    Key? key,
    required this.mode,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.onTap,
    this.price,
  }) : super(key: key);
  final int id;
  final String imageUrl;
  final String title;
  final String? price;
  final VoidCallback onTap;
  final CardListMode mode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Visibility(
              visible: mode == CardListMode.foodList,
              child: Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: mode == CardListMode.foodList,
              child: Positioned(
                left: 10,
                top: 10,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(price ?? ''),
                    )),
              ),
            ),
            Positioned.fill(
              bottom: 10,
              left: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
