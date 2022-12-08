import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/data/model/pokemon.dart';

part 'pokemon_response.g.dart';

@JsonSerializable()
class PokemonResponse {
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
  List<MovesResponse>? moves;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'order')
  int? order;
  @JsonKey(name: 'species')
  AbilityResponse? species;
  @JsonKey(name: 'stats')
  List<Stats>? stats;
  @JsonKey(name: 'types')
  List<Types>? types;
  @JsonKey(name: 'weight')
  int? weight;

  PokemonResponse(
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

  factory PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _$PokemonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);

  Pokemon toDisplayModel() {
    final List<Ability> abilityList = [];
    abilities?.forEach((element) {
      final ability = Ability(name: element.ability?.name ?? '');
      abilityList.add(ability);
    });

    final List<Move> moveList = [];
    final movesByLevelUp = moves?.where((move) {
      final moveDetail = move.moveVersionDetails.where((element) => element.moveLearnMethod.name == 'level-up' && element.versionGroup.name == 'ruby-sapphire').toList();
      return moveDetail.isNotEmpty;
    });

    movesByLevelUp?.forEach((element) {
      final detail = element.moveVersionDetails.firstWhere((element) => element.moveLearnMethod.name == 'level-up' && element.versionGroup.name == 'ruby-sapphire');
      final move = Move(element.move.name, detail.levelLearnedAt, null);
      moveList.add(move);
    });

    moveList.sort((a, b) => a.level.compareTo(b.level));

    return Pokemon(
      moves: moveList,
        abilities: abilityList,
        baseExperience: baseExperience,
        height: height,
        id: id,
        isDefault: isDefault,
        name: name,
        order: order,
        stats: stats,
        types: types,
        weight: weight);
  }
}

@JsonSerializable()
class Abilities {
  @JsonKey(name: 'ability')
  AbilityResponse? ability;
  @JsonKey(name: 'is_hidden')
  bool? isHidden;
  @JsonKey(name: 'slot')
  int? slot;

  Abilities({this.ability, this.isHidden, this.slot});

  factory Abilities.fromJson(Map<String, dynamic> json) =>
      _$AbilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$AbilitiesToJson(this);
}

@JsonSerializable()
class AbilityResponse {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'url')
  String? url;

  AbilityResponse({this.name, this.url});

  factory AbilityResponse.fromJson(Map<String, dynamic> json) =>
      _$AbilityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityResponseToJson(this);
}

@JsonSerializable()
class MovesResponse {
  @JsonKey(name: 'move')
  MoveBaseResponse move;
  @JsonKey(name: 'version_group_details')
  List<MoveVersionDetailResponse> moveVersionDetails;


  MovesResponse(this.move, this.moveVersionDetails);

  factory MovesResponse.fromJson(Map<String, dynamic> json) => _$MovesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovesResponseToJson(this);
}

@JsonSerializable()
class Stats {
  @JsonKey(name: 'base_stat')
  int? baseStat;
  @JsonKey(name: 'effort')
  int? effort;
  @JsonKey(name: 'stat')
  AbilityResponse? stat;

  Stats({this.baseStat, this.effort, this.stat});

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}

@JsonSerializable()
class Types {
  @JsonKey(name: 'slot')
  int? slot;
  @JsonKey(name: 'type')
  AbilityResponse? type;

  Types({this.slot, this.type});

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}

@JsonSerializable()
class MoveVersionDetailResponse {
  @JsonKey(name: 'level_learned_at')
  int levelLearnedAt;
  @JsonKey(name: 'move_learn_method')
  MoveBaseResponse moveLearnMethod;
  @JsonKey(name: 'version_group')
  MoveBaseResponse versionGroup;

  MoveVersionDetailResponse(
      this.levelLearnedAt, this.moveLearnMethod, this.versionGroup);

  factory MoveVersionDetailResponse.fromJson(Map<String, dynamic> json) => _$MoveVersionDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoveVersionDetailResponseToJson(this);
}

@JsonSerializable()
class MoveBaseResponse {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'url')
  String url;

  MoveBaseResponse(this.name, this.url);

  factory MoveBaseResponse.fromJson(Map<String, dynamic> json) => _$MoveBaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoveBaseResponseToJson(this);
}
