import '../model/pokemon_data.dart';
import '../repository/pokemon_repository.dart';

class PokemonInteractor  {
  final IPokemonRepository pokemonRepository;

  PokemonInteractor(this.pokemonRepository);
  /*Future<void> sendPokemon(PokemonData data) {
    return pokemonRepository.sendPokemon(data);
  }*/
  Future<PokemonData> getPokemon(int offset, int limit) {
    return pokemonRepository.getPokemon();
  }


}
