import '../../../domain/model/pokemon_data.dart';
import 'data/pokemon_screen_data.dart';

abstract class PokemonViewMapper {
  factory PokemonViewMapper() => _PokemonViewMapper();

  void toScreenData(
    PokemonData data,
    PokemonScreenData screenData,
  );

  PokemonData toDomainModelData(PokemonScreenData screenData);
}

class _PokemonViewMapper implements PokemonViewMapper {
  @override
  void toScreenData(
    PokemonData data,
    PokemonScreenData screenData,
  ) {
    final pokemonList = data.pokemonList
        ?.map(
          (e) => PokemonScreenItem(
            e.name ?? '',
            e.url ?? '',
          ),
        )
        .toList();
    screenData.itemList = pokemonList ?? [];
  }

  @override
  PokemonData toDomainModelData(PokemonScreenData screenData) {
    return PokemonData(
      offset: screenData.offset,
      limit: screenData.limit,
    );
  }
}
