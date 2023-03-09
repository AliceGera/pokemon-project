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
    /*screenData.itemList = pokemonList ?? [];*/
    if ((pokemonList?.length ?? 0) >= 20) {
      screenData.isHasNext = true;
      if (isFirstLoading) {
        screenData.itemList = pokemonList ?? [];
        screenData.offset = 20;
      } else {
        screenData.offset += 20;
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
