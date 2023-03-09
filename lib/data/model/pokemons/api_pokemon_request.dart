class ApiPokemonRequest {
  final int? offset;
  final int? limit;

  ApiPokemonRequest({
    this.offset,
    this.limit,
  });

  String get toQueryParametersString => 'offset=$offset&limit=$limit';
}
