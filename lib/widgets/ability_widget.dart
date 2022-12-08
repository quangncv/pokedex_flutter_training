import 'package:flutter/material.dart';
import 'package:pokedex_app/extensions/string_ext.dart';
import 'package:pokedex_app/utils/theme.dart';

class AbilityWidget extends StatelessWidget {
  const AbilityWidget({Key? key, required this.name, required this.desc, required this.color}) : super(key: key);

  final String name;
  final String desc;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name.capitalize(), style: PrimaryFont.medium(15).copyWith(color: color),),
        Text(desc, style: PrimaryFont.book(15).copyWith(color: kColorPrimaryText),)
      ],
    );
  }
}
