import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_project/injection.dart';
import 'package:food_app_project/presentation/pages/food/categories/categories_screen.dart';
import 'package:food_app_project/presentation/pages/food/list/cubit/food_cubit.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodCubit>(
      create: (context) => getIt.get<FoodCubit>(),
      child: MaterialApp(
        title: 'Food Demo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CategoriesScreen(),
      ),
    );
  }
}
