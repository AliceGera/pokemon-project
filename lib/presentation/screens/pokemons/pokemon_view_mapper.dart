import '../../../domain/model/pokemon_data.dart';
import 'data/pokemon_screen_data.dart';

abstract class PokemonViewMapper {
  factory PokemonViewMapper() => _PokemonViewMapper();

  void toScreenData(
    PokemonData data,
    PokemonScreenData screenData,
    bool isFirstLoading,
  );

  PokemonData toDomainModelData(PokemonScreenData screenData);
}

class _PokemonViewMapper implements PokemonViewMapper {
  @override
  void toScreenData(
    PokemonData data,
    PokemonScreenData screenData,
    bool isFirstLoading,
  ) {
    final pokemonList = data.pokemonList
        ?.map(
          (e) => PokemonScreenItem(
            e.name ?? '',
            e.url ?? '',
          ),
        )
        .toList();
    if ((pokemonList?.length ?? 0) >= screenData.limit) {
      screenData.isHasNext = true;
      if (isFirstLoading) {
        screenData.itemList = pokemonList ?? [];
        screenData.offset = screenData.limit;
      } else {
        screenData.offset += screenData.limit;
        screenData.itemList += pokemonList ?? [];
      }
    } else {
      screenData.isHasNext = false;
      screenData.isLoadMore = false;
    }
  }

  @override
  PokemonData toDomainModelData(PokemonScreenData screenData) {
    return PokemonData(
      offset: screenData.offset,
      limit: screenData.limit,
    );
  }
}
