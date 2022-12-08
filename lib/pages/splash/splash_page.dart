import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/common/constants.dart';
import 'package:pokedex_app/pages/home/home_page.dart';
import 'package:pokedex_app/widgets/default_background_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    directToHome();
  }

  void directToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil('$HomePage', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultBackgroundWidget(
      child: Center(
        child: SvgPicture.asset(ImageAssets.ic_logo),
      ),
    );
  }
}

