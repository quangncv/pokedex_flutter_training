import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/data/model/pokemon.dart';
import 'package:pokedex_app/extensions/string_ext.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/pokemon_type_widget.dart';

class MovesPage extends StatelessWidget {
  const MovesPage({Key? key, this.moves}) : super(key: key);

  final List<Move>? moves;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: moves?.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _BuildItemMoves(move: moves?[index],);
      },
    );
  }
}

class _BuildItemMoves extends StatelessWidget {
  const _BuildItemMoves({
    Key? key, required this.move,
  }) : super(key: key);

  final Move? move;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: kColorDivider))),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  move?.name.toString().capitalize() ?? '',
                  style:
                      PrimaryFont.medium(19).copyWith(color: kColorPrimaryText),
                ),
                Text(
                  'Level ${move?.level}',
                  style:
                      PrimaryFont.book(15).copyWith(color: kColorSecondaryText),
                ),
              ],
            ),
          ),
          PokemonTypeWidget(
            type: PokemonTypes.getType(move?.type ?? 'normal'),
          ),
        ],
      ),
    );
  }
}
