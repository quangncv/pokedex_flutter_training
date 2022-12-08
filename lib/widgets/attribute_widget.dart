import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex_app/utils/theme.dart';

class AttributeWidget extends StatelessWidget {
  const AttributeWidget(
      {Key? key,
      required this.title,
      required this.value,
      required this.color,
      required this.linearGradient})
      : super(key: key);

  final String title;
  final int value;
  final Color color;
  final LinearGradient linearGradient;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: PrimaryFont.heavy(12).copyWith(
              color: color,
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: LinearPercentIndicator(
            animation: true,
            animationDuration: 1000,
            leading: Text(
              value.toString().padLeft(3, '0'),
              style: PrimaryFont.book(14).copyWith(color: kColorValueText),
            ),
            percent: value / 255,
            lineHeight: 10,
            barRadius: const Radius.circular(4),
            backgroundColor: kColorLightGrey,
            linearGradient: linearGradient,
          ),
        ),
      ],
    );
  }
}
