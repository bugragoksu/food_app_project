import 'package:equatable/equatable.dart';
import 'package:food_app_project/domain/core/failures/response_failure.dart';
import 'package:food_app_project/infrastructure/core/exceptions/response_exception.dart';

import 'generic_failure.dart';

abstract class Failure extends Equatable {
  const Failure({
    required this.message,
  });

  factory Failure.fromException(Exception e) {
    switch (e.runtimeType) {
      case ResponseException:
        e as ResponseException;
        return ResponseFailure(
          statusCode: e.statusCode,
          message: e.message ?? 'Something went wrong with server, please try again',
        );

      default:
        return GenericFailure(message: e.toString());
    }
  }

  final String message;

  @override
  String toString() => '$message Failure';

  @override
  List<Object?> get props => [];
}
