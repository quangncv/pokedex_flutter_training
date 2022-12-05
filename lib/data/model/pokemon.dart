import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon {
  @JsonKey(name: 'abilities')
  List<Abilities>? abilities;
  @JsonKey(name: 'base_experience')
  int? baseExperience;
  @JsonKey(name: 'height')
  int? height;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'moves')
  List<Moves>? moves;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'order')
  int? order;
  @JsonKey(name: 'species')
  Ability? species;
  @JsonKey(name: 'stats')
  List<Stats>? stats;
  @JsonKey(name: 'types')
  List<Types>? types;
  @JsonKey(name: 'weight')
  int? weight;

  Pokemon(
      {this.abilities,
        this.baseExperience,
        this.height,
        this.id,
        this.isDefault,
        this.moves,
        this.name,
        this.order,
        this.species,
        this.stats,
        this.types,
        this.weight});

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
  Map<String, dynamic> toJson() =>_$PokemonToJson(this);
}

@JsonSerializable()
class Abilities {
  @JsonKey(name: 'ability')
  Ability? ability;
  @JsonKey(name: 'is_hidden')
  bool? isHidden;
  @JsonKey(name: 'slot')
  int? slot;

  Abilities({this.ability, this.isHidden, this.slot});

  factory Abilities.fromJson(Map<String, dynamic> json) => _$AbilitiesFromJson(json);
  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}

@JsonSerializable()
class Ability {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'url')
  String? url;

  Ability({this.name, this.url});

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class Moves {
  @JsonKey(name: 'move')
  Ability? move;

  Moves({this.move});

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
  Map<String, dynamic> toJson() => _$MovesToJson(this);
}

@JsonSerializable()
class Stats {
  @JsonKey(name: 'base_stat')
  int? baseStat;
  @JsonKey(name: 'effort')
  int? effort;
  @JsonKey(name: 'stat')
  Ability? stat;

  Stats({this.baseStat, this.effort, this.stat});

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
  Map<String, dynamic> toJson() => _$StatsToJson(this);
}

@JsonSerializable()
class Types {
  @JsonKey(name: 'slot')
  int? slot;
  @JsonKey(name: 'type')
  Ability? type;

  Types({this.slot, this.type});

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);
  Map<String, dynamic> toJson() => _$TypesToJson(this);
}
