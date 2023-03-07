import '../../../domain/model/pokemon_data.dart';
import 'data/pokemon_screen_data.dart';

abstract class PokemonViewMapper {
  factory PokemonViewMapper() => _PokemonViewMapper();
  PokemonScreenData toScreenData(PokemonData data);
  //PokemonData toDomainModelData(PokemonViewMapper data);
}

class _PokemonViewMapper implements PokemonViewMapper {
  @override
  PokemonScreenData toScreenData(PokemonData data) {
    final pokemonList = data.pokemonList
        ?.map(
          (e) => PokemonScreenItem(
        e.name ?? '',
        e.url ?? '',
      ),
    )
        .toList();
    return PokemonScreenData(pokemonList ?? []);
  }

}
