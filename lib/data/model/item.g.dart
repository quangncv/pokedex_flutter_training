// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => Attributes.fromJson(e as Map<String, dynamic>))
          .toList(),
      cost: json['cost'] as int?,
      effectEntries: (json['effect_entries'] as List<dynamic>?)
          ?.map((e) => EffectEntries.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      name: json['name'] as String?,
      sprites: json['sprites'] == null
          ? null
          : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'attributes': instance.attributes,
      'cost': instance.cost,
      'effect_entries': instance.effectEntries,
      'id': instance.id,
      'name': instance.name,
      'sprites': instance.sprites,
    };

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

EffectEntries _$EffectEntriesFromJson(Map<String, dynamic> json) =>
    EffectEntries(
      effect: json['effect'] as String?,
      shortEffect: json['short_effect'] as String?,
    );

Map<String, dynamic> _$EffectEntriesToJson(EffectEntries instance) =>
    <String, dynamic>{
      'effect': instance.effect,
      'short_effect': instance.shortEffect,
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      image: json['default'] as String?,
    );

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'default': instance.image,
    };
