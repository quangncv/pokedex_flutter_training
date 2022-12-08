import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/common/constants.dart';

class PokemonTypeWidget extends StatelessWidget {
  const PokemonTypeWidget({Key? key, required this.type}) : super(key: key);

  final PokemonTypes type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: SvgPicture.asset(type.image, width: 40, height: 40,),
    );
  }
}
