import 'package:get_it/get_it.dart';
import 'package:pokemon_project/presentation/screens/pokemons/pokemons_view_mapper.dart';
import '../../../domain/interactor/pokemon_interactor.dart';
import 'bloc/pokemon_screen_bloc.dart';

void initPokemonModule() {
  final getIt = GetIt.I;
  getIt.registerLazySingleton<PokemonViewMapper>(() => PokemonViewMapper());

 getIt.registerFactory<PokemonScreenBloc>(
        () => PokemonScreenBloc(
      getIt.get<PokemonInteractor>(),
      getIt.get<PokemonViewMapper>(),
    ),
  );

}


