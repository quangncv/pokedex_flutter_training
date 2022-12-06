// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbilityDetailResponse _$AbilityDetailResponseFromJson(
        Map<String, dynamic> json) =>
    AbilityDetailResponse(
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>?)
          ?.map((e) => FlavorTextEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AbilityDetailResponseToJson(
        AbilityDetailResponse instance) =>
    <String, dynamic>{
      'flavor_text_entries': instance.flavorTextEntries,
    };

FlavorTextEntry _$FlavorTextEntryFromJson(Map<String, dynamic> json) =>
    FlavorTextEntry(
      flavorText: json['flavor_text'] as String?,
      language: json['language'] == null
          ? null
          : FlavorTextEntryLanguage.fromJson(
              json['language'] as Map<String, dynamic>),
      version: json['version_group'] == null
          ? null
          : FlavorTextEntryVersion.fromJson(
              json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FlavorTextEntryToJson(FlavorTextEntry instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version_group': instance.version,
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
