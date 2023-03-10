import '../model/information_about_pokemon_data.dart';
import '../repository/information_about_pokemon_repository.dart';

class InformationAboutPokemonInteractor {
  final IInformationAboutPokemonRepository informationAboutPokemonRepository;

  InformationAboutPokemonInteractor(this.informationAboutPokemonRepository);

  Future<InformationAboutPokemonData> getInformationAboutPokemon(InformationAboutPokemonData informationAboutPokemonData) {
    return informationAboutPokemonRepository.getInformationAboutPokemon(informationAboutPokemonData);
  }
}

