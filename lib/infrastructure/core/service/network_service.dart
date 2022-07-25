import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkService {
  final Dio dio;

  NetworkService(this.dio);
}

@module
abstract class DioModule {
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: 'https://www.A_FOOD_API_URL/',
          queryParameters: {
            'api_key': 'API_KEY',
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
}
