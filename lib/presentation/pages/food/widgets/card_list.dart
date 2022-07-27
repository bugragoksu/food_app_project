import 'package:flutter/material.dart';
import 'package:food_app_project/domain/food/entity/category.dart';
import 'package:food_app_project/domain/food/entity/food.dart';

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
    return GridView.builder(
      itemCount: itemList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        if (mode == CardListMode.categoryList) {
          final model = itemList as List<Category>;
          return _CardItem(
            id: model[index].id,
            imageUrl: model[index].imageUrl,
            title: model[index].name,
          );
        }
        final model = itemList as List<Food>;
        return _CardItem(
          id: model[index].id,
          imageUrl: model[index].imageUrl,
          title: model[index].title,
        );
      },
    );
  }
}

class _CardItem extends StatelessWidget {
  const _CardItem({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.title,
    this.price,
    this.isFavourited,
  }) : super(key: key);
  final int id;
  final String imageUrl;
  final String title;
  final String? price;
  final bool? isFavourited;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
