import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/data/model/move.dart';

part 'move_response.g.dart';

@JsonSerializable()
class MoveResponse {
  @JsonKey(name: 'accuracy')
  int? accuracy;
  @JsonKey(name: 'effect_entries')
  List<EffectEntries>? effectEntries;
  @JsonKey(name: 'effect_chance')
  int? effectChange;
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

  MoveResponse(
      {this.accuracy,
      this.effectEntries,
      this.id,
      this.name,
      this.power,
      this.pp,
      this.priority,
      this.type,
      this.effectChange});

  factory MoveResponse.fromJson(Map<String, dynamic> json) =>
      _$MoveResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoveResponseToJson(this);

  Move toDisplayModel() {
    return Move(
      name ?? '',
      0,
      type?.name ?? 'normal',
      accuracy: accuracy,
      power: power,
      pp: pp,
      desc: effectEntries?.first.effect,
      effectChange: effectChange,
    );
  }
}

@JsonSerializable()
class Type {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'url')
  String? url;

  Type({this.name, this.url});

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class EffectEntries {
  @JsonKey(name: 'effect')
  String? effect;
  @JsonKey(name: 'short_effect')
  String? shortEffect;

  EffectEntries({this.effect, this.shortEffect});

  factory EffectEntries.fromJson(Map<String, dynamic> json) =>
      _$EffectEntriesFromJson(json);

  Map<String, dynamic> toJson() => _$EffectEntriesToJson(this);
}
