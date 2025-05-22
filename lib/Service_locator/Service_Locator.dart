
import 'package:get_it/get_it.dart';

import '../Data/Remote/API_Helper.dart';

final GetIt getIt = GetIt.instance;

void setupLocator(String token) {
  getIt.registerLazySingleton<DomainRepository>(() => DomainRepository(token));
}