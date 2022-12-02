import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/pokemon_type_widget.dart';

class MovesPage extends StatelessWidget {
  const MovesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _BuildItemMoves(),
        _BuildItemMoves(),
        _BuildItemMoves(),
        _BuildItemMoves(),
        _BuildItemMoves(),
      ],
    );
  }
}

class _BuildItemMoves extends StatelessWidget {
  const _BuildItemMoves({
    Key? key,
  }) : super(key: key);

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
                Text('Tackle', style: PrimaryFont.medium(19).copyWith(color: kColorPrimaryText),),
                Text('Level 1', style: PrimaryFont.book(15).copyWith(color: kColorSecondaryText),),
              ],
            ),
          ),
          const PokemonTypeWidget(type: PokemonTypes.normal,),
        ],
      ),
    );
  }
}
