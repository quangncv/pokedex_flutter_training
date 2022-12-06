import 'package:numerus/roman/roman.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/data/model/response/pokemon_response.dart';
import 'package:pokedex_app/data/model/response/type_response.dart';
import 'package:pokedex_app/extensions/string_ext.dart';

class Pokemon {
  List<Ability>? abilities;
  int? baseExperience;
  int? height;
  int? id;
  bool? isDefault;
  List<Move>? moves;
  String? name;
  int? order;
  String? species;
  List<Stats>? stats;
  List<Types>? types;
  int? weight;
  DamageRelation? damageRelations;
  List<String>? eggGroups;
  int? hatchCounter;
  int? genderRate;
  String? habitat;
  int? captureRate;
  String? generation;
  List<Evolution>? evolutions;

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
      this.weight,
      this.eggGroups,
      this.hatchCounter,
      this.habitat,
      this.evolutions});

  List<String> getTypes() {
    return types?.map((e) => e.type?.name ?? 'normal').toList() ?? [];
  }

  PokemonTypes mainType() => PokemonTypes.getType(getTypes().first);

  int getSteps() {
    return 255 * ((hatchCounter ?? 0) + 1);
  }

  double maleRatio() {
    return 12.5 * (8 - (genderRate ?? 0));
  }

  double femaleRatio() {
    return 12.5 * (genderRate ?? 0);
  }

  String getGeneration() {
    final strSplit = generation?.split('-');

    return '${strSplit?[0]} ${strSplit?[1].toRomanNumeralValue()}';
  }
}

class Ability {
  String? name;
  String? desc;

  Ability({this.name, this.desc});
}

class Evolution {
  int id;
  String name;
  int evolvesToId;
  String evolvesToName;
  List<int?> minLevel;
  List<String?> trigger;
  List<String?> items;
  List<int?> minHappiness;
  List<String?> timeOfDays;
  List<String?> knownMoveTypes;

  Evolution(
    this.id,
    this.name,
    this.evolvesToId,
    this.evolvesToName,
    this.minLevel,
    this.trigger,
    this.items,
      this.minHappiness,
      this.timeOfDays,
      this.knownMoveTypes,
  );

  String getEvolutionDetail() {
    var content = '';

    switch (trigger.last) {
      case 'use-item':
        content = items.last.toString().capitalize().replaceAll('-', ' ');
        break;
      default:
        if (minLevel.last != null) {
          content = 'Lv.${minLevel.last}';
        } else if (minHappiness.last != null && (timeOfDays.last ?? '').isNotEmpty) {
          content = 'Happiness.${minHappiness.last} in ${timeOfDays.last}';
        } else if (minHappiness.last != null && knownMoveTypes.last != null) {
          content = 'After ${knownMoveTypes.last}-type move learned and Happiness.${minHappiness.last}';
        }
        break;
    }

    return content;
  }
}

class Move {
  String name;
  int level;

  Move(this.name, this.level);
}
