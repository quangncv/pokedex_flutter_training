import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/pokemon_type_widget.dart';

class PokemonTypeChartWidget extends StatelessWidget {
  const PokemonTypeChartWidget({Key? key, required this.type, required this.effectiveness}) : super(key: key);

  final PokemonTypes type;
  final String effectiveness;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PokemonTypeWidget(type: type,),
        Text(effectiveness, style: PrimaryFont.book(20),),
      ],
    );
  }
}
