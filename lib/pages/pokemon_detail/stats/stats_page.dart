import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/ability_widget.dart';
import 'package:pokedex_app/widgets/attribute_widget.dart';
import 'package:pokedex_app/widgets/pokemon_type_chart_widget.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        children: const [
          _BuildAttribute(),
          SizedBox(height: 20,),
          _BuildWeaknesses(),
          SizedBox(height: 20,),
          _BuildAbilities(),
          SizedBox(height: 20,),
          _BuildBreeding(),
          SizedBox(height: 20,),
          _BuildCapture(),
        ],
      ),
    );
  }
}

class _BuildAttribute extends StatelessWidget {
  const _BuildAttribute({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AttributeWidget(
          title: 'HP',
          value: 000,
        ),
        AttributeWidget(
          title: 'ATK',
          value: 000,
        ),
        AttributeWidget(
          title: 'DEF',
          value: 000,
        ),
        AttributeWidget(
          title: 'SATK',
          value: 000,
        ),
        AttributeWidget(
          title: 'SDEF',
          value: 000,
        ),
        AttributeWidget(
          title: 'SPD',
          value: 000,
        ),
      ],
    );
  }
}

class _BuildWeaknesses extends StatelessWidget {
  const _BuildWeaknesses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          childAspectRatio: 5/2,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            PokemonTypeChartWidget(type: PokemonTypes.bug, effectiveness: '1X'),
            PokemonTypeChartWidget(type: PokemonTypes.bug, effectiveness: '1X'),
            PokemonTypeChartWidget(type: PokemonTypes.bug, effectiveness: '1X'),
            PokemonTypeChartWidget(type: PokemonTypes.bug, effectiveness: '1X'),
            PokemonTypeChartWidget(type: PokemonTypes.bug, effectiveness: '1X'),
            PokemonTypeChartWidget(type: PokemonTypes.bug, effectiveness: '1X'),
            PokemonTypeChartWidget(type: PokemonTypes.bug, effectiveness: '1X'),
            PokemonTypeChartWidget(type: PokemonTypes.bug, effectiveness: '1X'),
            PokemonTypeChartWidget(type: PokemonTypes.bug, effectiveness: '1X'),
          ],
        ),
      ],
    );
  }
}

class _BuildAbilities extends StatelessWidget {
  const _BuildAbilities({Key? key}) : super(key: key);

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
        const SizedBox(height: 20,),
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            AbilityWidget(name: 'Torrent', desc: 'Powers up Water-type moves when the Pokémon is in trouble.',),
            Divider(),
            AbilityWidget(name: 'Rain Dish', desc: 'The Pokémon gradually regains HP in rain.',),
          ],
        ),
      ],
    );
  }
}

class _BuildBreeding extends StatelessWidget {
  const _BuildBreeding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Breeding',
          style: PrimaryFont.medium(20).copyWith(
            color: kColorWater,
          ),
        ),
        const SizedBox(height: 20,),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('Egg Group', style: PrimaryFont.medium(15).copyWith(color: kColorWater),),
                    Text('Monster\nWater I', style: PrimaryFont.book(15),)
                  ],
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    Text('Generation', style: PrimaryFont.medium(15).copyWith(color: kColorWater),),
                    Text('5101 Steps\n20 Cycles', style: PrimaryFont.book(15),)
                  ],
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    Text('Gender', style: PrimaryFont.medium(15).copyWith(color: kColorWater),),
                    Text('12.5%', style: PrimaryFont.book(15).copyWith(color: kColorFemale),),
                    Text('87.5%', style: PrimaryFont.book(15).copyWith(color: kColorMale),),
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
  const _BuildCapture({Key? key}) : super(key: key);

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
        const SizedBox(height: 20,),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('Habitat', style: PrimaryFont.medium(15).copyWith(color: kColorWater),),
                    Text('Waters-Edge', style: PrimaryFont.book(15),)
                  ],
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    Text('Generation', style: PrimaryFont.medium(15).copyWith(color: kColorWater),),
                    Text('Generation 1', style: PrimaryFont.book(15),)
                  ],
                ),
              ),
              const VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    Text('Capture Rate', style: PrimaryFont.medium(15).copyWith(color: kColorWater),),
                    Text('45%', style: PrimaryFont.book(15),)
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


