import '../model/pokemon_data.dart';
import '../repository/pokemon_repository.dart';

class PokemonInteractor  {
  final IPokemonRepository pokemonRepository;

  PokemonInteractor(this.pokemonRepository);

  Future<PokemonData> getPokemon() {
    return pokemonRepository.getPokemon();
  }


}
