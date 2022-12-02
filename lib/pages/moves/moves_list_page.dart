import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/appbar_search_widget.dart';
import 'package:pokedex_app/widgets/pokemon_type_widget.dart';

class MovesListPage extends StatefulWidget {
  const MovesListPage({Key? key}) : super(key: key);

  @override
  State<MovesListPage> createState() => _MovesListPageState();
}

class _MovesListPageState extends State<MovesListPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarSearchWidget(
          title: 'Moves',
        ),
        Expanded(
          child: ListView(
            children: const [
              _BuildItemMoves(name: 'Tackle', type: PokemonTypes.steel,),
              _BuildItemMoves(name: 'Tackle', type: PokemonTypes.steel,),
              _BuildItemMoves(name: 'Tackle', type: PokemonTypes.steel,),
              _BuildItemMoves(name: 'Tackle', type: PokemonTypes.steel,),
              _BuildItemMoves(name: 'Tackle', type: PokemonTypes.steel,),
              _BuildItemMoves(name: 'Tackle', type: PokemonTypes.steel,),
            ],
          ),
        ),
      ],
    );
  }
}

class _BuildItemMoves extends StatelessWidget {
  const _BuildItemMoves({Key? key, required this.name, required this.type}) : super(key: key);

  final String name;
  final PokemonTypes type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: kColorDivider)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(name, style: PrimaryFont.medium(19),),
            ),
            PokemonTypeWidget(type: type,),
          ],
        ),
      ),
    );
  }
}
