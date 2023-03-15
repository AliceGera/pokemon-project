import 'package:get_it/get_it.dart';
import 'package:pokemon_project/presentation/screens/pokemons/pokemon_view_mapper.dart';

void initPokemonModule() {
  final getIt = GetIt.I;
  getIt.registerLazySingleton<PokemonViewMapper>(() => PokemonViewMapper());
}
