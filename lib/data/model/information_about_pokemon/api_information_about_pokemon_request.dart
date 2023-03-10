class ApiInformationAboutPokemonRequest {
  final String? url;


  ApiInformationAboutPokemonRequest({
    this.url,
  });

  String get toQueryParametersString => '$url';
}
