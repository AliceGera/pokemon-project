import 'package:json_annotation/json_annotation.dart';

part 'api_information_about_pokemon_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiInformationAboutPokemonResponse {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'weight')
  final int? weight;
  @JsonKey(name: 'height')
  final int? height;
  @JsonKey(name: 'sprites')
  final ImagePokemon? imagePokemon;
  @JsonKey(name: 'types')
  final List<PokemonType>? types;

  ApiInformationAboutPokemonResponse(
    this.name,
    this.weight,
    this.height,
    this.imagePokemon,
    this.types,
  );

  factory ApiInformationAboutPokemonResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApiInformationAboutPokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiInformationAboutPokemonResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ImagePokemon {
  @JsonKey(name: 'front_shiny')
  final String? image;

  ImagePokemon(this.image);

  factory ImagePokemon.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ImagePokemonFromJson(json);

  Map<String, dynamic> toJson() => _$ImagePokemonToJson(this);
}

@JsonSerializable()
class PokemonType {
  final String? name;

  PokemonType(this.name);

  factory PokemonType.fromJson(
    Map<String, dynamic> json,
  ) =>
      PokemonType(json['type']?['name']);

  Map<String, dynamic> toJson() => {};
}
