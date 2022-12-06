// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evolution_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvolutionResponse _$EvolutionResponseFromJson(Map<String, dynamic> json) =>
    EvolutionResponse(
      ChainResponse.fromJson(json['chain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EvolutionResponseToJson(EvolutionResponse instance) =>
    <String, dynamic>{
      'chain': instance.chain,
    };

ChainResponse _$ChainResponseFromJson(Map<String, dynamic> json) =>
    ChainResponse(
      evolutionDetails: (json['evolution_details'] as List<dynamic>?)
          ?.map((e) =>
              EvolutionDetailResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolvesTo: (json['evolves_to'] as List<dynamic>?)
          ?.map((e) => ChainResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: json['species'] == null
          ? null
          : SpeciesEvolutionResponse.fromJson(
              json['species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChainResponseToJson(ChainResponse instance) =>
    <String, dynamic>{
      'evolution_details': instance.evolutionDetails,
      'evolves_to': instance.evolvesTo,
      'species': instance.species,
    };

EvolutionDetailResponse _$EvolutionDetailResponseFromJson(
        Map<String, dynamic> json) =>
    EvolutionDetailResponse(
      minLv: json['min_level'] as int?,
      trigger: json['trigger'] == null
          ? null
          : TriggerResponse.fromJson(json['trigger'] as Map<String, dynamic>),
      item: json['item'] == null
          ? null
          : ItemEvolutionResponse.fromJson(
              json['item'] as Map<String, dynamic>),
    )
      ..minHappiness = json['min_happiness'] as int?
      ..timeOfDay = json['time_of_day'] as String?
      ..knownMoveType = json['known_move_type'] == null
          ? null
          : KnownMoveTypeResponse.fromJson(
              json['known_move_type'] as Map<String, dynamic>);

Map<String, dynamic> _$EvolutionDetailResponseToJson(
        EvolutionDetailResponse instance) =>
    <String, dynamic>{
      'min_level': instance.minLv,
      'trigger': instance.trigger,
      'item': instance.item,
      'min_happiness': instance.minHappiness,
      'time_of_day': instance.timeOfDay,
      'known_move_type': instance.knownMoveType,
    };

SpeciesEvolutionResponse _$SpeciesEvolutionResponseFromJson(
        Map<String, dynamic> json) =>
    SpeciesEvolutionResponse(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$SpeciesEvolutionResponseToJson(
        SpeciesEvolutionResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

TriggerResponse _$TriggerResponseFromJson(Map<String, dynamic> json) =>
    TriggerResponse(
      json['name'] as String,
    );

Map<String, dynamic> _$TriggerResponseToJson(TriggerResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

ItemEvolutionResponse _$ItemEvolutionResponseFromJson(
        Map<String, dynamic> json) =>
    ItemEvolutionResponse(
      json['name'] as String,
    );

Map<String, dynamic> _$ItemEvolutionResponseToJson(
        ItemEvolutionResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

KnownMoveTypeResponse _$KnownMoveTypeResponseFromJson(
        Map<String, dynamic> json) =>
    KnownMoveTypeResponse(
      json['name'] as String,
    );

Map<String, dynamic> _$KnownMoveTypeResponseToJson(
        KnownMoveTypeResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
