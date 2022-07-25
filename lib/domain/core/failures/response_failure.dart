import 'package:food_app_project/domain/core/failures/failure.dart';

class ResponseFailure extends Failure {
  const ResponseFailure({
    required super.message,
    required this.statusCode,
  });

  final int statusCode;
}
