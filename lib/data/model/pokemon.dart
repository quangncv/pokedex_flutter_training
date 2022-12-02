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

  // Pokemon.fromJson(Map<String, dynamic> json) {
  //   if (json['abilities'] != null) {
  //     abilities = <Abilities>[];
  //     json['abilities'].forEach((v) {
  //       abilities!.add(new Abilities.fromJson(v));
  //     });
  //   }
  //   baseExperience = json['base_experience'];
  //   height = json['height'];
  //   id = json['id'];
  //   isDefault = json['is_default'];
  //   if (json['moves'] != null) {
  //     moves = <Moves>[];
  //     json['moves'].forEach((v) {
  //       moves!.add(Moves.fromJson(v));
  //     });
  //   }
  //   name = json['name'];
  //   order = json['order'];
  //   species =
  //   json['species'] != null ? new Ability.fromJson(json['species']) : null;
  //   if (json['stats'] != null) {
  //     stats = <Stats>[];
  //     json['stats'].forEach((v) {
  //       stats!.add(new Stats.fromJson(v));
  //     });
  //   }
  //   if (json['types'] != null) {
  //     types = <Types>[];
  //     json['types'].forEach((v) {
  //       types!.add(new Types.fromJson(v));
  //     });
  //   }
  //   weight = json['weight'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.abilities != null) {
  //     data['abilities'] = this.abilities!.map((v) => v.toJson()).toList();
  //   }
  //   data['base_experience'] = this.baseExperience;
  //   data['height'] = this.height;
  //   data['id'] = this.id;
  //   data['is_default'] = this.isDefault;
  //   if (this.moves != null) {
  //     data['moves'] = this.moves!.map((v) => v.toJson()).toList();
  //   }
  //   data['name'] = this.name;
  //   data['order'] = this.order;
  //   if (this.species != null) {
  //     data['species'] = this.species!.toJson();
  //   }
  //   if (this.stats != null) {
  //     data['stats'] = this.stats!.map((v) => v.toJson()).toList();
  //   }
  //   if (this.types != null) {
  //     data['types'] = this.types!.map((v) => v.toJson()).toList();
  //   }
  //   data['weight'] = this.weight;
  //   return data;
  // }
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

  // Abilities.fromJson(Map<String, dynamic> json) {
  //   ability =
  //   json['ability'] != null ? new Ability.fromJson(json['ability']) : null;
  //   isHidden = json['is_hidden'];
  //   slot = json['slot'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.ability != null) {
  //     data['ability'] = this.ability!.toJson();
  //   }
  //   data['is_hidden'] = this.isHidden;
  //   data['slot'] = this.slot;
  //   return data;
  // }
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

  // Ability.fromJson(Map<String, dynamic> json) {
  //   name = json['name'];
  //   url = json['url'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['url'] = this.url;
  //   return data;
  // }
}

@JsonSerializable()
class Moves {
  @JsonKey(name: 'move')
  Ability? move;

  Moves({this.move});

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
  Map<String, dynamic> toJson() => _$MovesToJson(this);

  // Moves.fromJson(Map<String, dynamic> json) {
  //   move = json['move'] != null ? new Ability.fromJson(json['move']) : null;
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.move != null) {
  //     data['move'] = this.move!.toJson();
  //   }
  //   return data;
  // }
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

  // Stats.fromJson(Map<String, dynamic> json) {
  //   baseStat = json['base_stat'];
  //   effort = json['effort'];
  //   stat = json['stat'] != null ? new Ability.fromJson(json['stat']) : null;
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['base_stat'] = this.baseStat;
  //   data['effort'] = this.effort;
  //   if (this.stat != null) {
  //     data['stat'] = this.stat!.toJson();
  //   }
  //   return data;
  // }
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

  // Types.fromJson(Map<String, dynamic> json) {
  //   slot = json['slot'];
  //   type = json['type'] != null ? new Ability.fromJson(json['type']) : null;
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['slot'] = this.slot;
  //   if (this.type != null) {
  //     data['type'] = this.type!.toJson();
  //   }
  //   return data;
  // }
}
