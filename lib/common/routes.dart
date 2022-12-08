import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokedex_app/data/model/move.dart';
import 'package:pokedex_app/data/model/pokemon.dart';
import 'package:pokedex_app/pages/home/home_page.dart';
import 'package:pokedex_app/pages/moves/move_detail/move_detail_page.dart';
import 'package:pokedex_app/pages/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokedex_app/pages/splash/splash_page.dart';


Route<dynamic> generatorRoute(RouteSettings settings) {
  final args = settings.arguments;
  log('args: ${settings.arguments}');
  var routes = <String, WidgetBuilder>{
    '$SplashPage': (context) => const SplashPage(),
    '$HomePage': (context) => const HomePage(),
    '$PokemonDetailPage': (context) => PokemonDetailPage(pokemon: args as Pokemon),
    '$MoveDetailPage': (context) => MoveDetailPage(move: args as Move,),
  };

  WidgetBuilder? builder = routes[settings.name];

  return builder != null
      ? MaterialPageRoute(builder: (context) => builder(context))
      : MaterialPageRoute(builder: (context) => const SplashPage());
}
