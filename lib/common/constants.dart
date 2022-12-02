import 'package:flutter/material.dart';
import 'package:pokedex_app/utils/theme.dart';

const pokemonImageUrl = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';

class ImageAssets {
  static const ic_logo = 'assets/images/ic_logo.svg';
  static const ic_pokemon = 'assets/images/ic_pokemon.svg';
  static const ic_moves = 'assets/images/ic_moves.svg';
  static const ic_items = 'assets/images/ic_items.svg';
  static const ic_type_grass = 'assets/images/ic_type_grass.png';
  static const ic_type_dark = 'assets/images/ic_type_dark.png';
  static const ic_type_bug = 'assets/images/ic_type_bug.png';
  static const ic_type_dragon = 'assets/images/ic_type_dragon.png';
  static const ic_type_electric = 'assets/images/ic_type_electric.png';
  static const ic_type_fairy = 'assets/images/ic_type_fairy.png';
  static const ic_type_fight = 'assets/images/ic_type_fight.png';
  static const ic_type_fire = 'assets/images/ic_type_fire.png';
  static const ic_type_flying = 'assets/images/ic_type_flying.png';
  static const ic_type_ghost = 'assets/images/ic_type_ghost.png';
  static const ic_type_ground = 'assets/images/ic_type_ground.png';
  static const ic_type_ice = 'assets/images/ic_type_ice.png';
  static const ic_type_normal = 'assets/images/ic_type_normal.png';
  static const ic_type_poison = 'assets/images/ic_type_poison.png';
  static const ic_type_psychic = 'assets/images/ic_type_psychic.png';
  static const ic_type_rock = 'assets/images/ic_type_rock.png';
  static const ic_type_steel = 'assets/images/ic_type_steel.png';
  static const ic_type_water = 'assets/images/ic_type_water.png';
  static const ic_item_count = 'assets/images/ic_item_count.png';
  static const ic_tag_grass = 'assets/images/ic_tag_grass.png';
  static const ic_tag_dark = 'assets/images/ic_tag_dark.png';
  static const ic_tag_bug = 'assets/images/ic_tag_bug.png';
  static const ic_tag_dragon = 'assets/images/ic_tag_dragon.png';
  static const ic_tag_electric = 'assets/images/ic_tag_electric.png';
  static const ic_tag_fairy = 'assets/images/ic_tag_fairy.png';
  static const ic_tag_fight = 'assets/images/ic_tag_fight.png';
  static const ic_tag_fire = 'assets/images/ic_tag_fire.png';
  static const ic_tag_flying = 'assets/images/ic_tag_flying.png';
  static const ic_tag_ghost = 'assets/images/ic_tag_ghost.png';
  static const ic_tag_ground = 'assets/images/ic_tag_ground.png';
  static const ic_tag_ice = 'assets/images/ic_tag_ice.png';
  static const ic_tag_normal = 'assets/images/ic_tag_normal.png';
  static const ic_tag_poison = 'assets/images/ic_tag_poison.png';
  static const ic_tag_psychic = 'assets/images/ic_tag_psychic.png';
  static const ic_tag_rock = 'assets/images/ic_tag_rock.png';
  static const ic_tag_steel = 'assets/images/ic_tag_steel.png';
  static const ic_tag_water = 'assets/images/ic_tag_water.png';
  static const ic_arrow_evolution = 'assets/images/ic_arrow_evolution.svg';

  static const img_bulbasaur = 'assets/images/img_bulbasaur.png';
  static const img_squirtle = 'assets/images/img_squirtle.png';
  static const img_ball = 'assets/images/img_ball.png';
}

enum PokemonTypes {
  bug(ImageAssets.ic_type_bug, ImageAssets.ic_tag_bug, kColorBug),
  dark(ImageAssets.ic_type_dark, ImageAssets.ic_tag_dark, kColorDark),
  dragon(ImageAssets.ic_type_dragon, ImageAssets.ic_tag_dragon, kColorDragon),
  electric(ImageAssets.ic_type_electric, ImageAssets.ic_tag_electric, kColorElectric),
  fairy(ImageAssets.ic_type_fairy, ImageAssets.ic_tag_fairy, kColorFairy),
  fight(ImageAssets.ic_type_fight, ImageAssets.ic_tag_fight, kColorFight),
  fire(ImageAssets.ic_type_fire, ImageAssets.ic_tag_fire, kColorFire),
  flying(ImageAssets.ic_type_flying, ImageAssets.ic_tag_flying, kColorFlying),
  ghost(ImageAssets.ic_type_ghost, ImageAssets.ic_tag_ghost, kColorGhost),
  grass(ImageAssets.ic_type_grass, ImageAssets.ic_tag_grass, kColorGrass),
  ground(ImageAssets.ic_type_ground, ImageAssets.ic_tag_ground, kColorGround),
  ice(ImageAssets.ic_type_ice, ImageAssets.ic_tag_ice, kColorIce),
  normal(ImageAssets.ic_type_normal, ImageAssets.ic_tag_normal, kColorNormal),
  poison(ImageAssets.ic_type_poison, ImageAssets.ic_tag_poison, kColorPoison),
  psychic(ImageAssets.ic_type_psychic, ImageAssets.ic_tag_psychic, kColorPsychic),
  rock(ImageAssets.ic_type_rock, ImageAssets.ic_tag_rock, kColorRock),
  steel(ImageAssets.ic_type_steel, ImageAssets.ic_tag_steel, kColorSteel),
  water(ImageAssets.ic_type_water, ImageAssets.ic_tag_water, kColorWater);

  const PokemonTypes(this.image, this.tagImage, this.color);
  final String image;
  final String tagImage;
  final Color color;

  static PokemonTypes getType(String type) {
    return PokemonTypes.values.firstWhere((element) => element.name == type);
  }
}