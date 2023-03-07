
import '../../domain/model/pokemon_data.dart';
import '../../domain/repository/pokemon_repository.dart';
import '../api/api_client.dart';
import '../mapper/pokemon_mapper.dart';
import '../model/pokemons/api_pokemon_response.dart';

class ApiPokemonRepository implements IPokemonRepository {
  final HttpRequestExecutor httpRequestExecutor;
  final IPokemonMapper pokemonMapper;

  ApiPokemonRepository(
      this.httpRequestExecutor,
      this.pokemonMapper,
      );

  @override
  Future<PokemonData> getPokemon() async {

    final response=await httpRequestExecutor.executeRequest(
      HttpMethod.get,
      Uri.parse("https://pokeapi.co/api/v2/pokemon"),
      null,
    );
    final mappedResponse = ApiPokemonResponse.fromJson(response);
    final pokemonData = pokemonMapper.toPokemonData(mappedResponse);
    return pokemonData;
  }
}
