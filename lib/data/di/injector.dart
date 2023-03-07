import 'dart:io';
import 'package:get_it/get_it.dart';
import '../../domain/repository/pokemon_repository.dart';
import '../api/api_client.dart';
import '../mapper/pokemon_mapper.dart';
import '../repository/api_pokemon_repository.dart';


Future<void> configureDataDependencies() async {
  final getIt = GetIt.I;

  getIt.registerLazySingleton<HttpRequestExecutor>(
        () => HttpRequestExecutor(
      HttpClient(),
    ),
  );
  getIt.registerLazySingleton<IPokemonMapper>(
        () => IPokemonMapper(),
  );

  getIt.registerLazySingleton<IPokemonRepository>(
        () => ApiPokemonRepository(
      getIt.get<HttpRequestExecutor>(),
      getIt.get<IPokemonMapper>(),
    ),
  );


}

