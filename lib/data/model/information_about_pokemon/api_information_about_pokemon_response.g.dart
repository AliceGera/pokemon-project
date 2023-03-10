// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_information_about_pokemon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiInformationAboutPokemonResponse _$ApiInformationAboutPokemonResponseFromJson(
        Map<String, dynamic> json) =>
    ApiInformationAboutPokemonResponse(
      json['name'] as String?,
      json['weight'] as int?,
      json['height'] as int?,
    );

Map<String, dynamic> _$ApiInformationAboutPokemonResponseToJson(
        ApiInformationAboutPokemonResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
    };
