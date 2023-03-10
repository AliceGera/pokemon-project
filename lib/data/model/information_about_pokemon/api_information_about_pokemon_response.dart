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

  ApiInformationAboutPokemonResponse(
      this.name,
      this.weight,
      this.height,
      );

  factory ApiInformationAboutPokemonResponse.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$ApiInformationAboutPokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiInformationAboutPokemonResponseToJson(this);
}

