import '../../domain/model/pokemon_data.dart';
import '../model/pokemons/api_pokemon_request.dart';
import '../model/pokemons/api_pokemon_response.dart';

abstract class IPokemonMapper {
  factory IPokemonMapper() => _PokemonMapper();

  ApiPokemonRequest toApiPokemonRequest(PokemonData data);

  PokemonData toPokemonData(ApiPokemonResponse data);
}

class _PokemonMapper implements IPokemonMapper {
  @override
  ApiPokemonRequest toApiPokemonRequest(PokemonData data) {
    return ApiPokemonRequest(
      offset: data.offset,
      limit: data.limit,
    );
  }

  @override
  PokemonData toPokemonData(ApiPokemonResponse data) {
    final pokemonList = data.results
        ?.map(
          (e) => PokemonItem(
            e.name,
            e.url,
          ),
        )
        .toList();
    return PokemonData(pokemonList: pokemonList);
  }
}
