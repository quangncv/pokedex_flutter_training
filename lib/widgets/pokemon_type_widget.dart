import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';

class PokemonTypeWidget extends StatelessWidget {
  const PokemonTypeWidget({Key? key, required this.type}) : super(key: key);

  final PokemonTypes type;

  @override
  Widget build(BuildContext context) {
    return Image.asset(type.image);
  }
}
