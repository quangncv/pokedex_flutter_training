import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/data/model/pokemon.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository.dart';
import 'package:pokedex_app/pages/pokemon_detail/bloc/pokemon_detail_state.dart';

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  late PokemonRepository _pokemonRepository;
  PokemonDetailCubit({required PokemonRepository pokemonRepository}):super(PokemonDetailInitial()) {
    _pokemonRepository = pokemonRepository;
  }

  Future<void> getPokemon(Pokemon pokemon) async {
    try {
      emit(PokemonDetailLoading());
      final data = await _pokemonRepository.getInfoPokemon(pokemon);
      emit(PokemonDetailLoaded(data));
    } catch (ex) {
      emit(PokemonDetailError(ex.toString()));
    }
  }
}