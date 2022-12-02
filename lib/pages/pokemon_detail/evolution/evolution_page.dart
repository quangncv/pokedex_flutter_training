import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/utils/theme.dart';

class EvolutionPage extends StatelessWidget {
  const EvolutionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          _BuildItemEvolution(),
          _BuildItemEvolution(),
        ],
      ),
    );
  }
}

class _BuildItemEvolution extends StatelessWidget {
  const _BuildItemEvolution({
    Key? key,
  }) : super(key: key);

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
                  Image.asset(ImageAssets.img_squirtle),
                  Text('Squirtle', style: PrimaryFont.book(15),)
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text('Lv.16', style: PrimaryFont.medium(14).copyWith(color: kColorWater),),
                SvgPicture.asset(ImageAssets.ic_arrow_evolution)
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(ImageAssets.img_squirtle),
                  Text('Squirtle', style: PrimaryFont.book(15),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
