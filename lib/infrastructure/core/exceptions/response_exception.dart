import 'package:food_app_project/infrastructure/core/exceptions/base_exception.dart';

class ResponseException extends BaseException {
  const ResponseException({
    super.message,
    required this.statusCode,
  });

  final int statusCode;
}
