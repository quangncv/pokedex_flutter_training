// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeResponse _$TypeResponseFromJson(Map<String, dynamic> json) => TypeResponse(
      DamageRelation.fromJson(json['damage_relations'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeResponseToJson(TypeResponse instance) =>
    <String, dynamic>{
      'damage_relations': instance.damageRelations,
    };

DamageRelation _$DamageRelationFromJson(Map<String, dynamic> json) =>
    DamageRelation(
      (json['double_damage_from'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['double_damage_to'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['half_damage_from'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['half_damage_to'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['no_damage_from'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['no_damage_to'] as List<dynamic>)
          .map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DamageRelationToJson(DamageRelation instance) =>
    <String, dynamic>{
      'double_damage_from': instance.doubleDamageFrom,
      'double_damage_to': instance.doubleDamageTo,
      'half_damage_from': instance.halfDamageFrom,
      'half_damage_to': instance.halfDamageTo,
      'no_damage_from': instance.noDamageFrom,
      'no_damage_to': instance.noDamageTo,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      json['name'] as String,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
    };
