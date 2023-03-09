import '../model/pokemon_data.dart';

abstract class IPokemonRepository {
 // Future<PokemonData> sendPokemon(PokemonData data);
  Future<PokemonData> getPokemon();
}
