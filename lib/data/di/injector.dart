import 'dart:io';
import 'package:get_it/get_it.dart';
import '../../domain/repository/information_about_pokemon_repository.dart';
import '../../domain/repository/pokemon_repository.dart';
import '../api/api_client.dart';
import '../mapper/information_about_pokemon_mapper.dart';
import '../mapper/pokemon_mapper.dart';
import '../repository/api_information_about_pokemon_repository.dart';
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
  getIt.registerLazySingleton<IInformationAboutPokemonMapper>(
        () => IInformationAboutPokemonMapper(),
  );

  getIt.registerLazySingleton<IInformationAboutPokemonRepository>(
        () => ApiInformationAboutPokemonRepository(
      getIt.get<HttpRequestExecutor>(),
      getIt.get<IInformationAboutPokemonMapper>(),
    ),
  );

}

