import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/data/model/pokemon.dart';
import 'package:pokedex_app/extensions/string_ext.dart';
import 'package:pokedex_app/utils/theme.dart';

class EvolutionPage extends StatelessWidget {
  const EvolutionPage({Key? key, this.evolutions}) : super(key: key);

  final List<Evolution>? evolutions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: evolutions?.length,
        itemBuilder: (context, index) {
          return _BuildItemEvolution(
            evolution: evolutions?[index],
          );
        },
      ),
    );
  }
}

class _BuildItemEvolution extends StatelessWidget {
  const _BuildItemEvolution({
    Key? key,
    required this.evolution,
  }) : super(key: key);

  final Evolution? evolution;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: kColorDivider)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.network('$pokemonImageUrl${evolution?.id}.png'),
                  Text(
                    evolution?.name.toString().capitalize() ?? '',
                    style: PrimaryFont.book(15),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  evolution?.getEvolutionDetail() ?? '',
                  style: PrimaryFont.medium(14).copyWith(color: kColorWater),
                ),

                SvgPicture.asset(ImageAssets.ic_arrow_evolution)
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.network(
                      '$pokemonImageUrl${evolution?.evolvesToId}.png'),
                  Text(
                    evolution?.evolvesToName.toString().capitalize() ?? '',
                    style: PrimaryFont.book(15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
