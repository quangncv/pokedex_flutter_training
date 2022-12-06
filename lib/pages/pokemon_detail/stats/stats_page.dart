import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/data/model/pokemon.dart';
import 'package:pokedex_app/data/model/response/type_response.dart';
import 'package:pokedex_app/extensions/string_ext.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/ability_widget.dart';
import 'package:pokedex_app/widgets/attribute_widget.dart';
import 'package:pokedex_app/widgets/pokemon_type_chart_widget.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          _BuildAttribute(
            pokemon: pokemon,
          ),
          const SizedBox(
            height: 20,
          ),
          _BuildWeaknesses(
            damageRelation: pokemon.damageRelations,
          ),
          const SizedBox(
            height: 20,
          ),
          _BuildAbilities(
            abilities: pokemon.abilities,
          ),
          const SizedBox(
            height: 20,
          ),
          _BuildBreeding(pokemon: pokemon,),
          const SizedBox(
            height: 20,
          ),
          _BuildCapture(pokemon: pokemon,),
        ],
      ),
    );
  }
}

class _BuildAttribute extends StatelessWidget {
  const _BuildAttribute({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AttributeWidget(
          title: 'HP',
          value: pokemon.stats?.first.baseStat ?? 0,
          color: pokemon.mainType().color,
          linearGradient: pokemon.mainType().bgGradient,
        ),
        AttributeWidget(
          title: 'ATK',
          value: pokemon.stats?[1].baseStat ?? 0,
          color: pokemon.mainType().color,
          linearGradient: pokemon.mainType().bgGradient,
        ),
        AttributeWidget(
          title: 'DEF',
          value: pokemon.stats?[2].baseStat ?? 0,
          color: pokemon.mainType().color,
          linearGradient: pokemon.mainType().bgGradient,
        ),
        AttributeWidget(
          title: 'SATK',
          value: pokemon.stats?[3].baseStat ?? 0,
          color: pokemon.mainType().color,
          linearGradient: pokemon.mainType().bgGradient,
        ),
        AttributeWidget(
          title: 'SDEF',
          value: pokemon.stats?[4].baseStat ?? 0,
          color: pokemon.mainType().color,
          linearGradient: pokemon.mainType().bgGradient,
        ),
        AttributeWidget(
          title: 'SPD',
          value: pokemon.stats?[5].baseStat ?? 0,
          color: pokemon.mainType().color,
          linearGradient: pokemon.mainType().bgGradient,
        ),
      ],
    );
  }
}

class _BuildWeaknesses extends StatelessWidget {
  _BuildWeaknesses({Key? key, required this.damageRelation}) : super(key: key);

  final DamageRelation? damageRelation;

  final weakness = <String, String>{
    'bug': '1X',
    'dark': '1X',
    'dragon': '1X',
    'electric': '1X',
    'fairy': '1X',
    'fighting': '1X',
    'fire': '1X',
    'flying': '1X',
    'ghost': '1X',
    'grass': '1X',
    'ground': '1X',
    'ice': '1X',
    'normal': '1X',
    'poison': '1X',
    'psychic': '1X',
    'rock': '1X',
    'steel': '1X',
    'water': '1X',
  };

  void init() {
    for (var element in damageRelation?.doubleDamageFrom ?? []) {
      weakness[element.name] = '2X';
    }
    for (var element in damageRelation?.halfDamageFrom ?? []) {
      weakness[element.name] = '1/2X';
    }
  }

  @override
  Widget build(BuildContext context) {
    init();

    final List<Widget> types = [];
    weakness.forEach((key, value) {
      types.add(PokemonTypeChartWidget(
          type: PokemonTypes.getType(key), effectiveness: value));
    });

    return Column(
      children: [
        Text(
          'Weaknesses',
          style: PrimaryFont.medium(20).copyWith(
            color: kColorWater,
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 5 / 2,
          physics: const NeverScrollableScrollPhysics(),
          children: types,
        ),
      ],
    );
  }
}

class _BuildAbilities extends StatelessWidget {
  const _BuildAbilities({Key? key, required this.abilities}) : super(key: key);

  final List<Ability>? abilities;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Abilities',
          style: PrimaryFont.medium(20).copyWith(
            color: kColorWater,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: abilities?.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AbilityWidget(
                    name: abilities?[index].name ?? '',
                    desc: abilities?[index].desc ?? ''),
                if (index < (abilities?.length ?? 0) - 1)
                  const Divider(
                    color: kColorDivider,
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _BuildBreeding extends StatelessWidget {
  const _BuildBreeding({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    var eggGroups = '';
    for(var i = 0; i < (pokemon.eggGroups?.length ?? 0); i++) {
      eggGroups += pokemon.eggGroups?[i].capitalize() ?? '';
      if (i < (pokemon.eggGroups?.length ?? 0) - 1) {
        eggGroups += '\n';
      }
    }

    return Column(
      children: [
        Text(
          'Breeding',
          style: PrimaryFont.medium(20).copyWith(
            color: kColorWater,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Egg Group',
                      style:
                          PrimaryFont.medium(15).copyWith(color: kColorWater),
                    ),
                    Text(
                      eggGroups,
                      style: PrimaryFont.book(15),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Hatch Time',
                      style:
                          PrimaryFont.medium(15).copyWith(color: kColorWater),
                    ),
                    Text(
                      '${pokemon.getSteps()} Steps\n${pokemon.hatchCounter} Cycles',
                      style: PrimaryFont.book(15),
                    )
                  ],
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Gender',
                      style:
                          PrimaryFont.medium(15).copyWith(color: kColorWater),
                    ),
                    Text(
                      '${pokemon.femaleRatio()}%',
                      style: PrimaryFont.book(15).copyWith(color: kColorFemale),
                    ),
                    Text(
                      '${pokemon.maleRatio()}%',
                      style: PrimaryFont.book(15).copyWith(color: kColorMale),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BuildCapture extends StatelessWidget {
  const _BuildCapture({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Capture',
          style: PrimaryFont.medium(20).copyWith(
            color: kColorWater,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Habitat',
                      style:
                          PrimaryFont.medium(15).copyWith(color: kColorWater),
                    ),
                    Text(
                      pokemon.habitat.toString().capitalize(),
                      style: PrimaryFont.book(15),
                    )
                  ],
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Generation',
                      style:
                          PrimaryFont.medium(15).copyWith(color: kColorWater),
                    ),
                    Text(
                      pokemon.getGeneration().capitalize(),
                      style: PrimaryFont.book(15),
                    )
                  ],
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Capture Rate',
                      style:
                          PrimaryFont.medium(15).copyWith(color: kColorWater),
                    ),
                    Text(
                      '${pokemon.captureRate}%',
                      style: PrimaryFont.book(15),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
