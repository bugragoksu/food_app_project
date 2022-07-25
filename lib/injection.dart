import 'package:food_app_project/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies({String? environment = Environment.dev}) async => $initGetIt(
      getIt,
      environment: environment,
    );
