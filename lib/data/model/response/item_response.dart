import 'package:json_annotation/json_annotation.dart';

part 'item_response.g.dart';

@JsonSerializable()
class ItemResponse {
  @JsonKey(name: 'attributes')
  List<Attributes>? attributes;
  @JsonKey(name: 'cost')
  int? cost;
  @JsonKey(name: 'effect_entries')
  List<EffectEntries>? effectEntries;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'sprites')
  Sprites? sprites;

  ItemResponse({this.attributes, this.cost, this.effectEntries, this.id, this.name, this.sprites});

  factory ItemResponse.fromJson(Map<String, dynamic> json) => _$ItemResponseFromJson(json);
  Map<String, dynamic> toJson() =>_$ItemResponseToJson(this);
}

@JsonSerializable()
class Attributes {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'url')
  String? url;

  Attributes({this.name, this.url});

  factory Attributes.fromJson(Map<String, dynamic> json) => _$AttributesFromJson(json);
  Map<String, dynamic> toJson() =>_$AttributesToJson(this);
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

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'default')
  String? image;

  Sprites({this.image});

  factory Sprites.fromJson(Map<String, dynamic> json) => _$SpritesFromJson(json);
  Map<String, dynamic> toJson() =>_$SpritesToJson(this);
}
