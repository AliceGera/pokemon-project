import '../../domain/model/information_about_pokemon_data.dart';
import '../../domain/repository/information_about_pokemon_repository.dart';
import '../api/api_client.dart';
import '../mapper/information_about_pokemon_mapper.dart';
import '../model/information_about_pokemon/api_information_about_pokemon_response.dart';

class ApiInformationAboutPokemonRepository implements IInformationAboutPokemonRepository {
  final HttpRequestExecutor httpRequestExecutor;
  final IInformationAboutPokemonMapper informationAboutPokemonMapper;

  ApiInformationAboutPokemonRepository(
      this.httpRequestExecutor,
      this.informationAboutPokemonMapper,
      );

  @override
  Future<InformationAboutPokemonData> getInformationAboutPokemon(InformationAboutPokemonData informationAboutPokemonDomainData) async {
    final apiPokemonRequest = informationAboutPokemonMapper.toApiInformationAboutPokemonRequest(informationAboutPokemonDomainData);
    final response = await httpRequestExecutor.executeRequest(
      HttpMethod.get,
      Uri.parse(apiPokemonRequest.toQueryParametersString),
      null,
    );
    final mappedResponse = ApiInformationAboutPokemonResponse.fromJson(response);
    final pokemonData = informationAboutPokemonMapper.toInformationAboutPokemonData(mappedResponse);
    return pokemonData;
  }
}
