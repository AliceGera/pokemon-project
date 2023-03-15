import 'package:get_it/get_it.dart';
import 'information_about_pokemon_view_mapper.dart';

void initInformationAboutPokemonModule() {
  final getIt = GetIt.I;
  getIt.registerLazySingleton<InformationAboutPokemonViewMapper>(() => InformationAboutPokemonViewMapper());
}
