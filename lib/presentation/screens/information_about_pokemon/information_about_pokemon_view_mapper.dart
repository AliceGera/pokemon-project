import '../../../domain/model/information_about_pokemon_data.dart';
import 'data/information_about_pokemon_screen_data.dart';

abstract class InformationAboutPokemonViewMapper {
  factory InformationAboutPokemonViewMapper() => _InformationAboutPokemonViewMapper();

  void toScreenData(
    InformationAboutPokemonScreenData screenData,
    InformationAboutPokemonData data,

  );

  InformationAboutPokemonData toDomainModelData(InformationAboutPokemonScreenData screenData);
}

class _InformationAboutPokemonViewMapper implements InformationAboutPokemonViewMapper {
  @override
  void toScreenData(
    InformationAboutPokemonScreenData screenData,
    InformationAboutPokemonData data,

  ) {

    screenData.name = data.name ?? '';
    screenData.height = data.height ?? 0;
    screenData.weight = data.weight ?? 0;
    screenData.imagePokemon = data.image ?? '';
  }

  @override
  InformationAboutPokemonData toDomainModelData(InformationAboutPokemonScreenData screenData) {
    return InformationAboutPokemonData(
      url: screenData.url,
    );
  }
}
