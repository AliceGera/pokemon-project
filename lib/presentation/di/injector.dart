import '../screens/information_about_pokemon/information_about_pokemon_module.dart';
import '../screens/pokemons/pokemon_module.dart';

Future<void> configurePresentationDependencies() async {
  initPokemonModule();
  initInformationAboutPokemonModule();
}


