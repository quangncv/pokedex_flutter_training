import 'package:flutter/material.dart';
import 'package:pokedex_app/utils/theme.dart';

const pokemonImageUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';

class ImageAssets {
  static const ic_logo = 'assets/images/ic_logo.svg';
  static const ic_gender = 'assets/images/ic_gender.svg';
  static const ic_capture_rate = 'assets/images/ic_capture_rate.svg';
  static const ic_pokemon = 'assets/images/ic_pokemon.svg';
  static const ic_moves = 'assets/images/ic_moves.svg';
  static const ic_items = 'assets/images/ic_items.svg';
  static const ic_type_grass = 'assets/images/ic_grass.svg';
  static const ic_type_dark = 'assets/images/ic_dark.svg';
  static const ic_type_bug = 'assets/images/ic_bug.svg';
  static const ic_type_dragon = 'assets/images/ic_dragon.svg';
  static const ic_type_electric = 'assets/images/ic_electric.svg';
  static const ic_type_fairy = 'assets/images/ic_fairy.svg';
  static const ic_type_fight = 'assets/images/ic_fighting.svg';
  static const ic_type_fire = 'assets/images/ic_fire.svg';
  static const ic_type_flying = 'assets/images/ic_flying.svg';
  static const ic_type_ghost = 'assets/images/ic_ghost.svg';
  static const ic_type_ground = 'assets/images/ic_ground.svg';
  static const ic_type_ice = 'assets/images/ic_ice.svg';
  static const ic_type_normal = 'assets/images/ic_normal.svg';
  static const ic_type_poison = 'assets/images/ic_poison.svg';
  static const ic_type_psychic = 'assets/images/ic_psychic.svg';
  static const ic_type_rock = 'assets/images/ic_rock.svg';
  static const ic_type_steel = 'assets/images/ic_steel.svg';
  static const ic_type_water = 'assets/images/ic_water.svg';
  static const ic_item_count = 'assets/images/ic_item_count.png';
  static const ic_tag_grass = 'assets/images/ic_tag_grass.svg';
  static const ic_tag_dark = 'assets/images/ic_tag_dark.svg';
  static const ic_tag_bug = 'assets/images/ic_tag_bug.svg';
  static const ic_tag_dragon = 'assets/images/ic_tag_dragon.svg';
  static const ic_tag_electric = 'assets/images/ic_tag_electric.svg';
  static const ic_tag_fairy = 'assets/images/ic_tag_fairy.svg';
  static const ic_tag_fight = 'assets/images/ic_tag_fighting.svg';
  static const ic_tag_fire = 'assets/images/ic_tag_fire.svg';
  static const ic_tag_flying = 'assets/images/ic_tag_flying.svg';
  static const ic_tag_ghost = 'assets/images/ic_tag_ghost.svg';
  static const ic_tag_ground = 'assets/images/ic_tag_ground.svg';
  static const ic_tag_ice = 'assets/images/ic_tag_ice.svg';
  static const ic_tag_normal = 'assets/images/ic_tag_normal.svg';
  static const ic_tag_poison = 'assets/images/ic_tag_poison.svg';
  static const ic_tag_psychic = 'assets/images/ic_tag_psychic.svg';
  static const ic_tag_rock = 'assets/images/ic_tag_rock.svg';
  static const ic_tag_steel = 'assets/images/ic_tag_steel.svg';
  static const ic_tag_water = 'assets/images/ic_tag_water.svg';
  static const ic_arrow_evolution = 'assets/images/ic_arrow_evolution.svg';

  static const img_bulbasaur = 'assets/images/img_bulbasaur.png';
  static const img_squirtle = 'assets/images/img_squirtle.png';
  static const img_ball = 'assets/images/img_ball.png';
}

enum PokemonTypes {
  bug(ImageAssets.ic_type_bug, ImageAssets.ic_tag_bug, kColorBug, bugGradientBackground),
  dark(ImageAssets.ic_type_dark, ImageAssets.ic_tag_dark, kColorDark, darkGradientBackground),
  dragon(ImageAssets.ic_type_dragon, ImageAssets.ic_tag_dragon, kColorDragon, dragonGradientBackground),
  electric(ImageAssets.ic_type_electric, ImageAssets.ic_tag_electric, kColorElectric, electricGradientBackground),
  fairy(ImageAssets.ic_type_fairy, ImageAssets.ic_tag_fairy, kColorFairy, fairyGradientBackground),
  fighting(ImageAssets.ic_type_fight, ImageAssets.ic_tag_fight, kColorFight, fightGradientBackground),
  fire(ImageAssets.ic_type_fire, ImageAssets.ic_tag_fire, kColorFire, fireGradientBackground),
  flying(ImageAssets.ic_type_flying, ImageAssets.ic_tag_flying, kColorFlying, flyingGradientBackground),
  ghost(ImageAssets.ic_type_ghost, ImageAssets.ic_tag_ghost, kColorGhost, ghostGradientBackground),
  grass(ImageAssets.ic_type_grass, ImageAssets.ic_tag_grass, kColorGrass, grassGradientBackground),
  ground(ImageAssets.ic_type_ground, ImageAssets.ic_tag_ground, kColorGround, groundGradientBackground),
  ice(ImageAssets.ic_type_ice, ImageAssets.ic_tag_ice, kColorIce, iceGradientBackground),
  normal(ImageAssets.ic_type_normal, ImageAssets.ic_tag_normal, kColorNormal, normalGradientBackground),
  poison(ImageAssets.ic_type_poison, ImageAssets.ic_tag_poison, kColorPoison, poisonGradientBackground),
  psychic(ImageAssets.ic_type_psychic, ImageAssets.ic_tag_psychic, kColorPsychic, psychicGradientBackground),
  rock(ImageAssets.ic_type_rock, ImageAssets.ic_tag_rock, kColorRock, rockGradientBackground),
  steel(ImageAssets.ic_type_steel, ImageAssets.ic_tag_steel, kColorSteel, steelGradientBackground),
  water(ImageAssets.ic_type_water, ImageAssets.ic_tag_water, kColorWater, waterGradientBackground);

  const PokemonTypes(this.image, this.tagImage, this.color, this.bgGradient);
  final String image;
  final String tagImage;
  final Color color;
  final LinearGradient bgGradient;

  static PokemonTypes getType(String type) {
    return type.isNotEmpty ? PokemonTypes.values.firstWhere((element) => element.name == type) : PokemonTypes.normal;
  }
}