import 'package:get_it/get_it.dart';
import '../interactor/pokemon_interactor.dart';
import '../repository/pokemon_repository.dart';

Future<void> configureDomainDependencies() async {
  final getIt = GetIt.I;

  getIt.registerLazySingleton<PokemonInteractor>(
        () => PokemonInteractor(
      getIt.get<IPokemonRepository>(),
    ),
  );
}

