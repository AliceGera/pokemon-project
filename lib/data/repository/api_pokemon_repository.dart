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
  Future<PokemonData> getPokemon(PokemonData pokemonDomainData) async {
    final apiPokemonRequest = pokemonMapper.toApiPokemonRequest(pokemonDomainData);
    final response = await httpRequestExecutor.executeRequest(
      HttpMethod.get,
      Uri.parse("https://pokeapi.co/api/v2/pokemon?${apiPokemonRequest.toQueryParametersString}"),
      null,
    );
    final mappedResponse = ApiPokemonResponse.fromJson(response);
    final pokemonData = pokemonMapper.toPokemonData(mappedResponse);
    return pokemonData;
  }

/* @override
  Future<PokemonData> sendPokemon(PokemonData data) {
    // TODO: implement sendPokemon
    throw UnimplementedError();
  }*/
}
