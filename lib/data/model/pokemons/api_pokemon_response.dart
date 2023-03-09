import 'package:json_annotation/json_annotation.dart';
part 'api_pokemon_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiPokemonResponse {
  @JsonKey(name: 'results')
  final List<ApiPokemonItem>? results;
  @JsonKey(name: 'offset')
  final int? offset;
  @JsonKey(name: 'limit')
  final int? limit;
  ApiPokemonResponse(
    this.results,
      this.offset,
      this.limit,
  );

  factory ApiPokemonResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApiPokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiPokemonResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ApiPokemonItem {

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'url')
  final String? url;

  ApiPokemonItem(
    this.name,
    this.url,
  );

  factory ApiPokemonItem.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApiPokemonItemFromJson(json);

  Map<String, dynamic> toJson() => _$ApiPokemonItemToJson(this);
}
