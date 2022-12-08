import 'package:pokedex_app/common/constants.dart';

class Move {
  String name;
  int level;
  String? type;
  int? accuracy;
  int? power;
  int? pp;
  String? desc;
  int? effectChange;

  Move(
    this.name,
    this.level,
    this.type, {
    this.accuracy,
    this.power,
    this.pp,
    this.desc,
    this.effectChange,
  });

  PokemonTypes getType() {
    return PokemonTypes.getType(type ?? 'normal');
  }

  String getDesc() {
    var descStr = '';
    descStr = desc.toString().replaceAll('\$effect_chance', effectChange.toString());
    return descStr;
  }
}
