import 'package:get_it/get_it.dart';
import '../../../domain/interactor/information_about_pokemon_interactor.dart';
import 'bloc/information_about_pokemon_bloc.dart';
import 'data/information_about_pokemon_data.dart';
import 'information_about_pokemon_view_mapper.dart';

void initInformationAboutPokemonModule() {
  final getIt = GetIt.I;
  getIt.registerLazySingleton<InformationAboutPokemonViewMapper>(() => InformationAboutPokemonViewMapper());

  getIt.registerFactory<InformationAboutPokemonScreenBloc>(
    () => InformationAboutPokemonScreenBloc(
      getIt.get<InformationAboutPokemonInteractor>(),
      getIt.get<InformationAboutPokemonViewMapper>(),
    ),
  );
}
