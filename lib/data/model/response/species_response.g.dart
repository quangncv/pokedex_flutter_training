// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesResponse _$SpeciesResponseFromJson(Map<String, dynamic> json) =>
    SpeciesResponse(
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>?)
          ?.map((e) => FlavorTextEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..eggGroups = (json['egg_groups'] as List<dynamic>?)
          ?.map((e) => EggResponse.fromJson(e as Map<String, dynamic>))
          .toList()
      ..hatchCounter = json['hatch_counter'] as int?
      ..genderRate = json['gender_rate'] as int?
      ..habitat = json['habitat'] == null
          ? null
          : HabitatResponse.fromJson(json['habitat'] as Map<String, dynamic>)
      ..generation = json['generation'] == null
          ? null
          : GenerationResponse.fromJson(
              json['generation'] as Map<String, dynamic>)
      ..captureRate = json['capture_rate'] as int?
      ..evolutionChain = json['evolution_chain'] == null
          ? null
          : EvolutionChainResponse.fromJson(
              json['evolution_chain'] as Map<String, dynamic>);

Map<String, dynamic> _$SpeciesResponseToJson(SpeciesResponse instance) =>
    <String, dynamic>{
      'flavor_text_entries': instance.flavorTextEntries,
      'egg_groups': instance.eggGroups,
      'hatch_counter': instance.hatchCounter,
      'gender_rate': instance.genderRate,
      'habitat': instance.habitat,
      'generation': instance.generation,
      'capture_rate': instance.captureRate,
      'evolution_chain': instance.evolutionChain,
    };

FlavorTextEntry _$FlavorTextEntryFromJson(Map<String, dynamic> json) =>
    FlavorTextEntry(
      flavorText: json['flavor_text'] as String?,
      language: json['language'] == null
          ? null
          : FlavorTextEntryLanguage.fromJson(
              json['language'] as Map<String, dynamic>),
      version: json['version'] == null
          ? null
          : FlavorTextEntryVersion.fromJson(
              json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorTextEntryToJson(FlavorTextEntry instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version': instance.version,
    };

FlavorTextEntryLanguage _$FlavorTextEntryLanguageFromJson(
        Map<String, dynamic> json) =>
    FlavorTextEntryLanguage(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$FlavorTextEntryLanguageToJson(
        FlavorTextEntryLanguage instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

FlavorTextEntryVersion _$FlavorTextEntryVersionFromJson(
        Map<String, dynamic> json) =>
    FlavorTextEntryVersion(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$FlavorTextEntryVersionToJson(
        FlavorTextEntryVersion instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

EggResponse _$EggResponseFromJson(Map<String, dynamic> json) => EggResponse(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$EggResponseToJson(EggResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

HabitatResponse _$HabitatResponseFromJson(Map<String, dynamic> json) =>
    HabitatResponse(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$HabitatResponseToJson(HabitatResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

GenerationResponse _$GenerationResponseFromJson(Map<String, dynamic> json) =>
    GenerationResponse(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GenerationResponseToJson(GenerationResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

EvolutionChainResponse _$EvolutionChainResponseFromJson(
        Map<String, dynamic> json) =>
    EvolutionChainResponse(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$EvolutionChainResponseToJson(
        EvolutionChainResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
