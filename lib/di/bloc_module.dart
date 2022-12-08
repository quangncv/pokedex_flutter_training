import 'package:pokedex_app/di/injection.dart';
import 'package:pokedex_app/pages/moves/bloc/moves_list_cubit.dart';
import 'package:pokedex_app/pages/pokemon/bloc/pokemon_list_cubit.dart';
import 'package:pokedex_app/pages/pokemon_detail/bloc/pokemon_detail_cubit.dart';

abstract class BlocModule {
  static Future<void> init() async {
    getIt.registerFactory<PokemonListCubit>(() => PokemonListCubit(pokemonRepository: getIt()));
    getIt.registerFactory<MovesListCubit>(() => MovesListCubit(moveRepository: getIt()));
    getIt.registerFactory<PokemonDetailCubit>(() => PokemonDetailCubit(pokemonRepository: getIt()));
  }
}