import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:food_app_project/infrastructure/core/service/network_service.dart';
import 'package:injectable/injectable.dart';

abstract class FoodService extends NetworkService {
  FoodService(super.dio);

  Future<Response> getCategories();
  Future<Response> getFoods({required int categoryId});
}

@Injectable(as: FoodService)
class FoodServiceImpl extends FoodService {
  FoodServiceImpl(super.dio);

  @override
  Future<Response> getCategories() async {
    // return dio.get('categories/');

    // return fake json
    final String response = await rootBundle.loadString('assets/categories.json');
    final data = await json.decode(response);
    return Response(
      data: data,
      statusCode: 200,
      requestOptions: RequestOptions(
        path: 'categories/',
      ),
    );
  }

  @override
  Future<Response> getFoods({required int categoryId}) async {
    // return dio.get('foods/$categoryId');

    // return fake json
    final String response = await rootBundle.loadString('assets/foods.json');
    final data = await json.decode(response);
    return Response(
      data: data,
      statusCode: 200,
      requestOptions: RequestOptions(
        path: 'foods/$categoryId',
      ),
    );
  }
}
