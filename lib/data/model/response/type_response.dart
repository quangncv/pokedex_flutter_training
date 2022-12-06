import 'package:json_annotation/json_annotation.dart';

part 'type_response.g.dart';

@JsonSerializable()
class TypeResponse {
  @JsonKey(name: 'damage_relations')
  DamageRelation damageRelations;

  TypeResponse(this.damageRelations);

  factory TypeResponse.fromJson(Map<String, dynamic> json) => _$TypeResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$TypeResponseToJson(this);
}

@JsonSerializable()
class DamageRelation {
  @JsonKey(name: 'double_damage_from')
  List<Type> doubleDamageFrom;
  @JsonKey(name: 'double_damage_to')
  List<Type> doubleDamageTo;
  @JsonKey(name: 'half_damage_from')
  List<Type> halfDamageFrom;
  @JsonKey(name: 'half_damage_to')
  List<Type> halfDamageTo;
  @JsonKey(name: 'no_damage_from')
  List<Type> noDamageFrom;
  @JsonKey(name: 'no_damage_to')
  List<Type> noDamageTo;

  DamageRelation(this.doubleDamageFrom, this.doubleDamageTo, this.halfDamageFrom,
      this.halfDamageTo, this.noDamageFrom, this.noDamageTo);

  factory DamageRelation.fromJson(Map<String, dynamic> json) => _$DamageRelationFromJson(json);
  Map<String, dynamic> toJson() =>_$DamageRelationToJson(this);
}

@JsonSerializable()
class Type {
  @JsonKey(name: 'name')
  String name;

  Type(this.name);

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
  Map<String, dynamic> toJson() =>_$TypeToJson(this);
}