import 'package:flutter/material.dart';
import 'package:pokedex_app/pages/home/home_page.dart';
import 'package:pokedex_app/pages/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokedex_app/pages/splash/splash_page.dart';

Map<String, WidgetBuilder> routes = {
  '$SplashPage': (context) => const SplashPage(),
  '$HomePage': (context) => const HomePage(),
  '$PokemonDetailPage': (context) => const PokemonDetailPage(),
};