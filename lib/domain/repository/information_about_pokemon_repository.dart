import '../model/information_about_pokemon_data.dart';

abstract class IInformationAboutPokemonRepository {
  Future<InformationAboutPokemonData> getInformationAboutPokemon(InformationAboutPokemonData informationAboutPokemonScreenData);
}
