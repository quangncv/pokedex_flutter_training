import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/common/constants.dart';

class PokemonTagWidget extends StatelessWidget {
  const PokemonTagWidget({Key? key, required this.type}) : super(key: key);

  final PokemonTypes type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(type.tagImage),
    );
  }
}
