// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonResponse _$PokemonResponseFromJson(Map<String, dynamic> json) =>
    PokemonResponse(
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => Abilities.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseExperience: json['base_experience'] as int?,
      height: json['height'] as int?,
      id: json['id'] as int?,
      isDefault: json['is_default'] as bool?,
      moves: (json['moves'] as List<dynamic>?)
          ?.map((e) => MovesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      order: json['order'] as int?,
      species: json['species'] == null
          ? null
          : AbilityResponse.fromJson(json['species'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>?)
          ?.map((e) => Stats.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: json['weight'] as int?,
    );

Map<String, dynamic> _$PokemonResponseToJson(PokemonResponse instance) =>
    <String, dynamic>{
      'abilities': instance.abilities,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'id': instance.id,
      'is_default': instance.isDefault,
      'moves': instance.moves,
      'name': instance.name,
      'order': instance.order,
      'species': instance.species,
      'stats': instance.stats,
      'types': instance.types,
      'weight': instance.weight,
    };

Abilities _$AbilitiesFromJson(Map<String, dynamic> json) => Abilities(
      ability: json['ability'] == null
          ? null
          : AbilityResponse.fromJson(json['ability'] as Map<String, dynamic>),
      isHidden: json['is_hidden'] as bool?,
      slot: json['slot'] as int?,
    );

Map<String, dynamic> _$AbilitiesToJson(Abilities instance) => <String, dynamic>{
      'ability': instance.ability,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };

AbilityResponse _$AbilityResponseFromJson(Map<String, dynamic> json) =>
    AbilityResponse(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$AbilityResponseToJson(AbilityResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

MovesResponse _$MovesResponseFromJson(Map<String, dynamic> json) =>
    MovesResponse(
      MoveBaseResponse.fromJson(json['move'] as Map<String, dynamic>),
      (json['version_group_details'] as List<dynamic>)
          .map((e) =>
              MoveVersionDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovesResponseToJson(MovesResponse instance) =>
    <String, dynamic>{
      'move': instance.move,
      'version_group_details': instance.moveVersionDetails,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      baseStat: json['base_stat'] as int?,
      effort: json['effort'] as int?,
      stat: json['stat'] == null
          ? null
          : AbilityResponse.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      slot: json['slot'] as int?,
      type: json['type'] == null
          ? null
          : AbilityResponse.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };

MoveVersionDetailResponse _$MoveVersionDetailResponseFromJson(
        Map<String, dynamic> json) =>
    MoveVersionDetailResponse(
      json['level_learned_at'] as int,
      MoveBaseResponse.fromJson(
          json['move_learn_method'] as Map<String, dynamic>),
      MoveBaseResponse.fromJson(json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveVersionDetailResponseToJson(
        MoveVersionDetailResponse instance) =>
    <String, dynamic>{
      'level_learned_at': instance.levelLearnedAt,
      'move_learn_method': instance.moveLearnMethod,
      'version_group': instance.versionGroup,
    };

MoveBaseResponse _$MoveBaseResponseFromJson(Map<String, dynamic> json) =>
    MoveBaseResponse(
      json['name'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$MoveBaseResponseToJson(MoveBaseResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
