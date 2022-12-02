import 'package:flutter/material.dart';
import 'package:pokedex_app/common/constants.dart';

class PokemonTagWidget extends StatelessWidget {
  const PokemonTagWidget({Key? key, required this.type}) : super(key: key);

  final PokemonTypes type;

  @override
  Widget build(BuildContext context) {
    return Image.asset(type.tagImage);
  }
}
