import 'package:json_annotation/json_annotation.dart';

part 'move.g.dart';

@JsonSerializable()
class Move {
  @JsonKey(name: 'accuracy')
  int? accuracy;
  @JsonKey(name: 'effect_entries')
  List<EffectEntries>? effectEntries;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'power')
  int? power;
  @JsonKey(name: 'pp')
  int? pp;
  @JsonKey(name: 'priority')
  int? priority;
  @JsonKey(name: 'type')
  Type? type;

  Move({this.accuracy, this.effectEntries, this.id, this.name, this.power, this.pp, this.priority, this.type});

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);
  Map<String, dynamic> toJson() =>_$MoveToJson(this);
}

@JsonSerializable()
class Type {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'url')
  String? url;

  Type({this.name, this.url});

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
  Map<String, dynamic> toJson() =>_$TypeToJson(this);
}

@JsonSerializable()
class EffectEntries {
  @JsonKey(name: 'effect')
  String? effect;
  @JsonKey(name: 'short_effect')
  String? shortEffect;

  EffectEntries({this.effect, this.shortEffect});

  factory EffectEntries.fromJson(Map<String, dynamic> json) => _$EffectEntriesFromJson(json);
  Map<String, dynamic> toJson() =>_$EffectEntriesToJson(this);
}
