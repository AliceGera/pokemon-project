// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_information_about_pokemon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiInformationAboutPokemonResponse _$ApiInformationAboutPokemonResponseFromJson(Map<String, dynamic> json) => ApiInformationAboutPokemonResponse(
      json['name'] as String?,
      json['weight'] as int?,
      json['height'] as int?,
      json['sprites'] == null ? null : ImagePokemon.fromJson(json['sprites'] as Map<String, dynamic>),
      (json['types'] as List<dynamic>?)?.map((e) => PokemonType.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$ApiInformationAboutPokemonResponseToJson(ApiInformationAboutPokemonResponse instance) => <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'sprites': instance.imagePokemon?.toJson(),
      'types': instance.types?.map((e) => e.toJson()).toList(),
    };

ImagePokemon _$ImagePokemonFromJson(Map<String, dynamic> json) => ImagePokemon(
      json['front_shiny'] as String?,
    );

Map<String, dynamic> _$ImagePokemonToJson(ImagePokemon instance) => <String, dynamic>{
      'front_shiny': instance.image,
    };


