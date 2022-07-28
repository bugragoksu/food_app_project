import 'package:flutter/material.dart';
import 'package:food_app_project/domain/food/entity/basket_item.dart';
import 'package:food_app_project/injection.dart';
import 'package:food_app_project/presentation/pages/food/list/cubit/food_cubit.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({
    Key? key,
    required this.basket,
  }) : super(key: key);

  final List<BasketItem> basket;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: basket.isEmpty
          ? const Center(
              child: Text('No foods in the basket'),
            )
          : Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Your Basket',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          getIt.get<FoodCubit>().clearBasket();
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.delete))
                  ],
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  shrinkWrap: true,
                  itemCount: basket.length,
                  itemBuilder: (context, index) => ListTile(
                      leading: SizedBox(
                        width: 100,
                        child: Image.network(
                          basket[index].food.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      trailing: Text('Amount : ${basket[index].count}'),
                      title: Text(basket[index].food.title)),
                ),
                const Spacer(),
                const Divider(),
                Text(
                  'Total : ${getIt.get<FoodCubit>().basketTotal}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint('Not Implemented');
                    },
                    child: const Text('Order'),
                  ),
                )
              ],
            ),
    );
  }
}
