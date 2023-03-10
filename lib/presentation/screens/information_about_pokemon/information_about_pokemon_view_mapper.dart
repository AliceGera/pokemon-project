import '../../../domain/model/information_about_pokemon_data.dart';
import 'data/information_about_pokemon_data.dart';

abstract class InformationAboutPokemonViewMapper {
  factory InformationAboutPokemonViewMapper() => _InformationAboutPokemonViewMapper();

  void toScreenData(
    InformationAboutPokemonScreenData screenData,
  );
  InformationAboutPokemonData toDomainModelData(InformationAboutPokemonScreenData screenData);
}

class _InformationAboutPokemonViewMapper implements InformationAboutPokemonViewMapper {
  @override
  void toScreenData(
    InformationAboutPokemonScreenData screenData,
  ) {
    name:
    screenData.name ?? '';
    height:
    screenData.height ?? 0;
    weight:
    screenData.weight ?? 0;
  }

  @override
  InformationAboutPokemonData toDomainModelData(InformationAboutPokemonScreenData screenData) {
    return InformationAboutPokemonData(
      url: screenData.url,
    );
  }
}
