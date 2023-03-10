import '../../domain/model/information_about_pokemon_data.dart';
import '../model/information_about_pokemon/api_information_about_pokemon_request.dart';
import '../model/information_about_pokemon/api_information_about_pokemon_response.dart';

abstract class IInformationAboutPokemonMapper {
  factory IInformationAboutPokemonMapper() => _IInformationAboutPokemonMapper();

  ApiInformationAboutPokemonRequest toApiInformationAboutPokemonRequest(InformationAboutPokemonData data);

  InformationAboutPokemonData toInformationAboutPokemonData(ApiInformationAboutPokemonResponse data);
}

class _IInformationAboutPokemonMapper implements IInformationAboutPokemonMapper {
  @override
  ApiInformationAboutPokemonRequest toApiInformationAboutPokemonRequest(InformationAboutPokemonData data) {
    return ApiInformationAboutPokemonRequest(
      url: data.url,
    );
  }

  @override
  InformationAboutPokemonData toInformationAboutPokemonData(ApiInformationAboutPokemonResponse data) {
    name:
    data.name;
    weight:
    data.weight;
    height:
    data.height;
    return InformationAboutPokemonData(name: data.name, weight: data.weight, height: data.height);
  }
}
