// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_pokemon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPokemonResponse _$ApiPokemonResponseFromJson(Map<String, dynamic> json) =>
    ApiPokemonResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => ApiPokemonItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['offset'] as int?,
      json['limit'] as int?,
    );

Map<String, dynamic> _$ApiPokemonResponseToJson(ApiPokemonResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e.toJson()).toList(),
      'offset': instance.offset,
      'limit': instance.limit,
    };

ApiPokemonItem _$ApiPokemonItemFromJson(Map<String, dynamic> json) =>
    ApiPokemonItem(
      json['name'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$ApiPokemonItemToJson(ApiPokemonItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
