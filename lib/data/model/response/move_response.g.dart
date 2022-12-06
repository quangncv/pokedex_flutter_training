// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveResponse _$MoveResponseFromJson(Map<String, dynamic> json) => MoveResponse(
      accuracy: json['accuracy'] as int?,
      effectEntries: (json['effect_entries'] as List<dynamic>?)
          ?.map((e) => EffectEntries.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      name: json['name'] as String?,
      power: json['power'] as int?,
      pp: json['pp'] as int?,
      priority: json['priority'] as int?,
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveResponseToJson(MoveResponse instance) =>
    <String, dynamic>{
      'accuracy': instance.accuracy,
      'effect_entries': instance.effectEntries,
      'id': instance.id,
      'name': instance.name,
      'power': instance.power,
      'pp': instance.pp,
      'priority': instance.priority,
      'type': instance.type,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
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
