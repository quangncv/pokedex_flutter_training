import 'package:flutter/material.dart';
import 'package:pokedex_app/utils/theme.dart';
import 'package:pokedex_app/widgets/appbar_search_widget.dart';

class DefaultBackgroundWidget extends StatefulWidget {
  const DefaultBackgroundWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<DefaultBackgroundWidget> createState() => _DefaultBackgroundWidgetState();
}

class _DefaultBackgroundWidgetState extends State<DefaultBackgroundWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: PrimaryGradient.defaultGradientBackground,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: kColorDarkWhite80,
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

