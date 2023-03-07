import '../model/pokemon_data.dart';

abstract class IPokemonRepository {
  Future<PokemonData> getPokemon();
}
